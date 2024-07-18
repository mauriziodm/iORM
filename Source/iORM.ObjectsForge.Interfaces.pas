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
unit iORM.ObjectsForge.Interfaces;

interface

uses
  iORM.Context.Properties.Interfaces,
  iORM.Context.Interfaces,
  iORM.DB.Interfaces,
  System.Rtti, iORM.CommonTypes, iORM.DependencyInjection.Implementers,
  iORM.MVVM.Interfaces;

type
  // ClassRef to ObjectMaker
  TioObjectMakerRef = class of TioObjectMakerIntf;

  // ObjectMaker interface
  TioObjectMakerIntf = class abstract
  strict protected
//    class function CheckOrCreateRelationChildObject(const AContext: IioContext; const AProperty: IioProperty): TObject;
    class procedure InitializeObjectAfterCreate(const AObj: TObject; const AContainerItem: TioDIContainerImplementersItem);
    class procedure LoadPropertyHasMany(AContext: IioContext; AQuery: IioQuery; AProperty: IioProperty);
    class procedure LoadPropertyEmbeddedHasMany(AContext: IioContext; AQuery: IioQuery; AProperty: IioProperty);
    class procedure LoadPropertyStreamable(AContext: IioContext; AQuery: IioQuery; AProperty: IioProperty);
    class procedure LoadPropertyStream(AContext: IioContext; AQuery: IioQuery; AProperty: IioProperty);
    class function LoadPropertyHasOne(AContext: IioContext; AQuery: IioQuery; AProperty: IioProperty): TObject;
    class function LoadPropertyBelongsTo(AContext: IioContext; AQuery: IioQuery; AProperty: IioProperty): TObject;
    class function LoadPropertyEmbeddedHasOne(AContext: IioContext; AQuery: IioQuery; AProperty: IioProperty): TObject;
    class function InternalFindMethod(ARttiType: TRttiType; AMethodName, AMarkerText: String; IsConstructor: Boolean; const AParameters: Array of TValue)
      : TRttiMethod;
    class function FindConstructor(ARttiType: TRttiType; const AParameters: Array of TValue; AMarkerText: String = ''; AMethodName: String = ''): TRttiMethod;
    class function FindMethod(ARttiType: TRttiType; AMethodName: String; const AParameters: Array of TValue; AMarkerText: String = ''): TRttiMethod;
  public
    class procedure InitializeViewModelPresentersAfterCreate(const AViewModelOrSimpleView: TObject; const APresenterSettingsPointer: PioDIPresenterSettingsContainer);
    class function CreateObjectFromBlobField(AQuery: IioQuery; AProperty: IioProperty): TObject;
    class function CreateObjectByClassRef(AClassRef: TClass): TObject;
    class function CreateObjectByClassRefEx(AClassRef: TClass; const AConstructorParams: array of TValue; AConstructorMarkerText: String = '';
      AConstructorMethodName: String = ''; AContainerItem: TioDIContainerImplementersItem = nil): TObject;
    class function CreateObjectByRttiType(ARttiType: TRttiType): TObject;
    class function CreateObjectByRttiTypeEx(ARttiType: TRttiType; const AConstructorParams: array of TValue; AConstructorMarkerText: String;
      AConstructorMethodName: String; AContainerItem: TioDIContainerImplementersItem = nil): TObject;
    class function CreateListByClassRef(AClassRef: TClass; AOwnsObjects: Boolean = True): TObject;
    class function CreateListByRttiType(const ARttiType: TRttiType; const AOwnsObject: Boolean = True): TObject;
    class function MakeObject(const AContext: IioContext; const AQuery: IioQuery): TObject; virtual; abstract;
  end;

implementation

uses
  System.TypInfo, iORM.Exceptions, iORM, iORM.RttiContext.Factory,
  iORM.DuckTyped.Interfaces, iORM.DuckTyped.Factory, System.Classes,
  Data.DB, iORM.LazyLoad.Interfaces, System.SysUtils, iORM.Attributes,
  iORM.Resolver.Interfaces, iORM.Resolver.Factory, System.JSON,
  iORM.ObjectsForge.Factory, iORM.Context.Container, iORM.Utilities,
  iORM.LiveBindings.Interfaces, iORM.MVVM.ModelPresenter.Custom,
  iORM.Where.Interfaces, iORM.MVVM.ViewModelBridge, iORM.MVVM.ViewModel,
  DJSON, iORM.LiveBindings.BSPersistence;

{ TioObjectMakerIntf }

// NB: In caso di "ChildPropertyPath" non vuoto crea l'istanza dell'oggetto finale (ultimo livello) a cui
// la MasterProperty si riferisce indirettamente, sarà compito della classe master e delle classi
// "attraversate" il creare tutti gli eventuali oggetti facenti parte del percorso per raggiungere
// la ChildProperty destinazione.
//class function TioObjectMakerIntf.CheckOrCreateRelationChildObject(const AContext: IioContext; const AProperty: IioProperty): TObject;
//begin
//  // Get the child object if already assigned
//  Result := AProperty.GetRelationChildObject(AContext.DataObject);
//  // If the AProperty is of interface type...
//  if AProperty.IsInterface then
//  begin
//    // Create the child object/list if it isn't not already created by the master class constructor
//    if not Assigned(Result) then
//      Result := io.di.Locate(AProperty.GetTypeName).Alias(AProperty.GetTypeAlias).Get;
//    TioUtilities.ObjectAsIInterface(Result)._AddRef;
//  end
//  else
//  // If the AProperty is of instance (class) type...
//  begin
//    // Create the child object/list if it isn't not already created by the master class constructor
//    if not Assigned(Result) then
//      if AProperty.GetRelationType = rtHasMany then
//        Result := Self.CreateListByRttiType(AProperty.GetRttiType)
//      else
//        Result := Self.CreateObjectByRttiType(AProperty.GetRttiType);
//  end;
//end;

class function TioObjectMakerIntf.CreateListByClassRef(AClassRef: TClass; AOwnsObjects: Boolean): TObject;
begin
  Result := Self.CreateListByRttiType(TioRttiFactory.GetRttiContext.GetType(AClassRef), AOwnsObjects);
end;

class function TioObjectMakerIntf.CreateListByRttiType(const ARttiType: TRttiType; const AOwnsObject: Boolean): TObject;
var
  Prop: TRttiProperty;
begin
  inherited;
  // Proprerty "OwnsObjects" by Rtti
  Prop := ARttiType.GetProperty('OwnsObjects');
  // Create object
  Result := Self.CreateObjectByRttiType(ARttiType);
  // Set "OwnsObjects" if exists
  if Assigned(Prop) then
    Prop.SetValue(PTypeInfo(Result), AOwnsObject);
end;

class function TioObjectMakerIntf.CreateObjectByClassRef(AClassRef: TClass): TObject;
begin
  Result := Self.CreateObjectByClassRefEx(AClassRef, []);
end;

class function TioObjectMakerIntf.CreateObjectByClassRefEx(AClassRef: TClass; const AConstructorParams: array of TValue;
  AConstructorMarkerText, AConstructorMethodName: String; AContainerItem: TioDIContainerImplementersItem): TObject;
begin
  // Create object
  Result := Self.CreateObjectByRttiTypeEx(TioRttiFactory.GetRttiContext.GetType(AClassRef), AConstructorParams, AConstructorMarkerText, AConstructorMethodName,
    AContainerItem);
end;

class function TioObjectMakerIntf.CreateObjectByRttiType(ARttiType: TRttiType): TObject;
begin
  Result := Self.CreateObjectByRttiTypeEx(ARttiType, [], '', '');
end;

class function TioObjectMakerIntf.CreateObjectByRttiTypeEx(ARttiType: TRttiType; const AConstructorParams: array of TValue;
  AConstructorMarkerText, AConstructorMethodName: String; AContainerItem: TioDIContainerImplementersItem = nil): TObject;
var
  LMethod: TRttiMethod;
begin
  // init
  // Result := nil;
  // Find the constructor
  LMethod := Self.FindConstructor(ARttiType, AConstructorParams, AConstructorMarkerText, AConstructorMethodName);
  // If constructor not found...
  if not Assigned(LMethod) then
    raise EioGenericException.Create(Self.ClassName, 'CreateObjectByRttiTypeEx', 'Constructor not found for class "' + ARttiType.Name + '"');
  // Execute
   Result := LMethod.Invoke(ARttiType.AsInstance.MetaclassType, AConstructorParams).AsObject;
  // Inject Properties/Fields: if the received ContainerItem is not assigned then
  // try to retrieve it from MapContainer
  // Inject ModelPresenters settings for ViewModels only.
  if (not Assigned(AContainerItem)) and TioMapContainer.Exist(ARttiType.Name) then
    AContainerItem := TioMapContainer.GetMap(ARttiType.Name).GetDIContainerImplementersItem;
  if Assigned(AContainerItem) then
    Self.InitializeObjectAfterCreate(Result, AContainerItem);
end;

class procedure TioObjectMakerIntf.InitializeViewModelPresentersAfterCreate(const AViewModelOrSimpleView: TObject; const APresenterSettingsPointer: PioDIPresenterSettingsContainer);
var
  LViewModelOrSimpleView: TComponent;
//  LBSA: IioActiveBindSourceAdapter;
  LWhere: IioWhere;
  LName: String;
  LTargetBS, LParamBS: IioBindSource;
  LTargetMasterBS, LParamMasterBS: IioMasterBindSource;
  LIntf: IInterface;
  I: Integer;
  LPresenterSettings: TioDIPresenterSettingsContainer;
begin
  // **********************************************
  // **********************************************
  // ***                                        ***
  // *** DO NOT USE IioViewModel INTERFACE HERE ***
  // ***                                        ***
  // **********************************************
  // **********************************************
  if AViewModelOrSimpleView is TComponent then
    LViewModelOrSimpleView := TComponent(AViewModelOrSimpleView)
  else
    raise EioGenericException.Create(ClassName, 'InitializeViewModelPresentersAfterCreate', Format('Class "%s" is not a TComponent descendant.', [AViewModelOrSimpleView.ClassName]));
  // Extract PresenterSettings
  LPresenterSettings := APresenterSettingsPointer^;
  // Loop for all settings
  for I := 0 to Length(LPresenterSettings) - 1 do
  begin
    LName := LPresenterSettings[I].Name;
    LTargetBS := TioUtilities.GetBindSource(LViewModelOrSimpleView, LName);
    case LPresenterSettings[I].SettingsType of
      // DataObject
      TioDIPresenterSettingsType.pstDataObject:
        LTargetBS.SetDataObject(LPresenterSettings[I].Obj);
      // InterfacedObject
      TioDIPresenterSettingsType.pstInterfacedObj:
        LTargetBS.SetDataObject(LPresenterSettings[I].InterfacedObj);
      // MasterModelPresenter
      TioDIPresenterSettingsType.pstMasterModelPresenter:
        begin
          if Supports(LPresenterSettings[I].Obj, IioBindSource, LParamBS) then
          begin
            LTargetBS.SetMasterBindSource(LParamBS);
            LTargetBS.SetMasterPropertyName(LPresenterSettings[I].StringParameter);
            if LParamBS.IsActive then
              LTargetBS.Open;
          end
          else
            raise EioGenericException.Create(ClassName, 'InitializeViewModelPresentersAfterCreate', Format('The object of class "%s" is not a "IioBindSource" interface implementer.', [LPresenterSettings[I].Obj.ClassName]));
        end;
      // Where
      TioDIPresenterSettingsType.pstWhere:
        begin
          LIntf := LPresenterSettings[I].InterfacedObj;
          if not Supports(LIntf, IioWhere, LWhere) then
            raise EioGenericException.Create(Self.ClassName, 'InitializeViewModelPresentersAfterCreate', 'Interface "IioWhere" not implemented by object.');
          LTargetBS.SetWhere(LWhere);
        end;
      // SelectorFor
      TioDIPresenterSettingsType.pstSelectorFor:
        begin
          if Supports(LPresenterSettings[I].Obj, IioBindSource, LParamBS) then
            LTargetBS.SetSelectorFor(LParamBS)
          else
            raise EioGenericException.Create(ClassName, 'InitializeViewModelPresentersAfterCreate', Format('The object of class "%s" is not a "IioBindSource" interface implementer.', [LPresenterSettings[I].Obj.ClassName]));
        end;
      // WhereBuilderFor
      TioDIPresenterSettingsType.pstWhereBuilderFor:
        begin
          if Supports(LTargetBS, IioMasterBindSource, LTargetMasterBS) and Supports(LPresenterSettings[I].Obj, IioMasterBindSource, LParamMasterBS) then
            LTargetMasterBS.SetWhereBuilderFor(LParamMasterBS)
          else
            raise EioGenericException.Create(ClassName, 'InitializeViewModelPresentersAfterCreate', Format('The object of class "%s" is not a "IioBindSource" interface implementer.', [LPresenterSettings[I].Obj.ClassName]));
        end;
      // ETMfor
      TioDIPresenterSettingsType.pstETMfor:
        begin
          if Supports(LTargetBS, IioMasterBindSource, LTargetMasterBS) and Supports(LPresenterSettings[I].Obj, IioMasterBindSource, LParamMasterBS) then
            LTargetMasterBS.SetETMfor(LParamMasterBS)
          else
            raise EioGenericException.Create(ClassName, 'InitializeViewModelPresentersAfterCreate', Format('The object of class "%s" is not a "IioBindSource" interface implementer.', [LPresenterSettings[I].Obj.ClassName]));
        end;
    end;
  end;
end;

class procedure TioObjectMakerIntf.InitializeObjectAfterCreate(const AObj: TObject; const AContainerItem: TioDIContainerImplementersItem);
var
  LTyp: TRttiInstanceType;
  LProp: TRttiProperty;
  LField: TRttiField;
  I: Integer;
begin
  if not Assigned(AContainerItem) then
    Exit;
  LTyp := AContainerItem.RttiType;
  // ===========================================================================
  // PROPERTIES/FIELDS INJECTION
  // ---------------------------------------------------------------------------
  // Loop for all properties to initialize (if exists)
  for I := 0 to Length(AContainerItem.PropertiesOnCreate) - 1 do
  begin
    case AContainerItem.PropertiesOnCreate[I].PropFieldType of
      // It is a property
      itProperty:
        begin
          LProp := LTyp.GetProperty(AContainerItem.PropertiesOnCreate[I].Name);
          case AContainerItem.PropertiesOnCreate[I].PropFieldValue of
            ivByDependencyInjection:
              LProp.SetValue(AObj, TValue.From(io.di.Locate(AContainerItem.PropertiesOnCreate[I].TypeName,
                AContainerItem.PropertiesOnCreate[I].TypeAlias).Get));
            ivByValue:
              LProp.SetValue(AObj, AContainerItem.PropertiesOnCreate[I].Value);
          end;
        end;
      // It is a field
      itField:
        begin
          LField := LTyp.GetField(AContainerItem.PropertiesOnCreate[I].Name);
          case AContainerItem.PropertiesOnCreate[I].PropFieldValue of
            ivByDependencyInjection:
              LField.SetValue(AObj, TValue.From(io.di.Locate(AContainerItem.PropertiesOnCreate[I].TypeName,
                AContainerItem.PropertiesOnCreate[I].TypeAlias).Get));
            ivByValue:
              LField.SetValue(AObj, AContainerItem.PropertiesOnCreate[I].Value);
          end;
        end;
    end;
  end;
  // ===========================================================================
end;

class function TioObjectMakerIntf.InternalFindMethod(ARttiType: TRttiType; AMethodName, AMarkerText: String; IsConstructor: Boolean;
  const AParameters: Array of TValue): TRttiMethod;
var
  AMethod: TRttiMethod;
  function CheckForMarker(ARttiMethod: TRttiMethod; AMarkerText: String): Boolean;
  var
    AAttribute: TCustomAttribute;
  begin
    Result := False;
    for AAttribute in ARttiMethod.GetAttributes do
      if (AAttribute is ioMarker) and (ioMarker(AAttribute).Value.Equals(AMarkerText)) then
        Exit(True);
  end;

begin
  // Loop for all methods
  for AMethod in ARttiType.GetMethods do
  begin
    if AMethod.HasExtendedInfo and ((AMethodName = '') or AMethod.Name.Equals(AMethodName)) // Check for method name
      and (AMethod.IsConstructor = IsConstructor) // Check for IsConstructor
      and (Length(AMethod.GetParameters) = Length(AParameters)) // Check for parameters count
      and ((AMarkerText = '') or CheckForMarker(AMethod, AMarkerText)) // Check for marker
    then
      Exit(AMethod);
  end;
  // If method/constructor not found...
  raise EioGenericException.Create(Self.ClassName + ': Method "' + AMethodName + '" not found');
end;

class function TioObjectMakerIntf.CreateObjectFromBlobField(AQuery: IioQuery; AProperty: IioProperty): TObject;
var
  ADuckTypedStreamObject: IioDuckTypedStreamObject;
  AStream: TStream;
begin
  // Create the object
  Result := Self.CreateObjectByRttiType(AProperty.GetRttiType);
  // If the field is null then exit
  if AQuery.Fields.FieldByName(AProperty.GetSqlFieldAlias).IsNull then
    Exit;
  // Wrap the object into a DuckTypedStreamObject
  ADuckTypedStreamObject := TioDuckTypedFactory.DuckTypedStreamObject(Result);
  // Get the BlobStream
  AStream := AQuery.CreateBlobStream(AProperty, bmRead);
  try
    // Load stream o the object
    AStream.Position := 0;
    ADuckTypedStreamObject.LoadFromStream(AStream);
  finally
    AStream.Free;
  end;
end;

class function TioObjectMakerIntf.FindConstructor(ARttiType: TRttiType; const AParameters: Array of TValue; AMarkerText, AMethodName: String): TRttiMethod;
begin
  Result := Self.InternalFindMethod(ARttiType, AMethodName, AMarkerText, True, AParameters);
end;

class function TioObjectMakerIntf.FindMethod(ARttiType: TRttiType; AMethodName: String; const AParameters: Array of TValue; AMarkerText: String): TRttiMethod;
begin
  Result := Self.InternalFindMethod(ARttiType, AMethodName, AMarkerText, True, AParameters);
end;

class function TioObjectMakerIntf.LoadPropertyHasOne(AContext: IioContext; AQuery: IioQuery; AProperty: IioProperty): TObject;
var
  LWhere: IioWhere;
begin
  // Build where conditions
  LWhere := io.Where(AProperty.GetRelationChildPropertyName, coEquals, AQuery.GetValue(AContext.GetProperties.GetIdProperty, AContext).AsInteger).Cacheable;
  LWhere.TypeName := AProperty.GetRelationChildTypeName;
  LWhere.TypeAlias := AProperty.GetRelationChildTypeAlias;
  // Check if there is a detail object on the DB, if it finds it it loads it otherwise it returns nil
  // NB: In caso di "ChildPropertyPath" non vuoto crea l'istanza dell'oggetto finale (ultimo livello) a cui
  //      la MasterProperty si riferisce indirettamente, sarà compito della classe master e delle classi
  //      "attraversate" il creare tutti gli eventuali oggetti facenti parte del percorso per raggiungere
  //      la ChildProperty destinazione.
  if LWhere.Exists then
  begin
    // Extract the child relation object (if assigned) and load values on it or load creating a new instance (if not assigned)
    // Note: If the property is an interface then artificially increment the RefCount to avoid premature destruction of the instance
    Result := AProperty.GetRelationChildObject(AContext.DataObject);
    Result := LWhere.ToObject(Result);
    if AProperty.IsInterface then
      TioUtilities.ObjectAsIInterface(Result)._AddRef;
  end
  else
    Result := nil;
end;

class function TioObjectMakerIntf.LoadPropertyBelongsTo(AContext: IioContext; AQuery: IioQuery; AProperty: IioProperty): TObject;
var
  LChildID: Integer;
begin
  // If the ID of the detail object is equal to zero it means that when it was persisted this
  //  property was nil then it exits returning nil otherwise it loads the object from the DB
  LChildID := AQuery.GetValue(AProperty, AContext).AsInteger;
  if LChildID <> 0 then
  begin
    // Extract the child relation object (if assigned) and load values on it or load creating a new instance (if not assigned)
    // Note: In caso di "ChildPropertyPath" non vuoto crea l'istanza dell'oggetto finale (ultimo livello) a cui
    //        la MasterProperty si riferisce indirettamente, sarà compito della classe master e delle classi
    //        "attraversate" il creare tutti gli eventuali oggetti facenti parte del percorso per raggiungere
    //        la ChildProperty destinazione.
    // Note: If the property is an interface then artificially increment the RefCount to avoid premature destruction of the instance
    Result := AProperty.GetRelationChildObject(AContext.DataObject);
    Result := io.Load(AProperty.GetRelationChildTypeName, AProperty.GetRelationChildTypeAlias).ByID(LChildID).Cacheable.ToObject(Result);
// NB: Ho eliminato questa verifica perchè nel caso il child object fosse stata una NotPersistedEntity
//      in pratica sarebbe sempre stato in errore nel caso per qualche strano motivo avesse cmq
//      persistito l'ID del child object sul campo del master object (BelongsTo).
//      Togliendo questo controllo funziona tutto bene, inoltre avevo già dubbi se lasciarlo o meno,
//      in pratica la domanda era: nel caso la proprietà master (es: Customer di un Order) contenesse un ID
//      che ora non c'è più sulla tabella client è meglio che mi sollevi l'eccezione oppure che continui
//      senza fare nulla? In fondo garantire che non venga eliminato l'oggetto child è compito della foreign key
//      quindi può andare bene anche se elimino questa verifica e così ricolvo anche il problema nel caso della
//      NotPersistedEntity.
//      Lascio cmq le righe commentate con queste note per ricordarmi di non rifarle in futuro
// ---------------------------------------------------------------------------------------------------------------
//    if not Assigned(Result) then
//      raise EioException.Create(ClassName, 'LoadPropertyBelongsTo', Format('Houston we have a problem.' +
//        #13#13'I am loading an object of class "%s" with ID = %d.' +
//        #13#13'The property "%s" of type "%s", on which a "BelongsTo" relationship exists, contains the value %d but I cannot find any object of this type and with this ID on the DB.' +
//        #13#13'How could this have happened?', [AContext.GetTable.GetClassName, AContext.GetID, AProperty.GetName, AProperty.GetTypeName, LChildID]));
// ---------------------------------------------------------------------------------------------------------------
    if AProperty.IsInterface and Assigned(Result) then
      TioUtilities.ObjectAsIInterface(Result)._AddRef;
  end
  else
    Result := nil;
end;

class procedure TioObjectMakerIntf.LoadPropertyHasMany(AContext: IioContext; AQuery: IioQuery; AProperty: IioProperty);
var
  LChildObject: TObject;
  LWhere, LDetailWhere: IioWhere;
begin
  // Get the child object if already assigned
  LChildObject := AProperty.GetRelationChildObject(AContext.DataObject);
  // If the related child object not exists then exit (return 'NULL')
  if not Assigned(LChildObject) then
    raise EioGenericException.Create(ClassName, 'LoadPropertyHasMany', Format('Houston we have a problem.' +
        #13#13'I am loading an object of class "%s" with ID = %d.' +
        #13#13'The object of type "%s" in property "%s", on which there is an "HasMany" relationship, was not created.' +
        #13#13'This instance is usually created by the constructor method, in this case in the "%s" class.' +
        #13#13'If you are sure that the object is created but the problem remains then check that it is not destroyed somewhere before running this code.' +
        #13#13'It will work.', [AContext.GetTable.GetClassName, AContext.ObjID, AProperty.GetTypeName, AProperty.GetName, AContext.GetTable.GetClassName]));
  // Get the where conditions for the details if exists (nil if not exists)
  LDetailWhere := AContext.Where.Details.Get(AProperty.GetName);
  // It set the first part of the load operation
  LWhere := io.Load(AProperty.GetRelationChildTypeName, AProperty.GetRelationChildTypeAlias)._PropertyEqualsTo(AProperty.GetRelationChildPropertyName,
    AQuery.GetValue(AContext.GetProperties.GetIdProperty, AContext)).ClearListBefore(AContext.Where.GetClearListBefore).Cacheable;
  // If a Details Where conditions (for the details) is present then add it to the load operation
  if Assigned(LDetailWhere) then
    LWhere._And(LDetailWhere)._OrderBy(LDetailWhere.GetOrderByInstance); // Eventuale DetailWhere & OrderBy
  // Execute the load operation
  LWhere.ToList(LChildObject);
end;

class procedure TioObjectMakerIntf.LoadPropertyEmbeddedHasMany(AContext: IioContext; AQuery: IioQuery; AProperty: IioProperty);
var
  LChildObject: TObject;
  LJSONString: String;
begin
  // If the field is null then exit
  if AQuery.Fields.FieldByName(AProperty.GetSqlFieldAlias).IsNull then
    Exit;
  // Get the child object if already assigned
  LChildObject := AProperty.GetRelationChildObject(AContext.DataObject);
  // If the related child object not exists then exit (return 'NULL')
  if not Assigned(LChildObject) then
    raise EioGenericException.Create(ClassName, 'LoadPropertyEmbeddedHasMany', Format('Houston we have a problem.' +
        #13#13'I am loading an object of class "%s" with ID = %d.' +
        #13#13'The object of type "%s" in property "%s", on which there is an "EmbeddedHasMany" relationship, was not created.' +
        #13#13'This instance is usually created by the constructor method, in this case in the "%s" class.' +
        #13#13'If you are sure that the object is created but the problem remains then check that it is not destroyed somewhere before running this code.' +
        #13#13'It will work.', [AContext.GetTable.GetClassName, AContext.ObjID, AProperty.GetTypeName, AProperty.GetName, AContext.GetTable.GetClassName]));
  // Get the JSONObject
  LJSONString := AQuery.Fields.FieldByName(AProperty.GetSqlFieldAlias).AsString;
  // Deserialize
  dj.FromJson(LJSONString).byFields.TypeAnnotationsON.&To(LChildObject);
end;

class function TioObjectMakerIntf.LoadPropertyEmbeddedHasOne(AContext: IioContext; AQuery: IioQuery; AProperty: IioProperty): TObject;
var
  LJSONString: String;
begin
  Result := nil;
  // If the field is null then exit and return nil
  if not AQuery.Fields.FieldByName(AProperty.GetSqlFieldAlias).IsNull then
  begin
    // Get the JSONObject
    LJSONString := AQuery.Fields.FieldByName(AProperty.GetSqlFieldAlias).AsString.Trim;
    if not LJSONString.IsEmpty then
    begin
      // Extract the child relation object (if assigned) and load values on it or load creating a new instance (if not assigned)
      // Note: If the property is an interface then artificially increment the RefCount to avoid premature destruction of the instance
      Result := AProperty.GetRelationChildObject(AContext.DataObject);
      if Assigned(Result) then
        dj.FromJson(LJSONString).byFields.TypeAnnotationsON.&To(Result)
      else
        Result := dj.FromJson(LJSONString).byFields.TypeAnnotationsON.ToObject;
      if AProperty.IsInterface and Assigned(Result) then
        TioUtilities.ObjectAsIInterface(Result)._AddRef;
    end;
  end;
end;

class procedure TioObjectMakerIntf.LoadPropertyStream(AContext: IioContext; AQuery: IioQuery; AProperty: IioProperty);
var
  LChildObject: TObject;
  LChildStream, LBlobStream: TStream;
begin
  // If the field is null then exit
  if AQuery.Fields.FieldByName(AProperty.GetSqlFieldAlias).IsNull then
    Exit;
  // Get the stream from the DataObject property
  LChildObject := AProperty.GetValue(AContext.DataObject).AsObject;
  if not Assigned(LChildObject) then
    raise EioGenericException.Create(Self.ClassName, 'LoadPropertyStream', Format('Stream child object non assigned on property "%s", class "%s"',
      [AProperty.GetName, AContext.Map.GetClassName]));
  LChildStream := LChildObject as TStream;
  // Get the BlobStream
  LBlobStream := AQuery.CreateBlobStream(AProperty, bmRead);
  try
    LChildStream.CopyFrom(LBlobStream, LBlobStream.Size);
    LChildStream.Position := 0;
  finally
    LBlobStream.Free;
  end;
end;

class procedure TioObjectMakerIntf.LoadPropertyStreamable(AContext: IioContext; AQuery: IioQuery; AProperty: IioProperty);
var
  LChildObject: TObject;
  LDuckTypedStreamObject: IioDuckTypedStreamObject;
  LBlobStream: TStream;
begin
  // If the field is null then exit
  if AQuery.Fields.FieldByName(AProperty.GetSqlFieldAlias).IsNull then
    Exit;
  // Get the child object if already assigned
  LChildObject := AProperty.GetRelationChildObject(AContext.DataObject);
  // If the related child object not exists then exit (return 'NULL')
  if not Assigned(LChildObject) then
    raise EioGenericException.Create(Self.ClassName, 'LoadPropertyStreamable', Format('Streamable child object not assigned on property "%s", class "%s"',
      [AProperty.GetName, AContext.Map.GetClassName]));
  // Wrap the object into a DuckTypedStreamObject
  LDuckTypedStreamObject := TioDuckTypedFactory.DuckTypedStreamObject(LChildObject);
  // Get the BlobStream
  LBlobStream := AQuery.CreateBlobStream(AProperty, bmRead);
  try
    // Load stream o the object
    LDuckTypedStreamObject.LoadFromStream(LBlobStream);
  finally
    LBlobStream.Free;
  end;
end;

end.
