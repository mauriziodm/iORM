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
    class function CheckOrCreateRelationChildObject(const AContext:IioContext; const AProperty:IioContextProperty): TObject;
    class function LoadPropertyHasMany(AContext:IioContext; AQuery:IioQuery; AProperty:IioContextProperty): TObject;
    class function LoadPropertyHasOne(AContext:IioContext; AQuery:IioQuery; AProperty:IioContextProperty): TObject;
    class function LoadPropertyBelongsTo(AContext:IioContext; AQuery:IioQuery; AProperty:IioContextProperty): TObject;
    class function LoadPropertyEmbeddedHasMany(AContext:IioContext; AQuery:IioQuery; AProperty:IioContextProperty): TObject;
    class function LoadPropertyEmbeddedHasOne(AContext:IioContext; AQuery:IioQuery; AProperty:IioContextProperty): TObject;
    class function LoadPropertyStreamable(AContext:IioContext; AQuery:IioQuery; AProperty:IioContextProperty): TObject;
    class procedure LoadPropertyStream(AContext:IioContext; AQuery:IioQuery; AProperty:IioContextProperty);
    class function InternalFindMethod(ARttiType:TRttiType; AMethodName,AMarkerText:String; IsConstructor:Boolean; const AParameters:Array of TValue): TRttiMethod;
    class function FindConstructor(ARttiType:TRttiType; const AParameters:Array of TValue; AMarkerText:String=''; AMethodName:String=''): TRttiMethod;
    class function FindMethod(ARttiType:TRttiType; AMethodName:String; const AParameters:Array of TValue; AMarkerText:String=''): TRttiMethod;
    class procedure InitializeObjectAfterCreate(const AObj:TObject; const AContainerItem:TioDIContainerImplementersItem);
  public
    class procedure InitializeViewModelPresentersAfterCreate(const AViewModel:TObject; const APresenterSettingsPointer:PioDIPresenterSettingsContainer);
    class function CreateObjectFromBlobField(AQuery:IioQuery; AProperty:IioContextProperty): TObject;
    class function CreateObjectByClassRef(AClassRef: TClass): TObject;
    class function CreateObjectByClassRefEx(AClassRef: TClass; const AConstructorParams:array of TValue; AConstructorMarkerText:String=''; AConstructorMethodName:String=''; AContainerItem:TioDIContainerImplementersItem=nil): TObject;
    class function CreateObjectByRttiType(ARttiType:TRttiType): TObject;
    class function CreateObjectByRttiTypeEx(ARttiType:TRttiType;
      const AConstructorParams:array of TValue; AConstructorMarkerText:String; AConstructorMethodName:String;
      AContainerItem:TioDIContainerImplementersItem=nil): TObject;
    class function CreateListByClassRef(AClassRef:TClass; AOwnsObjects:Boolean=True): TObject;
    class function CreateListByRttiType(const ARttiType:TRttiType; const AOwnsObject:Boolean=True): TObject;
    class function MakeObject(const AContext:IioContext; const AQuery:IioQuery): TObject; virtual; abstract;
  end;

implementation

uses
  System.TypInfo, iORM.Exceptions, iORM, iORM.RttiContext.Factory,
  iORM.DuckTyped.Interfaces, iORM.DuckTyped.Factory, System.Classes,
  Data.DB, iORM.LazyLoad.Interfaces, System.SysUtils, iORM.Attributes,
  iORM.Resolver.Interfaces, iORM.Resolver.Factory, System.JSON,
  iORM.ObjectsForge.Factory, iORM.Context.Container, iORM.Rtti.Utilities,
  iORM.LiveBindings.Interfaces, iORM.MVVM.Components.ModelPresenter,
  iORM.Where.Interfaces, iORM.MVVM.ViewModelBase;

{ TioObjectMakerIntf }

//  NB: In caso di "ChildPropertyPath" non vuoto crea l'istanza dell'oggetto finale (ultimo livello) a cui
//       la MasterProperty si riferisce indirettamente, sarà compito della classe master e delle classi
//       "attraversate" il creare tutti gli eventuali oggetti facenti parte del percorso per raggiungere
//       la ChildProperty destinazione.
class function TioObjectMakerIntf.CheckOrCreateRelationChildObject(const AContext: IioContext; const AProperty: IioContextProperty): TObject;
begin
  // Get the child object if already assigned
  Result := AProperty.GetRelationChildObject(AContext.DataObject);
  // If the AProperty is of interface type...
  if AProperty.IsInterface then
  begin
    // Create the child object/list if it isn't not already created by the master class constructor
    if not Assigned(Result) then
      Result := io.di.Locate(AProperty.GetTypeName).Alias(AProperty.GetTypeAlias).Get;
    TioRttiUtilities.ObjectAsIInterface(Result)._AddRef;
  end
  else
  // If the AProperty is of instance (class) type...
  begin
    // Create the child object/list if it isn't not already created by the master class constructor
    if not Assigned(Result) then
      if AProperty.GetRelationType = ioRTHasMany then
        Result := Self.CreateListByRttiType(   AProperty.GetRttiType   )
      else
        Result := Self.CreateObjectByRttiType(   AProperty.GetRttiType   );
  end;
end;

class function TioObjectMakerIntf.CreateListByClassRef(AClassRef: TClass;
  AOwnsObjects: Boolean): TObject;
begin
  Result := Self.CreateListByRttiType(   TioRttiContextFactory.RttiContext.GetType(AClassref)   , AOwnsObjects);
end;

class function TioObjectMakerIntf.CreateListByRttiType(const ARttiType:TRttiType; const AOwnsObject:Boolean): TObject;
var
  Prop: TRttiProperty;
begin
  inherited;
  // Proprerty "OwnsObjects" by Rtti
  Prop := ARttiType.GetProperty('OwnsObjects');
  // Create object
  Result := Self.CreateObjectByRttiType(ARttiType);
  // Set "OwnsObjects" if exists
  if Assigned(Prop) then Prop.SetValue(PTypeInfo(Result), AOwnsObject);
end;

class function TioObjectMakerIntf.CreateObjectByClassRef(
  AClassRef: TClass): TObject;
begin
  Result := Self.CreateObjectByClassRefEx(AClassRef, []);
end;

class function TioObjectMakerIntf.CreateObjectByClassRefEx(AClassRef: TClass; const AConstructorParams: array of TValue;
  AConstructorMarkerText, AConstructorMethodName: String; AContainerItem:TioDIContainerImplementersItem): TObject;
begin
  // Create object
  Result := Self.CreateObjectByRttiTypeEx(
                                          TioRttiContextFactory.RttiContext.GetType(AClassref),
                                          AConstructorParams,
                                          AConstructorMarkerText,
                                          AConstructorMethodName,
                                          AContainerItem
                                         );
end;

class function TioObjectMakerIntf.CreateObjectByRttiType(ARttiType: TRttiType): TObject;
begin
  Result := Self.CreateObjectByRttiTypeEx(ARttiType, [], '', '');
end;

class function TioObjectMakerIntf.CreateObjectByRttiTypeEx(ARttiType: TRttiType;
  const AConstructorParams:array of TValue; AConstructorMarkerText, AConstructorMethodName: String;
  AContainerItem:TioDIContainerImplementersItem=nil): TObject;
var
  LMethod: TRttiMethod;
begin
  // Find the constructor
  LMethod := Self.FindConstructor(ARttiType, AConstructorParams, AConstructorMarkerText, AConstructorMethodName);
  // If constructor not found...
  if not Assigned(LMethod) then EioException.Create(Self.ClassName + ': Constructor not found for class "' + ARttiType.Name + '"');
  // Execute
  Result := LMethod.Invoke(ARttiType.AsInstance.MetaclassType, AConstructorParams).AsObject;
  // Inject Properties/Fields: if the received ContainerItem is not assigned then
  //  try to retrieve it from MapContainer
  //  Inject ModelPresenters settings for ViewModels only.
  if (not Assigned(AContainerItem)) and TioMapContainer.Exist(ARttiType.Name) then
    AContainerItem := TioMapContainer.GetMap(ARttiType.Name).GetDIContainerImplementersItem;
  if Assigned(AContainerItem) then
  begin
    Self.InitializeObjectAfterCreate(Result, AContainerItem);
    Self.InitializeViewModelPresentersAfterCreate(Result, AContainerItem.PresenterSettingsPointer);
  end;
end;

class procedure TioObjectMakerIntf.InitializeViewModelPresentersAfterCreate(
  const AViewModel: TObject;
  const APresenterSettingsPointer:PioDIPresenterSettingsContainer);
var
  LViewModel: TioViewModel;
  LBSA: IioActiveBindSourceAdapter;
  LWhere: IioWhere;
  LName: String;
  LObj: TObject;
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
  // Only for ViewModels
  if not (AViewModel is TioViewModel) then
    Exit;
  LViewModel := TioViewModel(AViewModel);
  // Extract PresenterSettings
  LPresenterSettings := APresenterSettingsPointer^;
  // Loop for all settings
  for I := 0 to Length(LPresenterSettings) -1 do
  begin
    LName := LPresenterSettings[I].Name;
    case LPresenterSettings[I].SettingsType of
      // DataObject
      TioDIPresenterSettingsType.pstDataObject:
        LViewModel.Presenter[LName].SetDataObject(LPresenterSettings[I].Obj);
      // BindSourceAdapter
      TioDIPresenterSettingsType.pstBindSourceAdapter:
      begin
        LIntf := LPresenterSettings[I].InterfacedObj;
        if not Supports(LIntf, IioActiveBindSourceAdapter, LBSA) then
          raise EioException.Create(Self.ClassName, 'InitializeViewModelPresentersAfterCreate', 'Interface "IioActiveBindSourceAdapter" not implemented by object.');
        LViewModel.Presenter[LName].BindSourceAdapter := LBSA;
      end;
      // MasterModelPresenter
      TioDIPresenterSettingsType.pstMasterModelPresenter:
      begin
        LObj := LPresenterSettings[I].Obj;
        if not (LObj is TioModelPresenter) then
          raise EioException.Create(Self.ClassName, 'InitializeViewModelPresentersAfterCreate', 'The object is not a TioModelPresenter instance.');
        LViewModel.Presenter[LName].MasterPresenter := TioModelPresenter(LObj);
        LViewModel.Presenter[LName].MasterPropertyName := LPresenterSettings[I].StringParameter;
      end;
      // Where
      TioDIPresenterSettingsType.pstWhere:
      begin
        LIntf := LPresenterSettings[I].InterfacedObj;
        if not Supports(LIntf, IioWhere, LWhere) then
          raise EioException.Create(Self.ClassName, 'InitializeViewModelPresentersAfterCreate', 'Interface "IioWhere" not implemented by object.');
        LViewModel.Presenter[LName].Where := LWhere;
      end;
      // OrderBy
      TioDIPresenterSettingsType.pstOrderBy:
        LViewModel.Presenter[LName].OrderBy := LPresenterSettings[I].StringParameter;
    end;
  end;
end;

class procedure TioObjectMakerIntf.InitializeObjectAfterCreate(
  const AObj: TObject; const AContainerItem: TioDIContainerImplementersItem);
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
  for I := 0 to Length(AContainerItem.PropertiesOnCreate) -1 do
  begin
    case AContainerItem.PropertiesOnCreate[I].PropFieldType of
      // It is a property
      itProperty: begin
        LProp := LTyp.GetProperty(AContainerItem.PropertiesOnCreate[I].Name);
        case AContainerItem.PropertiesOnCreate[I].PropFieldValue of
          ivByDependencyInjection:
            LProp.SetValue(AObj,   TValue.From(io.di.Locate(AContainerItem.PropertiesOnCreate[I].TypeName, AContainerItem.PropertiesOnCreate[I].TypeAlias).Get)   );
          ivByValue:
            LProp.SetValue(AObj, AContainerItem.PropertiesOnCreate[I].Value);
        end;
      end;
      // It is a field
      itField: begin
        LField := LTyp.GetField(AContainerItem.PropertiesOnCreate[I].Name);
        case AContainerItem.PropertiesOnCreate[I].PropFieldValue of
          ivByDependencyInjection:
            LField.SetValue(AObj,   TValue.From(io.di.Locate(AContainerItem.PropertiesOnCreate[I].TypeName, AContainerItem.PropertiesOnCreate[I].TypeAlias).Get)   );
          ivByValue:
            LField.SetValue(AObj, AContainerItem.PropertiesOnCreate[I].Value);
        end;
      end;
    end;
  end;
  // ===========================================================================
end;

class function TioObjectMakerIntf.InternalFindMethod(ARttiType:TRttiType; AMethodName,AMarkerText:String; IsConstructor:Boolean; const AParameters:Array of TValue): TRttiMethod;
var
  AMethod: TRttiMethod;
  function CheckForMarker(ARttiMethod:TRttiMethod; AMarkerText:String): Boolean;
  var
    AAttribute: TCustomAttribute;
  begin
    Result := False;
    for AAttribute in ARttiMethod.GetAttributes do
      if  (AAttribute is ioMarker)
      and (ioMarker(AAttribute).Value.Equals(AMarkerText))
      then Exit(True);
  end;
begin
  // init
  Result := nil;
  // Loop for all methods
  for AMethod in ARttiType.GetMethods do
  begin
    if  AMethod.HasExtendedInfo
    and (   (AMethodName = '') or AMethod.Name.Equals(AMethodName)   )  // Check for method name
    and (AMethod.IsConstructor = IsConstructor)                         // Check for IsConstructor
    and (Length(AMethod.GetParameters) = Length(AParameters))           // Check for parameters count
    and (   (AMarkerText = '') or CheckForMarker(AMethod, AMarkerText)   )   // Check for marker
    then Exit(AMethod);
  end;
  // If method/constructor not found...
  EioException.Create(Self.ClassName + ': Method "' + AMethodName + '" not found');
end;


class function TioObjectMakerIntf.CreateObjectFromBlobField(
  AQuery: IioQuery; AProperty: IioContextProperty): TObject;
var
  ADuckTypedStreamObject: IioDuckTypedStreamObject;
  AStream: TStream;
begin
  // Create the object
  Result := Self.CreateObjectByRttiType(   AProperty.GetRttiType   );
  // If the field is null then exit
  if AQuery.Fields.FieldByName(AProperty.GetSqlFieldAlias).IsNull then Exit;
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

class function TioObjectMakerIntf.FindConstructor(ARttiType: TRttiType;
  const AParameters: Array of TValue; AMarkerText,
  AMethodName: String): TRttiMethod;
begin
  Result := Self.InternalFindMethod(ARttiType, AMethodName, AMarkerText, True, AParameters);
end;

class function TioObjectMakerIntf.FindMethod(ARttiType: TRttiType;
  AMethodName: String; const AParameters: Array of TValue;
  AMarkerText: String): TRttiMethod;
begin
  Result := Self.InternalFindMethod(ARttiType, AMethodName, AMarkerText, True, AParameters);
end;

class function TioObjectMakerIntf.LoadPropertyHasOne(AContext: IioContext;
  AQuery: IioQuery; AProperty: IioContextProperty): TObject;
begin
  // Check if the result child relation object is alreaady created in the master object (by constructor); if it isn't
  //  then create it
  //  NB: In caso di "ChildPropertyPath" non vuoto crea l'istanza dell'oggetto finale (ultimo livello) a cui
  //       la MasterProperty si riferisce indirettamente, sarà compito della classe master e delle classi
  //       "attraversate" il creare tutti gli eventuali oggetti facenti parte del percorso per raggiungere
  //       la ChildProperty destinazione.
  Result := Self.CheckOrCreateRelationChildObject(AContext, AProperty);
  // Load the relation child object
  io.Load(AProperty.GetRelationChildTypeName, AProperty.GetRelationChildTypeAlias)
    ._Where  // Essendo una relazione HasOne non ha senso che utilizzi anche eventuali condizioni where di dettaglio
    ._PropertyEqualsTo(AProperty.GetRelationChildPropertyName, AQuery.GetValue(AContext.GetProperties.GetIdProperty))
    .ToObject(Result);
end;

class function TioObjectMakerIntf.LoadPropertyBelongsTo(AContext: IioContext; AQuery: IioQuery;
  AProperty: IioContextProperty): TObject;
begin
  // Check if the result child relation object is alreaady created in the master object (by constructor); if it isn't
  //  then create it
  //  NB: In caso di "ChildPropertyPath" non vuoto crea l'istanza dell'oggetto finale (ultimo livello) a cui
  //       la MasterProperty si riferisce indirettamente, sarà compito della classe master e delle classi
  //       "attraversate" il creare tutti gli eventuali oggetti facenti parte del percorso per raggiungere
  //       la ChildProperty destinazione.
  Result := Self.CheckOrCreateRelationChildObject(AContext, AProperty);
  // Load the relation child object
  io.Load(AProperty.GetRelationChildTypeName, AProperty.GetRelationChildTypeAlias)
    .ByOID(   AQuery.GetValue(AProperty).AsInteger   )
    .ToObject(Result);
end;

class function TioObjectMakerIntf.LoadPropertyHasMany(AContext:IioContext;
  AQuery: IioQuery; AProperty: IioContextProperty): TObject;
var
  ALazyLoadableObj: IioLazyLoadable;
  LWhere, LDetailWhere: IioWhere;
begin
  // Check if the result child relation object is alreaady created in the master object (by constructor); if it isn't
  //  then create it
  //  NB: In caso di "ChildPropertyPath" non vuoto crea l'istanza dell'oggetto finale (ultimo livello) a cui
  //       la MasterProperty si riferisce indirettamente, sarà compito della classe master e delle classi
  //       "attraversate" il creare tutti gli eventuali oggetti facenti parte del percorso per raggiungere
  //       la ChildProperty destinazione.
  Result := Self.CheckOrCreateRelationChildObject(AContext, AProperty);
  // Get the where conditions for the details if exists (nil if not exists)
  LDetailWhere := AContext.Where.Details.Get(AProperty.GetName);
  // If LazyLoadable then set LazyLoad data
  if (AProperty.GetRelationLoadType = ioLazyLoad)
  and Supports(Result, IioLazyLoadable, ALazyLoadableObj)
    // Set the lazy load relation data
    then ALazyLoadableObj.SetRelationInfo(
       AProperty.GetRelationChildTypeName
      ,AProperty.GetRelationChildTypeAlias
      ,AProperty.GetRelationChildPropertyName
      ,AQuery.GetValue(AContext.GetProperties.GetIdProperty).AsInteger
      ,LDetailWhere)  // Eventuale detail where
    // Fill the list
    else
    begin
      // It set the first part of the load operation
      LWhere := io.Load(AProperty.GetRelationChildTypeName, AProperty.GetRelationChildTypeAlias)
        ._PropertyEqualsTo(AProperty.GetRelationChildPropertyName, AQuery.GetValue(AContext.GetProperties.GetIdProperty));
      // If a Details Where conditions (for the details) is present then add it to the load operation
      if Assigned(LDetailWhere) then
        LWhere._And(LDetailWhere)._OrderBy(LDetailWhere.GetOrderByInstance);  // Eventuale DetailWhere & OrderBy
      // Execute the load operation
      LWhere.ToList(Result);
    end
end;

class function TioObjectMakerIntf.LoadPropertyEmbeddedHasMany(AContext: IioContext; AQuery: IioQuery;
  AProperty: IioContextProperty): TObject;
var
  AJSONValue: TJSONValue;
  AJSONValueString: String;
begin
  // Check if the result child relation object is alreaady created in the master object (by constructor); if it isn't
  //  then create it
  //  NB: In caso di "ChildPropertyPath" non vuoto crea l'istanza dell'oggetto finale (ultimo livello) a cui
  //       la MasterProperty si riferisce indirettamente, sarà compito della classe master e delle classi
  //       "attraversate" il creare tutti gli eventuali oggetti facenti parte del percorso per raggiungere
  //       la ChildProperty destinazione.
  Result := Self.CheckOrCreateRelationChildObject(AContext, AProperty);
  // If the field is null then exit
  if AQuery.Fields.FieldByName(AProperty.GetSqlFieldAlias).IsNull then Exit;
  // Get the JSONObject
  AJSONValueString := AQuery.Fields.FieldByName(AProperty.GetSqlFieldAlias).AsString;
  AJSONValue := TJSONObject.ParseJSONValue(AJSONValueString);
  try
    // Deserialize
    Result := TioObjectMakerFactory.GetObjectMapper.DeserializeEmbeddedList(AJSONValue, Result);
  finally
    AJSONValue.Free;
  end;
end;

class function TioObjectMakerIntf.LoadPropertyEmbeddedHasOne(AContext: IioContext; AQuery: IioQuery;
  AProperty: IioContextProperty): TObject;
var
  AJSONObject: TJSONObject;
  AJSONObjectString: String;
begin
  // Check if the result child relation object is alreaady created in the master object (by constructor); if it isn't
  //  then create it
  //  NB: In caso di "ChildPropertyPath" non vuoto crea l'istanza dell'oggetto finale (ultimo livello) a cui
  //       la MasterProperty si riferisce indirettamente, sarà compito della classe master e delle classi
  //       "attraversate" il creare tutti gli eventuali oggetti facenti parte del percorso per raggiungere
  //       la ChildProperty destinazione.
  Result := Self.CheckOrCreateRelationChildObject(AContext, AProperty);
  // If the field is null then exit
  if AQuery.Fields.FieldByName(AProperty.GetSqlFieldAlias).IsNull then Exit;
  // Get the JSONObject
  AJSONObjectString := AQuery.Fields.FieldByName(AProperty.GetSqlFieldAlias).AsString;
  AJSONObject := TJSONObject.ParseJSONValue(AJSONObjectString) as TJSONObject;
  try
    // Deserialize
    Result := TioObjectMakerFactory.GetObjectMapper.DeserializeEmbeddedObject(AJSONObject, Result);
  finally
    AJSONObject.Free;
  end;
end;

class procedure TioObjectMakerIntf.LoadPropertyStream(AContext: IioContext; AQuery: IioQuery; AProperty: IioContextProperty);
var
  AStream, ABlobStream: TStream;
begin
  // If the field is null then exit
  if AQuery.Fields.FieldByName(AProperty.GetSqlFieldAlias).IsNull then Exit;
  // Get the stream from the DataObject property
  AStream := TStream(   AProperty.GetValue(AContext.DataObject).AsObject   );
  // If the stream is not assigned then raise an Exception
  //  (the stream must exist)
  if not Assigned(AStream) then raise EioException.Create(Self.ClassName + ': Stream not assigned.');
  // Get the BlobStream
  ABlobStream := AQuery.CreateBlobStream(AProperty, bmRead);
  try
    AStream.CopyFrom(ABlobStream, ABlobStream.Size);
    AStream.Position := 0;
  finally
    ABlobStream.Free;
  end;
end;

class function TioObjectMakerIntf.LoadPropertyStreamable(AContext: IioContext; AQuery: IioQuery;
  AProperty: IioContextProperty): TObject;
var
  ADuckTypedStreamObject: IioDuckTypedStreamObject;
  ABlobStream: TStream;
begin
  // Check if the result child relation object is alreaady created in the master object (by constructor); if it isn't
  //  then create it
  //  NB: In caso di "ChildPropertyPath" non vuoto crea l'istanza dell'oggetto finale (ultimo livello) a cui
  //       la MasterProperty si riferisce indirettamente, sarà compito della classe master e delle classi
  //       "attraversate" il creare tutti gli eventuali oggetti facenti parte del percorso per raggiungere
  //       la ChildProperty destinazione.
  Result := Self.CheckOrCreateRelationChildObject(AContext, AProperty);
  // If the field is null then exit
  if AQuery.Fields.FieldByName(AProperty.GetSqlFieldAlias).IsNull then Exit;
  // Wrap the object into a DuckTypedStreamObject
  ADuckTypedStreamObject := TioDuckTypedFactory.DuckTypedStreamObject(Result);
  // Get the BlobStream
  ABlobStream := AQuery.CreateBlobStream(AProperty, bmRead);
  try
    // Load stream o the object
    ADuckTypedStreamObject.LoadFromStream(ABlobStream);
  finally
    ABlobStream.Free;
  end;
end;


end.
