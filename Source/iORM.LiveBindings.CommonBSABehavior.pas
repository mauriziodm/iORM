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

unit iORM.LiveBindings.CommonBSABehavior;

interface

uses
  iORM.LiveBindings.Interfaces, Rtti, Data.Bind.ObjectScope, System.Generics.Collections, Data.Bind.Components,
  iORM.Context.Properties.Interfaces, iORM.LiveBindings.Notification,
  iORM.CommonTypes;

type

  // This class helper is a hack because I absolutely needed to be able to access the private "FIndex" field
  // of the "TBindSourceAdapterField" class.
  TioBindSourceAdapterFieldHelper = class helper for TBindSourceAdapterField
  private
    class var FIndexOffset: Integer;
    function TryGetIndexOffset: Boolean;
  public
    procedure SetIndex(const Value: Integer);
  end;

  // Implementation of IGetMemberObject to get the child object
  // In the architecture of the BindSourceAdapters, the classes that implement the "IGetMemberObject" interface have
  // the task of returning the instance of the object on which to carry out the read / write operations (GetValue / SetValue).
  // This specific implementation is used to make it possible to obtain the object even if the field is related to a property
  // of a child object of the current master object (master-detail of a BelongsTo, HasOne or EmbeddedHasOne relation)
  // Ex: Customer.Payment.Description in a TOrder class.
  // In practice, various implementations are created in cascade for how many are the relationship levels that must be crossed
  // to reach the target object on which to perform the GetValue / SetValue operations.
  TioBindSourceAdapterGetChildMemberObject = class(TInterfacedObject, IGetMemberObject)
  private
    FMasterMemberObject: IGetMemberObject;
    FMasterProperty: IioProperty;
  public
    constructor Create(const AMasterGetMemberObject: IGetMemberObject; const AMasterProperty: IioProperty);
    function GetMemberObject: TObject;
  end;
  // Implementation of IGetMemberObject for simple objects, used for Paging properties, ItemCount and similar
  TioBindSourceAdapterSimpleGetMemberObject = class(TInterfacedObject, IGetMemberObject)
  private
    FMemberObject: TObject;
  public
    constructor Create(const AMemberObject: TObject);
    function GetMemberObject: TObject;
  end;

  // Use RTTI to read the value of a property
  // The ValueReader classes are used to read the value of a property relating to a field of a BindSourceAdapter
  // from the current object of the adapter itself. This particular implementation in iORM is used to access the
  // properties of also child objects of the current master object (the current object of the BindSourceAdapter);
  // eg: "Customer.Address" field name.
  TioPropertyValueReader<T> = class(TPropertyValueReader<T>)
//  private
//    FActiveBindSourceAdapter: IioActiveBindSourceAdapter;
//    procedure _CheckVirtualFields;
  public
//    constructor Create(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
    function GetValue: T; override;
  end;
  // Use RTTI to write the value into a property
  // The ValueReader classes are used to write a value into a property relating to a field of a BindSourceAdapter
  // in the current object of the adapter itself. This particular implementation in iORM is used to access the
  // properties of also child objects of the current master object (the current object of the BindSourceAdapter);
  // eg: "Customer.Address" field name.
  TioPropertyValueWriter<T> = class(TPropertyValueWriter<T>)
  public
    procedure SetValue(const AValue: T); override;
  end;

  // Methods and functionalities common to all ActiveBindSouceAdapters
  TioCommonBSABehavior = class
  private
    class procedure _AddBSProperty<T>(const AClassRef: TioClassRef; const APropName, ABSFUllPathPropName: String; const ABindSourceAdapter: TBindSourceAdapter;
    const AGetMemberObject: IGetMemberObject; const AMemberType: TScopeMemberType; const AFieldsList: TList<TBindSourceAdapterField>);
  public
    // NB: Common code for ABSA to manage notifications
    class procedure Notify(const Sender: TObject; const AActiveBindSourceAdapter: IioActiveBindSourceAdapter; const [Ref] ANotification: TioBSNotification);
    // NB: Generic type for this methods must be only TObject or IInterface
    class procedure InternalSetDataObjectAsDetail<T>(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter; const ADataObject: T);
    // ObjectStatus
    class procedure SetObjStatus(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter; const AObjStatus: TioObjStatus);
    class function UseObjStatus(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter): Boolean;
    // Common code to delete ListViewItem
    class procedure DeleteListViewItem(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter; const AItemIndex: Integer; const ADelayMilliseconds: Integer);
    // ==========================================================================================================================
    // Changes to the BindSourceAdapters to make it possible to create fields that access nested properties/fields
    // (eg: "Customer.Payment.Description")
    // --------------------------------------------------------------------------------------------------------------------------
    class procedure AddBSProperties(const ABindSourceAdapter: TBindSourceAdapter; const AFieldsList: TList<TBindSourceAdapterField>);
    class procedure AddFields(AType: TRttiType; ABindSourceAdapter: TBindSourceAdapter; const AGetMemberObject: IGetMemberObject; const APath: String);
    class procedure AddPropertiesToList(AType: TRttiType; ABindSourceAdapter: TBindSourceAdapter; AFieldsList: TList<TBindSourceAdapterField>;
      const AGetMemberObject: IGetMemberObject; const APath: String);
    class procedure AddChildPropertiesToList(AType: TRttiType; ABindSourceAdapter: TBindSourceAdapter; AFieldsList: TList<TBindSourceAdapterField>;
      const AMasterGetMemberObject: IGetMemberObject; const AMasterPath: String);
    class function CreateRttiPropertyField<T>(AProperty: TRttiProperty; ABindSourceAdapter: TBindSourceAdapter; const AGetMemberObject: IGetMemberObject;
      AMemberType: TScopeMemberType; const AFullPathPropName: String): TBindSourceAdapterField;
    class function CreateRttiObjectPropertyField<T: class>(AProperty: TRttiProperty; ABindSourceAdapter: TBindSourceAdapter;
      const AGetMemberObject: IGetMemberObject; AMemberType: TScopeMemberType; const AFullPathPropName: String): TBindSourceAdapterField;
    // ==========================================================================================================================
  end;

implementation

uses iORM.Context.Map.Interfaces, iORM.Attributes, System.TypInfo, System.SysUtils, iORM.Utilities, iORM.Exceptions, iORM.Context.Container,
  iORM.Context.Factory, iORM.LiveBindings.BSPersistence,
  iORM.LiveBindings.CommonBSAPaging, iORM;

{ TioCommonBSABehavior }

class procedure TioCommonBSABehavior.InternalSetDataObjectAsDetail<T>(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter; const ADataObject: T);
var
  LMasterBindSourceAdapter: IioActiveBindSourceAdapter;
  LMasterObj: TObject;
  LMasterProperty: IioProperty;
  LValue: TValue;
begin
  // Extract the master bind source adapter
  LMasterBindSourceAdapter := AActiveBindSourceAdapter.GetMasterBindSourceAdapter;
  // Extract the master object from che master bind source adapter
  LMasterObj := LMasterBindSourceAdapter.Current;
  // Extract the master property (of the master object)
  LMasterProperty := TioMapContainer.GetMap(LMasterObj.ClassName).GetProperties.GetPropertyByName(AActiveBindSourceAdapter.GetMasterPropertyName);
  // Encapsulate (in a TValue) the new instance to be set as new DataObject
  TValue.Make(@ADataObject, LMasterProperty.GetTypeInfo, LValue);
  // It puts the master bind source adapter in the editing state because
  // we are assigning the new object to the master property of the master
  // object (BelongsTo relation) so the latter (the master object) must be
  // put in editing because it has changed (it also activates the Smart
  // Update System (SUD) appropriately)
  LMasterBindSourceAdapter.Edit;
  // Set the TValue containing the new instance to be set in the master property of the master object
  LMasterProperty.SetValue(LMasterObj, LValue);
  // Propagate everything to any detail BindSource
  LMasterBindSourceAdapter.DetailAdaptersContainer.SetMasterObject(LMasterObj);
end;

class procedure TioCommonBSABehavior.Notify(const Sender: TObject; const AActiveBindSourceAdapter: IioActiveBindSourceAdapter;
  const [Ref] ANotification: TioBSNotification);
begin
  // Notify the BindSource
  // NB: First check if the BSA has a BindSource and if the message is not actually coming from it,
  // then it also verifies that the BindSource connected to the BSA is the correct directory for this notification
  if AActiveBindSourceAdapter.HasBindSource and (Sender <> TObject(AActiveBindSourceAdapter.GetBindSource)) then
    if (ANotification.DeliverToMasterBS and AActiveBindSourceAdapter.GetBindSource.IsMasterBS) or
      (ANotification.DeliverToDetailBS and AActiveBindSourceAdapter.GetBindSource.IsDetailBS) then
    begin
      AActiveBindSourceAdapter.GetBindSource.Notify(AActiveBindSourceAdapter as TObject, ANotification);
      if ANotification.StopAtTheFirstMasterBS and AActiveBindSourceAdapter.GetBindSource.IsMasterBS then
        Exit;
    end;

  // Replicate notification to the details
  if ANotification.DirectionLeaves and (Sender <> TObject(AActiveBindSourceAdapter.DetailAdaptersContainer)) then
    AActiveBindSourceAdapter.DetailAdaptersContainer.Notify(AActiveBindSourceAdapter as TObject, ANotification);

  // Replicate notification to the MasterAdaptersContainer
  if ANotification.DirectionRoot and Assigned(AActiveBindSourceAdapter.MasterAdaptersContainer) and
    (Sender <> TObject(AActiveBindSourceAdapter.MasterAdaptersContainer)) then
    AActiveBindSourceAdapter.MasterAdaptersContainer.Notify(AActiveBindSourceAdapter as TObject, ANotification);

  // If the current BSA is a NaturalBindSourceAdapter then forward the notification to the source adapter
  if ANotification.DirectionRoot and Supports(AActiveBindSourceAdapter, IioNaturalActiveBindSourceAdapter) then
    (AActiveBindSourceAdapter as IioNaturalActiveBindSourceAdapter).ForwardNotificationToSourceAdapter(AActiveBindSourceAdapter as TObject, ANotification);
end;

class procedure TioCommonBSABehavior.SetObjStatus(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter; const AObjStatus: TioObjStatus);
begin
  TioContextFactory.Context(AActiveBindSourceAdapter.Current.ClassName, nil, AActiveBindSourceAdapter.Current, nil, '', '').ObjStatus := AObjStatus;
end;

class function TioCommonBSABehavior.UseObjStatus(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter): Boolean;
begin
  Result := TioContextFactory.Context(AActiveBindSourceAdapter.Current.ClassName, nil, AActiveBindSourceAdapter.Current, nil, '', '').ObjStatusExist;
end;

class procedure TioCommonBSABehavior.AddFields(AType: TRttiType; ABindSourceAdapter: TBindSourceAdapter; const AGetMemberObject: IGetMemberObject;
  const APath: String);
begin
  // AddFieldsToList(LType, Self, Self.Fields, LIntf); // Per ora ho deciso di non considerare gli eventuali public fields ma solo proprietà (sempre pubbliche)
  AddPropertiesToList(AType, ABindSourceAdapter, ABindSourceAdapter.Fields, AGetMemberObject, APath);
  AddChildPropertiesToList(AType, ABindSourceAdapter, ABindSourceAdapter.Fields, AGetMemberObject, APath);
  // Add Paging.CurrentPage and other BindSource related properties as fields for the BindSource
  AddBSProperties(ABindSourceAdapter, ABindSourceAdapter.Fields);
end;

class procedure TioCommonBSABehavior.AddPropertiesToList(AType: TRttiType; ABindSourceAdapter: TBindSourceAdapter; AFieldsList: TList<TBindSourceAdapterField>;
  const AGetMemberObject: IGetMemberObject; const APath: String);
const
  sTStrings = 'TStrings';
  sTPersistent = 'TPersistent';
var
  LType: TRttiType;
  LProperties: TArray<TRttiProperty>;
  LProperty: TRttiProperty;
  LCollectionEditorField: TBindSourceAdapterField;
  LTypeInfo: PTypeInfo;
  LTypeName: string;
  LTypeData: PTypeData;
  LInstance: TRttiInstanceType;
  LAncestor: string;
begin
  // LType := AType; // Original code
  LType := TioUtilities.ResolveRttiTypeToRttiType(AType);
  LProperties := LType.GetProperties;
  for LProperty in LProperties do
  begin
    LCollectionEditorField := nil;
    LTypeInfo := LProperty.PropertyType.Handle;
    if LTypeInfo = nil then
      continue;
    LTypeName := LProperty.PropertyType.Name;
    LTypeData := System.TypInfo.GetTypeData(LTypeInfo);
    case LProperty.Visibility of
      TMemberVisibility.mvPublic, TMemberVisibility.mvPublished:
        begin
{$IFDEF NEXTGEN}
          if (LProperty.Name = 'Disposed') or (LProperty.Name = 'RefCount') then
            continue;
{$ENDIF}
          case LProperty.PropertyType.TypeKind of
            tkEnumeration:
              if SameText(LTypeName, 'boolean') or SameText(LTypeName, 'bool') then // 'bool' for C++
                LCollectionEditorField := CreateRttiPropertyField<Boolean>(LProperty, ABindSourceAdapter, AGetMemberObject, mtBoolean, APath+LProperty.Name);
            tkInteger:
              begin
                case LTypeData.OrdType of
                  otSByte: // Int8
                    LCollectionEditorField := CreateRttiPropertyField<Int8>(LProperty, ABindSourceAdapter, AGetMemberObject, mtInteger, APath+LProperty.Name);
                  otSWord: // Int16
                    LCollectionEditorField := CreateRttiPropertyField<Int16>(LProperty, ABindSourceAdapter, AGetMemberObject, mtInteger, APath+LProperty.Name);
                  otSLong: // Int32
                    LCollectionEditorField := CreateRttiPropertyField<Int32>(LProperty, ABindSourceAdapter, AGetMemberObject, mtInteger, APath+LProperty.Name);
                  otUByte: // UInt8
                    LCollectionEditorField := CreateRttiPropertyField<UInt8>(LProperty, ABindSourceAdapter, AGetMemberObject, mtUInteger, APath+LProperty.Name);
                  otUWord: // UInt16
                    LCollectionEditorField := CreateRttiPropertyField<UInt16>(LProperty, ABindSourceAdapter, AGetMemberObject, mtUInteger, APath+LProperty.Name);
                  otULong: // UInt32
                    LCollectionEditorField := CreateRttiPropertyField<UInt32>(LProperty, ABindSourceAdapter, AGetMemberObject, mtUInteger, APath+LProperty.Name);
                else
                  LCollectionEditorField := CreateRttiPropertyField<Integer>(LProperty, ABindSourceAdapter, AGetMemberObject, mtInteger, APath+LProperty.Name);
                end
              end;
            tkWChar:
              LCollectionEditorField := CreateRttiPropertyField<Char>(LProperty, ABindSourceAdapter, AGetMemberObject, mtChar, APath+LProperty.Name);
            tkUString:
              LCollectionEditorField := CreateRttiPropertyField<string>(LProperty, ABindSourceAdapter, AGetMemberObject, mtText, APath+LProperty.Name);
{$IFNDEF NEXTGEN}
            tkChar:
              LCollectionEditorField := CreateRttiPropertyField<AnsiChar>(LProperty, ABindSourceAdapter, AGetMemberObject, mtChar, APath+LProperty.Name);
            tkString:
              LCollectionEditorField := CreateRttiPropertyField<ShortString>(LProperty, ABindSourceAdapter, AGetMemberObject, mtText, APath+LProperty.Name);
            tkLString:
              LCollectionEditorField := CreateRttiPropertyField<AnsiString>(LProperty, ABindSourceAdapter, AGetMemberObject, mtText, APath+LProperty.Name);
{$ENDIF}
            tkFloat:
              case LTypeData^.FloatType of
                System.TypInfo.ftSingle:
                  LCollectionEditorField := CreateRttiPropertyField<single>(LProperty, ABindSourceAdapter, AGetMemberObject, mtFloat, APath+LProperty.Name);
                System.TypInfo.ftDouble:
                  begin
                    if LTypeInfo = System.TypeInfo(TDate) then
                      LCollectionEditorField := CreateRttiPropertyField<TDate>(LProperty, ABindSourceAdapter, AGetMemberObject, mtDate, APath+LProperty.Name)
                    else if LTypeInfo = System.TypeInfo(TTime) then
                      LCollectionEditorField := CreateRttiPropertyField<TTime>(LProperty, ABindSourceAdapter, AGetMemberObject, mtTime, APath+LProperty.Name)
                    else if LTypeInfo = System.TypeInfo(TDateTime) then
                      LCollectionEditorField := CreateRttiPropertyField<TDateTime>(LProperty, ABindSourceAdapter, AGetMemberObject, mtDateTime, APath+LProperty.Name)
                    else
                      LCollectionEditorField := CreateRttiPropertyField<double>(LProperty, ABindSourceAdapter, AGetMemberObject, mtFloat, APath+LProperty.Name);
                  end;
                ftExtended:
                  LCollectionEditorField := CreateRttiPropertyField<Extended>(LProperty, ABindSourceAdapter, AGetMemberObject, mtFloat, APath+LProperty.Name);
                ftCurr:
                  LCollectionEditorField := CreateRttiPropertyField<currency>(LProperty, ABindSourceAdapter, AGetMemberObject, mtCurrency, APath+LProperty.Name);
                // ftComp:  // Not supported
              else
                Assert(False);
                LCollectionEditorField := CreateRttiPropertyField<Extended>(LProperty, ABindSourceAdapter, AGetMemberObject, mtFloat, APath+LProperty.Name);
              end;
            tkInt64:
              if LTypeData.MinInt64Value > LTypeData.MaxInt64Value then
                LCollectionEditorField := CreateRttiPropertyField<UInt64>(LProperty, ABindSourceAdapter, AGetMemberObject, mtUInteger, APath+LProperty.Name)
              else
                LCollectionEditorField := CreateRttiPropertyField<Int64>(LProperty, ABindSourceAdapter, AGetMemberObject, mtInteger, APath+LProperty.Name);
            tkClass:
              begin
                if LProperty.PropertyType.IsInstance then
                begin
                  LInstance := LProperty.PropertyType.AsInstance;
                  while LInstance <> nil do
                  begin
                    LAncestor := LInstance.Name;
                    if LAncestor = sTStrings then
                      break;
                    if LAncestor = sTPersistent then
                      break;
                    LInstance := LInstance.BaseType;
                  end;
                end;
                if LAncestor = sTStrings then
                  LCollectionEditorField := CreateRttiObjectPropertyField<TObject>(LProperty, ABindSourceAdapter, AGetMemberObject, mtMemo, APath+LProperty.Name)
                else if LAncestor = sTPersistent then
                  LCollectionEditorField := CreateRttiObjectPropertyField<TObject>(LProperty, ABindSourceAdapter, AGetMemberObject, mtBitmap, APath+LProperty.Name)
                else
                  LCollectionEditorField := CreateRttiObjectPropertyField<TObject>(LProperty, ABindSourceAdapter, AGetMemberObject, mtObject, APath+LProperty.Name)
              end;
          end;
          if LCollectionEditorField <> nil then
          begin
            // LCollectionEditorField.FGetMemberObject := AGetMemberObject; // Original
            LCollectionEditorField.GetMemberObjectIntf := AGetMemberObject;
            // LCollectionEditorField.FIndex := AFieldsList.Add(LCollectionEditorField);  // Original
            LCollectionEditorField.SetIndex(AFieldsList.Add(LCollectionEditorField));
            // Using class helper hack to access FIndex private field in the original class
          end;
        end;

    end;

  end;
end;

class procedure TioCommonBSABehavior._AddBSProperty<T>(const AClassRef: TioClassRef; const APropName, ABSFUllPathPropName: String;
  const ABindSourceAdapter: TBindSourceAdapter; const AGetMemberObject: IGetMemberObject; const AMemberType: TScopeMemberType;
  const AFieldsList: TList<TBindSourceAdapterField>);
var
  LPropertyType: TRttiProperty;
  LCollectionEditorField: TBindSourceAdapterField;
begin
    LPropertyType := TioUtilities.GetRttiProperty(AClassRef, APropName);
    LCollectionEditorField := CreateRttiPropertyField<T>(LPropertyType, ABindSourceAdapter, AGetMemberObject, AMemberType, ABSFUllPathPropName);
    if LCollectionEditorField <> nil then
    begin
      // LCollectionEditorField.FGetMemberObject := AGetMemberObject; // Original
      LCollectionEditorField.GetMemberObjectIntf := AGetMemberObject;
      // LCollectionEditorField.FIndex := AFieldsList.Add(LCollectionEditorField);  // Original
      LCollectionEditorField.SetIndex(AFieldsList.Add(LCollectionEditorField));
      // Using class helper hack to access FIndex private field in the original class
    end;
end;

class procedure TioCommonBSABehavior.AddBSProperties(const ABindSourceAdapter: TBindSourceAdapter; const AFieldsList: TList<TBindSourceAdapterField>);
var
  LBindSource: IioNotifiableBindSource;
//  LObject: TObject;
  LGetMemberObject: IGetMemberObject;
begin
  // Get the bind source and exit if not assigned
  LBindSource := (ABindSourceAdapter as IioActiveBindSourceAdapter).GetBindSource;
  if Assigned(LBindSource) and LBindSource.VirtualFields then
  begin
    // Master & Detail bind source properties
    // BindSource related properties
    // NOTE: Mauri 21/03/2022: Ho eliminato queste proprietà virtuali automatiche relative al BindSOurce
    //       perchè davano problemi inizialmente nei DataSet ma poi sono riuscito a risolvere, poi nel
    //       TioPrototypeBindSource... e non sono più riuscito a risolvere. Allora visto che non sono
    //       poi così importanti ho deciso di soprassedere almeno per ora. Rimangono cmq le proprietà
    //       relative al Paging
//    LObject := LBindSource as TObject;
//    LGetMemberObject := TioBindSourceAdapterSimpleGetMemberObject.Create(LObject);
//    _AddBSProperty<Boolean>(LObject.ClassType, 'Bof', '%Bof', ABindSourceAdapter, LGetMemberObject, mtBoolean, AFieldsList);
//    _AddBSProperty<Boolean>(LObject.ClassType, 'Eof', '%Eof', ABindSourceAdapter, LGetMemberObject, mtBoolean, AFieldsList);

    // Master bind sources properties only (not detail BS)
    if LBindSource.IsMasterBS then
    begin
//      // continue with BindSource related properties
//      _AddBSProperty<Integer>(LObject.ClassType, 'ItemCount', 'ItemCount', ABindSourceAdapter, LGetMemberObject, mtInteger, AFieldsList);
//      _AddBSProperty<Integer>(LObject.ClassType, 'ItemIndex', 'ItemIndex', ABindSourceAdapter, LGetMemberObject, mtInteger, AFieldsList);
      // Paging relatied properties
      LGetMemberObject := TioBindSourceAdapterSimpleGetMemberObject.Create(LBindSource.Paging);
      _AddBSProperty<Integer>(TioCommonBSAPageManager, 'CurrentPage', '%Paging.CurrentPage', ABindSourceAdapter, LGetMemberObject, mtInteger, AFieldsList);
      _AddBSProperty<String>(TioCommonBSAPageManager, 'CurrentPageOf', '%Paging.CurrentPageOf', ABindSourceAdapter, LGetMemberObject, mtText, AFieldsList);
      _AddBSProperty<Integer>(TioCommonBSAPageManager, 'PageCount', '%Paging.PageCount', ABindSourceAdapter, LGetMemberObject, mtInteger, AFieldsList);
      _AddBSProperty<Integer>(TioCommonBSAPageManager, 'PageSize', '%Paging.PageSize', ABindSourceAdapter, LGetMemberObject, mtInteger, AFieldsList);
      _AddBSProperty<Boolean>(TioCommonBSAPageManager, 'IsFirstPage', '%Paging.IsFirstPage', ABindSourceAdapter, LGetMemberObject, mtBoolean, AFieldsList);
      _AddBSProperty<Boolean>(TioCommonBSAPageManager, 'IsLastPage', '%Paging.IsLastPage', ABindSourceAdapter, LGetMemberObject, mtBoolean, AFieldsList);
    end
  end;
end;

class procedure TioCommonBSABehavior.AddChildPropertiesToList(AType: TRttiType; ABindSourceAdapter: TBindSourceAdapter;
  AFieldsList: TList<TBindSourceAdapterField>; const AMasterGetMemberObject: IGetMemberObject; const AMasterPath: String);
var
  LMap: IioMap;
  LProperty: IioProperty;
  LChildPath: String;
  LChildGetMemberObject: IGetMemberObject;
begin
  LMap := TioMapContainer.GetMap(TioUtilities.ResolveRttiTypeToRttiType(AType).Name);
  for LProperty in LMap.GetProperties do
  begin
    if LProperty.GetRelationType in [rtBelongsTo, rtHasOne, rtEmbeddedHasOne] then
    begin
      LChildPath := AMasterPath + LProperty.GetName + '.';
      LChildGetMemberObject := TioBindSourceAdapterGetChildMemberObject.Create(AMasterGetMemberObject, LProperty);
      AddFields(LProperty.GetRttiType, ABindSourceAdapter, LChildGetMemberObject, LChildPath);
    end;
  end;
end;

class function TioCommonBSABehavior.CreateRttiPropertyField<T>(AProperty: TRttiProperty; ABindSourceAdapter: TBindSourceAdapter; const AGetMemberObject: IGetMemberObject;
      AMemberType: TScopeMemberType; const AFullPathPropName: String): TBindSourceAdapterField;
begin
  Result := nil;
  if AProperty.IsReadable then
    if AProperty.IsWritable then
      Result := TBindSourceAdapterReadWriteField<T>.Create(ABindSourceAdapter, AFullPathPropName,
        TBindSourceAdapterFieldType.Create(AProperty.PropertyType.Name, AProperty.PropertyType.TypeKind), AGetMemberObject, TioPropertyValueReader<T>.Create,
        TioPropertyValueWriter<T>.Create, AMemberType)
    else
      Result := TBindSourceAdapterReadField<T>.Create(ABindSourceAdapter, AFullPathPropName,
        TBindSourceAdapterFieldType.Create(AProperty.PropertyType.Name, AProperty.PropertyType.TypeKind), AGetMemberObject, TioPropertyValueReader<T>.Create,
        AMemberType);
end;

class procedure TioCommonBSABehavior.DeleteListViewItem(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter; const AItemIndex,
  ADelayMilliseconds: Integer);
begin
  // Delayed deletion of the current object for ListView
  io.AnonymousTimer(ADelayMilliseconds,
    function: Boolean
    var
      LBindSource: IioBSPersistenceClient;
    begin
      Result := False; // After the execution disable the timer and destroy it
      try
        if AActiveBindSourceAdapter.IsMasterBSA then
        begin
          if AActiveBindSourceAdapter.HasBindSource and Supports(AActiveBindSourceAdapter.GetBindSource, IioBSPersistenceClient, LBindSource) and LBindSource.Persistence.CanDelete then
            LBindSource.Persistence.Delete;
        end
        else
          AActiveBindSourceAdapter.Delete;
      finally
        AActiveBindSourceAdapter.ItemIndex := AItemIndex;
      end;
    end
  );
end;

class function TioCommonBSABehavior.CreateRttiObjectPropertyField<T>(AProperty: TRttiProperty; ABindSourceAdapter: TBindSourceAdapter;
      const AGetMemberObject: IGetMemberObject; AMemberType: TScopeMemberType; const AFullPathPropName: String): TBindSourceAdapterField;
begin
  Result := nil;
  if AProperty.IsReadable then
    if AProperty.IsWritable then
      Result := TBindSourceAdapterReadWriteObjectField<T>.Create(ABindSourceAdapter, AFullPathPropName,
        TBindSourceAdapterFieldType.Create(AProperty.PropertyType.Name, AProperty.PropertyType.TypeKind), AGetMemberObject, TioPropertyValueReader<T>.Create,
        TPropertyValueWriter<T>.Create, AMemberType)
    else
      Result := TBindSourceAdapterReadObjectField<T>.Create(ABindSourceAdapter, AFullPathPropName,
        TBindSourceAdapterFieldType.Create(AProperty.PropertyType.Name, AProperty.PropertyType.TypeKind), AGetMemberObject, TioPropertyValueReader<T>.Create,
        AMemberType);
end;

{ TBindSourceAdapterFieldHelper }

function TioBindSourceAdapterFieldHelper.TryGetIndexOffset: Boolean;
  function _TryGetIndexOffsetByRtti: Boolean;
  var
    LRttiContext: TRTTIContext;
    LRttiType: TRttiType;
  begin
    LRttiType := LRttiContext.GetType(TBindSourceAdapterField);
    if LRttiType <> nil then
    begin
      // Obtain the offset of the private field "FIndex"
      FIndexOffset := LRttiType.GetField('FIndex').Offset;
      Result := True;
    end
    else
      Result := False;
  end;

begin
  Result := (FIndexOffset > 0) or _TryGetIndexOffsetByRtti;
end;

procedure TioBindSourceAdapterFieldHelper.SetIndex(const Value: Integer);
begin
  // Use the offset obtained above to access the value of the private field "FIndex"
  if TryGetIndexOffset then
    PInteger(Pointer(NativeInt(Self) + FIndexOffset))^ := Value;
end;

{ TBindSourceAdapterGetChildMemberObject }

constructor TioBindSourceAdapterGetChildMemberObject.Create(const AMasterGetMemberObject: IGetMemberObject; const AMasterProperty: IioProperty);
begin
  FMasterMemberObject := AMasterGetMemberObject;
  FMasterProperty := AMasterProperty;
end;

function TioBindSourceAdapterGetChildMemberObject.GetMemberObject: TObject;
var
  LMasterObj: TObject;
begin
  LMasterObj := FMasterMemberObject.GetMemberObject;
  Result := FMasterProperty.GetRelationChildObject(LMasterObj);
end;

{ TioPropertyValueReader<T> }

//constructor TioPropertyValueReader<T>.Create(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
//begin
//  FActiveBindSourceAdapter := AActiveBindSourceAdapter;
//end;

function TioPropertyValueReader<T>.GetValue: T;
var
  LObject: TObject;
  LCtxt: TRTTIContext;
  LRttiType: TRttiType;
  LRttiField: TRttiProperty;
begin
  // Do not inherit
  // LObject := FField.GetMemberObject; // original code

  // NB: Il codice qui sotto è stato commentato perchè in pratica non serviva a nulla visto che
  //      se la proprietà "VirtualFields" del BindsSource era impostata a False qua non passava
  //      per niente e passava invece se i VirtualFields erano abilitati. Di fatto quindi il controllo
  //      non serviva a nulla e cmq se i VirtualFields sono disabilitati e ho dei campi virtuali
  //      cmq i valori di tali campi non vengono visualizzati (NULL).
//  if FField.MemberName.StartsWith('%') then
//    _CheckVirtualFields;

  LObject := FField.GetMemberObjectIntf.GetMemberObject;
  if LObject <> nil then
  begin
    LRttiType := LCtxt.GetType(LObject.ClassType);
    LRttiField := LRttiType.GetProperty(TioUtilities.ExtractPropertyName(FField.MemberName));
    if LRttiField <> nil then
    begin
      Result := LRttiField.GetValue(LObject).AsType<T>;
    end
    else
      Result := TValue.Empty.AsType<T>;
  end
  else
    Result := TValue.Empty.AsType<T>;
end;

//procedure TioPropertyValueReader<T>._CheckVirtualFields;
//begin
//  if FActiveBindSourceAdapter.HasBindSource and not FActiveBindSourceAdapter.GetBindSource.VirtualFields then
//    raise EioException.Create(Self.ClassName, 'GetValue',
//      Format('iORM trying to read the value of the "%s" virtual field declared in the component "%s".' +
//      #13#13'I''m sorry but the "VirtualFields" property of that component is set to "False" so they are disabled.' +
//      #13#13'Set the property to "True" and try again, it will work.', [FField.MemberName, FActiveBindSourceAdapter.GetBindSource.GetName]));
//end;

{ TioPropertyValueWriter<T> }
procedure TioPropertyValueWriter<T>.SetValue(const AValue: T);
var
  LObject: TObject;
  LCtxt: TRTTIContext;
  LRttiType: TRttiType;
  LRttiField: TRttiProperty;
begin
  // NB: If it's a property relative to the BindSource then raise an exception because
  //      these type of properties are ReadOnly
  if FField.MemberName.StartsWith('%') then
    raise EioException.Create(Self.ClassName, 'SetValue',
      Format('Ooops, I see you have set some virtual fields in some BindSource or DataSet (FieldDefs property), they are the ones whose name starts with the character "%%".' +
      #13#13'Note that these type of virtual fields are read-only by design; iORM cannot assign the new value to the field named "%s".' +
      #13#13'Please, try to Assign value to the bind source property directly by code.', [FField.MemberName]));
  // Do not inherit
  LObject := FField.GetMemberObjectIntf.GetMemberObject;
  if LObject <> nil then
  begin
    LRttiType := LCtxt.GetType(LObject.ClassType);
    LRttiField := LRttiType.GetProperty(TioUtilities.ExtractPropertyName(FField.MemberName));
    if LRttiField <> nil then
    begin
      LRttiField.SetValue(LObject, TValue.From<T>(AValue));
      // RecordChanged;
    end;
  end
  else
    raise EioException.Create(Self.ClassName, 'SetValue',
      Format('I am unable to resolve the property path "%s".'#13#13'It could be that one of the objects along the way is nil.', [FField.MemberName]));
end;

{ TioBindSourceAdapterSimpleGetMemberObject }

constructor TioBindSourceAdapterSimpleGetMemberObject.Create(const AMemberObject: TObject);
begin
  FMemberObject := AMemberObject;
end;

function TioBindSourceAdapterSimpleGetMemberObject.GetMemberObject: TObject;
begin
  Result := FMemberObject;
end;

end.
