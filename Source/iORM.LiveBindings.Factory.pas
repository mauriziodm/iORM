{
  ****************************************************************************
  *                                                                          *
  *           iORM - (interfaced ORM)                                        *
  *                                                                          *
  *           Copyright (C) 2015-2023 Maurizio Del Magno                     *
  *                                                                          *
  *           mauriziodm@levantesw.it                                        *
  *           mauriziodelmagno@gmail.com                                     *
  *           https://github.com/mauriziodm/iORM.git                         *
  *                                                                          *
  ****************************************************************************
  *                                                                          *
  * This file is part of iORM (Interfaced Object Relational Mapper).         *
  *                                                                          *
  * Licensed under the GNU Lesser General Public License, Version 3;         *
  *  you may not use this file except in compliance with the License.        *
  *                                                                          *
  * iORM is free software: you can redistribute it and/or modify             *
  * it under the terms of the GNU Lesser General Public License as published *
  * by the Free Software Foundation, either version 3 of the License, or     *
  * (at your option) any later version.                                      *
  *                                                                          *
  * iORM is distributed in the hope that it will be useful,                  *
  * but WITHOUT ANY WARRANTY; without even the implied warranty of           *
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            *
  * GNU Lesser General Public License for more details.                      *
  *                                                                          *
  * You should have received a copy of the GNU Lesser General Public License *
  * along with iORM.  If not, see <http://www.gnu.org/licenses/>.            *
  *                                                                          *
  ****************************************************************************
}
unit iORM.LiveBindings.Factory;

interface

uses
  iORM.LiveBindings.Interfaces, iORM.CommonTypes, System.Classes, System.Generics.Collections, iORM.Context.Properties.Interfaces,
  Data.Bind.ObjectScope, iORM.Utilities,
  iORM.Where.Interfaces, iORM.LiveBindings.CommonBSAPaging;

type

  TioLiveBindingsFactory = class
  public
    class function DetailAdaptersContainer(const AMasterAdapter: IioContainedBindSourceAdapter): IioDetailBindSourceAdaptersContainer;
    class function ContainedListBindSourceAdapter(const ABindSource: IioBindSource; const AMasterProperty: IioProperty): IioContainedBindSourceAdapter;
    class function ContainedObjectBindSourceAdapter(const ABindSource: IioBindSource; const AMasterProperty: IioProperty): IioContainedBindSourceAdapter;
    class function NaturalObjectBindSourceAdapter(const ABindSource: IioBindSource; const ASourceActiveBSA: IioActiveBindSourceAdapter): IioActiveBindSourceAdapter;
    class function GetNaturalBSAfromMasterBindSource(const ABindSource: IioBindSource; const AMasterBS: IioBindSource): IioActiveBindSourceAdapter;
    class function GetDetailBSAfromMasterBindSource(const ABindSource, AMasterBindSource: IioBindSource; const AMasterPropertyName: String): IioActiveBindSourceAdapter;
    class function GetBSA(const ABindSource: IioBindSource; const ADataObject: TObject; const AOwnsObject: Boolean): IioActiveBindSourceAdapter;
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
  iORM.Context.Container,

  iORM.LiveBindings.ActiveInterfaceListBindSourceAdapter,
  iORM.LiveBindings.ActiveInterfaceObjectBindSourceAdapter,
  System.SysUtils, iORM.Exceptions, iORM.LiveBindings.BSAToDataSetLink,
  iORM.LiveBindings.NaturalActiveInterfaceObjectBindSourceAdapter;

{ TioLiveBindingsFactory }

class function TioLiveBindingsFactory.BSAToDataSetLinkContainer: IioBSAToDataSetLinkContainer;
begin
  Result := TioBSAToDataSetLinkContainer.Create;
end;

class function TioLiveBindingsFactory.ContainedListBindSourceAdapter(const ABindSource: IioBindSource; const AMasterProperty: IioProperty): IioContainedBindSourceAdapter;
begin
  // Setthe BindSOurce TypeName & TypeAlias
  ABindSource.TypeName := AMasterProperty.GetRelationChildTypeName;
  ABindSource.TypeAlias := AMasterProperty.GetRelationChildTypeAlias;
  // If the master property type is an interface... else if the master property type is a class
  if TioUtilities.IsAnInterfaceTypeName(ABindSource.TypeName) then
    Result := TioActiveInterfaceListBindSourceAdapter.Create(ABindSource, TList<IInterface>.Create, True)
  else
    Result := TioActiveListBindSourceAdapter.Create(ABindSource, TList<TObject>.Create, True);
  // Set MasterProperty
  ABindSource.MasterPropertyName := AMasterProperty.GetName;
end;

class function TioLiveBindingsFactory.ContainedObjectBindSourceAdapter(const ABindSource: IioBindSource; const AMasterProperty: IioProperty): IioContainedBindSourceAdapter;
begin
  // Setthe BindSOurce TypeName & TypeAlias
  ABindSource.TypeName := AMasterProperty.GetRelationChildTypeName;
  ABindSource.TypeAlias := AMasterProperty.GetRelationChildTypeAlias;
  // If the master property type is an interface... else if the master property type is a class
  if TioUtilities.IsAnInterfaceTypeName(ABindSource.TypeName) then
    Result := TioActiveInterfaceObjectBindSourceAdapter.Create(ABindSource, nil, False)
  else
    Result := TioActiveObjectBindSourceAdapter.Create(ABindSource, nil, True);
  // Set MasterProperty
  ABindSource.MasterPropertyName := AMasterProperty.GetName;
end;

class function TioLiveBindingsFactory.DetailAdaptersContainer(const AMasterAdapter: IioContainedBindSourceAdapter): IioDetailBindSourceAdaptersContainer;
begin
  Result := TioDetailAdaptersContainer.Create(AMasterAdapter);
end;

class function TioLiveBindingsFactory.GetBSA(const ABindSource: IioBindSource; const ADataObject: TObject; const AOwnsObject: Boolean): IioActiveBindSourceAdapter;
var
  LIntfDataObject: IInterface;
  LDataObject: TObject;
begin
  // Check for type name
  if ABindSource.TypeName.IsEmpty then
    raise EioGenericException.Create(ClassName, 'GetBSA',
      Format('In component "%s" the "LoadType" property has been set to "ltAuto" or "ltManual" but the "TypeName" property has been left blank.'
      + #13#13'iORM is therefore unable to load (from the RDBMS) the instance to expose for binding.'#13#13'Please set the property and then try again.',
      [ABindSource.GetName]));

  // Depending of the DataType (list or single object)...
  case ABindSource.TypeOfCollection of

    // LIST
    TioTypeOfCollection.tcList:
      begin
        // Interfaced
        if TioUtilities.IsAnInterfaceTypeName(ABindSource.TypeName) then
        begin
          if Assigned(ADataObject) then
            LDataObject := ADataObject
          else
            LDataObject := TList<IInterface>.Create;
          Result := TioActiveInterfaceListBindSourceAdapter.Create(ABindSource, LDataObject, AOwnsObject);
        end
        // Class
        else
        begin
          if Assigned(ADataObject) then
            LDataObject := ADataObject
          else
            LDataObject := TObjectList<TObject>.Create(True);
          Result := TioActiveListBindSourceAdapter.Create(ABindSource, TObjectList<TObject>(LDataObject), AOwnsObject);
        end;
      end;

    // SINGLE OBJECT
    TioTypeOfCollection.tcSingleObject:
      begin
        // Interfaced
        if TioUtilities.IsAnInterfaceTypeName(ABindSource.TypeName) then
        begin
          if Assigned(ADataObject) and not Supports(ADataObject, IInterface, LIntfDataObject) then
            raise EioGenericException.Create(Self.ClassName, 'GetBSA', 'TypeName is an interface but ADataObject does not implement any interface.');
          Result := TioActiveInterfaceObjectBindSourceAdapter.Create(ABindSource, LIntfDataObject, False);
        end
        // Class
        else
        begin
          Result := TioActiveObjectBindSourceAdapter.Create(ABindSource, ADataObject, AOwnsObject);
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

class function TioLiveBindingsFactory.NaturalObjectBindSourceAdapter(const ABindSource: IioBindSource; const ASourceActiveBSA: IioActiveBindSourceAdapter): IioActiveBindSourceAdapter;
begin
  if ASourceActiveBSA.IsInterfaceBSA then
    Result := TioNaturalActiveInterfaceObjectBindSourceAdapter.Create(ABindSource, ASourceActiveBSA)
  else
    Result := TioNaturalActiveObjectBindSourceAdapter.Create(ABindSource, ASourceActiveBSA);
end;

class function TioLiveBindingsFactory.GetNaturalBSAfromMasterBindSource(const ABindSource: IioBindSource; const AMasterBS: IioBindSource): IioActiveBindSourceAdapter;
begin
  // Check if the MasterBS property is set
  if not Assigned(AMasterBS) then
    raise EioGenericException.Create(ClassName, 'GetNaturalBSAfromMasterBindSource',
      Format('In component "%s" the "LoadType" property has been set to one of this values ("ltFromBSAsIs" or "ltFromBSReload" or "ltFromBSReloadNewInstance") but the "SourceXXX" property (maybe SourceDataSet, SourcePBS or SourcePresenter) has been left blank.'
      + #13#13'iORM is therefore unable to find the instance to expose for binding.'#13#13'Please set the "SourceXXX" property of bind source "%s" and then try again.',
      [ABindSource.GetName, ABindSource.GetName]));
  // Return the requested natural bind source adapter
  Result := AMasterBS.GetActiveBindSourceAdapter.NewNaturalObjectBindSourceAdapter(ABindSource);
end;

class function TioLiveBindingsFactory.GetDetailBSAfromMasterBindSource(const ABindSource, AMasterBindSource: IioBindSource; const AMasterPropertyName: String): IioActiveBindSourceAdapter;
begin
  // Check if the MasterPropertyName property is set
  if AMasterPropertyName.IsEmpty then
   raise EioGenericException.Create(ClassName, 'GetDetailBSAfromMasterBindSource',
     Format('The "MasterPropertyName" property has not been set in the component "%s".'
      + #13#13'iORM is therefore unable to find the instance to expose for binding.'#13#13'Please set the property and try again.',
     [ABindSource.GetName]));
  // Return the requested bind source adapter
  Result := AMasterBindSource.GetActiveBindSourceAdapter.NewDetailBindSourceAdapter(ABindSource, AMasterPropertyName);
end;

end.
