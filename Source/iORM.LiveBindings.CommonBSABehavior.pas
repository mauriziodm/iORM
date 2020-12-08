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
  iORM.Context.Properties.Interfaces;

type

  TioBindSourceAdapterFieldHelper = class helper for TBindSourceAdapterField
  private
    class var FIndexOffset: Integer;
  public
    class constructor Create; // Executed automatically at program start
    procedure SetIndex(const Value: Integer);
  end;

  // Implementation of IGetMemberObject to get the child object
  TBindSourceAdapterGetChildMemberObject = class(TInterfacedObject, IGetMemberObject)
  private
    FMasterMemberObject: IGetMemberObject;
    FMasterProperty: IioContextProperty;
  public
    constructor Create(const AMasterGetMemberObject: IGetMemberObject; const AMasterProperty: IioContextProperty);
    function GetMemberObject: TObject;
  end;

  // Use RTTI to read the value of a property
//  TPropertyValueReader<T> = class(TValueReader<T>)
//  public
//    function GetValue: T; override;
//  end;

  // Methods and functionalities common to all ActiveBindSouceAdapters
  TioCommonBSABehavior = class
  public
    // NB: Generic type for this methods must be only TObject or IInterface
    class procedure InternalSetDataObjectAsDetail<T>(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter;
      const ADataObject: T); overload;

    class procedure AddFields(AType: TRttiType; ABindSourceAdapter: TBindSourceAdapter; const AGetMemberObject: IGetMemberObject;
      const APath: String);
    class procedure AddPropertiesToList(AType: TRttiType; ABindSourceAdapter: TBindSourceAdapter;
      AFieldsList: TList<TBindSourceAdapterField>; const AGetMemberObject: IGetMemberObject; const APath: String);
    class procedure AddChildPropertiesToList(AType: TRttiType; ABindSourceAdapter: TBindSourceAdapter;
      AFieldsList: TList<TBindSourceAdapterField>; const AMasterGetMemberObject: IGetMemberObject; const AMasterPath: String);
    class function CreateRttiPropertyField<T>(AProperty: TRttiProperty; ABindSourceAdapter: TBindSourceAdapter;
      const AGetMemberObject: IGetMemberObject; AMemberType: TScopeMemberType; const APath: String): TBindSourceAdapterField;
    class function CreateRttiObjectPropertyField<T: class>(AProperty: TRttiProperty; ABindSourceAdapter: TBindSourceAdapter;
      const AGetMemberObject: IGetMemberObject; AMemberType: TScopeMemberType; const APath: String): TBindSourceAdapterField;
  end;

implementation

uses iORM.Context.Map.Interfaces, iORM.Context.Factory, iORM.Attributes,
  System.TypInfo, System.SysUtils;

{ TioCommonBSABehavior }

class procedure TioCommonBSABehavior.InternalSetDataObjectAsDetail<T>(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter;
  const ADataObject: T);
var
  LMasterObj: TObject;
  LMasterProperty: IioContextProperty;
  LValue: TValue;
begin
  LMasterObj := AActiveBindSourceAdapter.GetMasterBindSourceAdapter.Current;
  LMasterProperty := TioContextFactory.GetPropertyByClassRefAndName(LMasterObj.ClassType,
    AActiveBindSourceAdapter.GetMasterPropertyName);
  TValue.Make(@ADataObject, LMasterProperty.GetTypeInfo, LValue);
  LMasterProperty.SetValue(LMasterObj, LValue);
  AActiveBindSourceAdapter.GetMasterBindSourceAdapter.DetailAdaptersContainer.SetMasterObject(LMasterObj);
end;

class procedure TioCommonBSABehavior.AddFields(AType: TRttiType; ABindSourceAdapter: TBindSourceAdapter;
  const AGetMemberObject: IGetMemberObject; const APath: String);
begin
  // AddFieldsToList(LType, Self, Self.Fields, LIntf); // Per ora ho deciso di non considerare gli eventuali public fields ma solo proprietà (sempre pubbliche)
  AddPropertiesToList(AType, ABindSourceAdapter, ABindSourceAdapter.Fields, AGetMemberObject, APath);
  AddChildPropertiesToList(AType, ABindSourceAdapter, ABindSourceAdapter.Fields, AGetMemberObject, APath);
end;

class procedure TioCommonBSABehavior.AddPropertiesToList(AType: TRttiType; ABindSourceAdapter: TBindSourceAdapter;
  AFieldsList: TList<TBindSourceAdapterField>; const AGetMemberObject: IGetMemberObject; const APath: String);
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
  LType := AType;
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
                LCollectionEditorField := CreateRttiPropertyField<Boolean>(LProperty, ABindSourceAdapter, AGetMemberObject,
                  mtBoolean, APath);
            tkInteger:
              begin
                case LTypeData.OrdType of
                  otSByte: // Int8
                    LCollectionEditorField := CreateRttiPropertyField<Int8>(LProperty, ABindSourceAdapter, AGetMemberObject,
                      mtInteger, APath);
                  otSWord: // Int16
                    LCollectionEditorField := CreateRttiPropertyField<Int16>(LProperty, ABindSourceAdapter, AGetMemberObject,
                      mtInteger, APath);
                  otSLong: // Int32
                    LCollectionEditorField := CreateRttiPropertyField<Int32>(LProperty, ABindSourceAdapter, AGetMemberObject,
                      mtInteger, APath);
                  otUByte: // UInt8
                    LCollectionEditorField := CreateRttiPropertyField<UInt8>(LProperty, ABindSourceAdapter, AGetMemberObject,
                      mtUInteger, APath);
                  otUWord: // UInt16
                    LCollectionEditorField := CreateRttiPropertyField<UInt16>(LProperty, ABindSourceAdapter, AGetMemberObject,
                      mtUInteger, APath);
                  otULong: // UInt32
                    LCollectionEditorField := CreateRttiPropertyField<UInt32>(LProperty, ABindSourceAdapter, AGetMemberObject,
                      mtUInteger, APath);
                else
                  LCollectionEditorField := CreateRttiPropertyField<Integer>(LProperty, ABindSourceAdapter, AGetMemberObject,
                    mtInteger, APath);
                end
              end;
            tkWChar:
              LCollectionEditorField := CreateRttiPropertyField<Char>(LProperty, ABindSourceAdapter, AGetMemberObject, mtChar, APath);
            tkUString:
              LCollectionEditorField := CreateRttiPropertyField<string>(LProperty, ABindSourceAdapter, AGetMemberObject, mtText, APath);
{$IFNDEF NEXTGEN}
            tkChar:
              LCollectionEditorField := CreateRttiPropertyField<AnsiChar>(LProperty, ABindSourceAdapter, AGetMemberObject,
                mtChar, APath);
            tkString:
              LCollectionEditorField := CreateRttiPropertyField<ShortString>(LProperty, ABindSourceAdapter, AGetMemberObject,
                mtText, APath);
            tkLString:
              LCollectionEditorField := CreateRttiPropertyField<AnsiString>(LProperty, ABindSourceAdapter, AGetMemberObject,
                mtText, APath);
{$ENDIF}
            tkFloat:
              case LTypeData^.FloatType of
                System.TypInfo.ftSingle:
                  LCollectionEditorField := CreateRttiPropertyField<single>(LProperty, ABindSourceAdapter, AGetMemberObject,
                    mtFloat, APath);
                System.TypInfo.ftDouble:
                  begin
                    if LTypeInfo = System.TypeInfo(TDate) then
                      LCollectionEditorField := CreateRttiPropertyField<TDate>(LProperty, ABindSourceAdapter, AGetMemberObject,
                        mtDate, APath)
                    else if LTypeInfo = System.TypeInfo(TTime) then
                      LCollectionEditorField := CreateRttiPropertyField<TTime>(LProperty, ABindSourceAdapter, AGetMemberObject,
                        mtTime, APath)
                    else if LTypeInfo = System.TypeInfo(TDateTime) then
                      LCollectionEditorField := CreateRttiPropertyField<TDateTime>(LProperty, ABindSourceAdapter, AGetMemberObject,
                        mtDateTime, APath)
                    else
                      LCollectionEditorField := CreateRttiPropertyField<double>(LProperty, ABindSourceAdapter, AGetMemberObject,
                        mtFloat, APath);
                  end;
                ftExtended:
                  LCollectionEditorField := CreateRttiPropertyField<Extended>(LProperty, ABindSourceAdapter, AGetMemberObject,
                    mtFloat, APath);
                ftCurr:
                  LCollectionEditorField := CreateRttiPropertyField<currency>(LProperty, ABindSourceAdapter, AGetMemberObject,
                    mtCurrency, APath);
                // ftComp:  // Not supported
              else
                Assert(False);
                LCollectionEditorField := CreateRttiPropertyField<Extended>(LProperty, ABindSourceAdapter, AGetMemberObject,
                  mtFloat, APath);
              end;
            tkInt64:
              if LTypeData.MinInt64Value > LTypeData.MaxInt64Value then
                LCollectionEditorField := CreateRttiPropertyField<UInt64>(LProperty, ABindSourceAdapter, AGetMemberObject,
                  mtUInteger, APath)
              else
                LCollectionEditorField := CreateRttiPropertyField<Int64>(LProperty, ABindSourceAdapter, AGetMemberObject,
                  mtInteger, APath);
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
                  LCollectionEditorField := CreateRttiObjectPropertyField<TObject>(LProperty, ABindSourceAdapter, AGetMemberObject,
                    mtMemo, APath)
                else if LAncestor = sTPersistent then
                  LCollectionEditorField := CreateRttiObjectPropertyField<TObject>(LProperty, ABindSourceAdapter, AGetMemberObject,
                    mtBitmap, APath)
                else
                  LCollectionEditorField := CreateRttiObjectPropertyField<TObject>(LProperty, ABindSourceAdapter, AGetMemberObject,
                    mtObject, APath)
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

class procedure TioCommonBSABehavior.AddChildPropertiesToList(AType: TRttiType; ABindSourceAdapter: TBindSourceAdapter;
      AFieldsList: TList<TBindSourceAdapterField>; const AMasterGetMemberObject: IGetMemberObject; const AMasterPath: String);
var
  LMap: IioMap;
  LProperty: IioContextProperty;
  LChildPath: String;
  LChildGetMemberObject: IGetMemberObject;
begin
  LMap := TioContextFactory.Map(AType.AsInstance.MetaclassType);
  for LProperty in LMap.GetProperties do
  begin
    if LProperty.GetRelationType in [ioRtBelongsTo, ioRTHasOne, ioRTEmbeddedHasOne] then
    begin
      LChildPath := AMasterPath + LProperty.GetName; // + '.';
      LChildGetMemberObject := TBindSourceAdapterGetChildMemberObject.Create(AMasterGetMemberObject, LProperty);
      AddFields(LProperty.GetRttiType, ABindSourceAdapter, LChildGetMemberObject, LChildPath);
    end;
  end;
end;

class function TioCommonBSABehavior.CreateRttiPropertyField<T>(AProperty: TRttiProperty; ABindSourceAdapter: TBindSourceAdapter;
  const AGetMemberObject: IGetMemberObject; AMemberType: TScopeMemberType; const APath: String): TBindSourceAdapterField;
begin
  Result := nil;
  if AProperty.IsReadable then
    if AProperty.IsWritable then
      Result := TBindSourceAdapterReadWriteField<T>.Create(ABindSourceAdapter, APath + AProperty.Name,
        TBindSourceAdapterFieldType.Create(AProperty.PropertyType.Name, AProperty.PropertyType.TypeKind), AGetMemberObject,
        TPropertyValueReader<T>.Create, TPropertyValueWriter<T>.Create, AMemberType)
    else
      Result := TBindSourceAdapterReadField<T>.Create(ABindSourceAdapter, APath + AProperty.Name,
        TBindSourceAdapterFieldType.Create(AProperty.PropertyType.Name, AProperty.PropertyType.TypeKind), AGetMemberObject,
        TPropertyValueReader<T>.Create, AMemberType);
end;

class function TioCommonBSABehavior.CreateRttiObjectPropertyField<T>(AProperty: TRttiProperty; ABindSourceAdapter: TBindSourceAdapter;
  const AGetMemberObject: IGetMemberObject; AMemberType: TScopeMemberType; const APath: String): TBindSourceAdapterField;
begin
  Result := nil;
  if AProperty.IsReadable then
    if AProperty.IsWritable then
      Result := TBindSourceAdapterReadWriteObjectField<T>.Create(ABindSourceAdapter, AProperty.Name,
        TBindSourceAdapterFieldType.Create(AProperty.PropertyType.Name, AProperty.PropertyType.TypeKind), AGetMemberObject,
        TPropertyValueReader<T>.Create, TPropertyValueWriter<T>.Create, AMemberType)
    else
      Result := TBindSourceAdapterReadObjectField<T>.Create(ABindSourceAdapter, AProperty.Name,
        TBindSourceAdapterFieldType.Create(AProperty.PropertyType.Name, AProperty.PropertyType.TypeKind), AGetMemberObject,
        TPropertyValueReader<T>.Create, AMemberType);
end;

{ TBindSourceAdapterFieldHelper }

class constructor TioBindSourceAdapterFieldHelper.Create;
var
  Ctx: TRTTIContext;
begin
  FIndexOffset := Ctx.GetType(TBindSourceAdapterField).GetField('FIndex').Offset;
end;

procedure TioBindSourceAdapterFieldHelper.SetIndex(const Value: Integer);
begin
  PInteger(Pointer(NativeInt(Self) + FIndexOffset))^ := Value;
end;

{ TBindSourceAdapterGetChildMemberObject }

constructor TBindSourceAdapterGetChildMemberObject.Create(const AMasterGetMemberObject: IGetMemberObject;
  const AMasterProperty: IioContextProperty);
begin
  FMasterMemberObject := AMasterGetMemberObject;
  FMasterProperty := AMasterProperty;
end;

function TBindSourceAdapterGetChildMemberObject.GetMemberObject: TObject;
var
  LMasterObj: TObject;
begin
  LMasterObj := FMasterMemberObject.GetMemberObject;
  Result := FMasterProperty.GetRelationChildObject(LMasterObj);
end;

end.
