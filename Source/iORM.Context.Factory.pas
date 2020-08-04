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

unit iORM.Context.Factory;

interface

uses
  iORM.Context.Properties.Interfaces,
  iORM.Context.Interfaces,
  iORM.CommonTypes,
  iORM.Context.Table.Interfaces, System.Rtti,
  iORM.Attributes, System.Generics.Collections,
  iORM.Context.Map.Interfaces, iORM.Where.Interfaces;

type

  // Properties builder
  TioContextFactory = class
  public
    // I primi due metodi di classe dovranno essere spostati come protetti o privati
    class function GetProperty(const ATable: IioContextTable; const ARttiPropField: TRttiMember;
      const ATypeAlias, ASqlFieldName, ALoadSql, AFieldType: String; const ASkipped: Boolean; const AReadWrite: TioReadWrite;
      const ARelationType: TioRelationType; const ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName: String;
      const ARelationLoadType: TioLoadType; const AMetadata_FieldType: TioMetadataFieldType; const AMetadata_FieldLength: Integer;
      const AMetadata_FieldPrecision: Integer; const AMetadata_FieldScale: Integer; const AMetadata_FieldNotNull: Boolean;
      const AMetadata_Default: TValue; const AMetadata_FieldUnicode: Boolean; const AMetadata_CustomFieldType: string;
      const AMetadata_FieldSubType: string; const AMetadata_FKCreate: TioFKCreate; const AMetadata_FKOnDeleteAction: TioFKAction;
      const AMetadata_FKOnUpdateAction: TioFKAction): IioContextProperty;
    class function Properties(const Typ: TRttiInstanceType; const ATable: IioContextTable): IioContextProperties;
    class function ClassFromField(Typ: TRttiInstanceType; const ASqlFieldName: String = IO_CLASSFROMFIELD_FIELDNAME): IioClassFromField;
    class function Joins: IioJoins;
    class function JoinItem(const AJoinAttribute: ioJoin): IioJoinItem;
    class function GroupBy(const ASqlText: String): IioGroupBy;
    class function Table(const Typ: TRttiInstanceType): IioContextTable;
    class function Map(const AClassRef: TioClassRef): IioMap;
    class function Context(const AClassName: String; const AioWhere: IioWhere = nil; const ADataObject: TObject = nil): IioContext;
    class function GetPropertyByClassRefAndName(const AClassRef: TioClassRef; const APropertyName: String): IioContextProperty;
    class function GetIDPropertyByClassRef(const AClassRef: TioClassRef): IioContextProperty;
  end;

implementation

uses
  iORM.Context, iORM.Context.Properties,
  System.SysUtils, iORM.Context.Table,
  iORM.RttiContext.Factory, iORM.Context.Container, iORM.Context.Map,
  System.StrUtils, iORM.Exceptions;

{ TioBuilderProperties }

class function TioContextFactory.ClassFromField(Typ: TRttiInstanceType; const ASqlFieldName: String): IioClassFromField;
var
  Ancestors, QualifiedClassName, ClassName: String;
begin
  // ClassName
  ClassName := Typ.MetaclassType.ClassName;
  QualifiedClassName := Typ.QualifiedName;
  // Loop for all ancestors
  repeat
  begin
    Ancestors := Ancestors + '<' + Typ.Name + '>';
    Typ := Typ.BaseType;
  end;
  until not Assigned(Typ);
  // Create
  Result := TioClassFromField.Create(ASqlFieldName);
end;

class function TioContextFactory.Context(const AClassName: String; const AioWhere: IioWhere; const ADataObject: TObject): IioContext;
begin
  // Get the Context from the ContextContainer
  Result := TioContext.Create(AClassName, TioMapContainer.GetMap(AClassName), AioWhere, ADataObject);
end;

class function TioContextFactory.GetIDPropertyByClassRef(const AClassRef: TioClassRef): IioContextProperty;
begin
  Result := Self.Map(AClassRef).GetProperties.GetIdProperty;
end;

class function TioContextFactory.GetProperty(const ATable: IioContextTable; const ARttiPropField: TRttiMember;
  const ATypeAlias, ASqlFieldName, ALoadSql, AFieldType: String; const ASkipped: Boolean; const AReadWrite: TioReadWrite;
  const ARelationType: TioRelationType; const ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName: String;
  const ARelationLoadType: TioLoadType; const AMetadata_FieldType: TioMetadataFieldType; const AMetadata_FieldLength: Integer;
  const AMetadata_FieldPrecision: Integer; const AMetadata_FieldScale: Integer; const AMetadata_FieldNotNull: Boolean;
  const AMetadata_Default: TValue; const AMetadata_FieldUnicode: Boolean; const AMetadata_CustomFieldType: string;
  const AMetadata_FieldSubType: string; const AMetadata_FKCreate: TioFKCreate; const AMetadata_FKOnDeleteAction: TioFKAction;
  const AMetadata_FKOnUpdateAction: TioFKAction): IioContextProperty;
begin
  case ATable.GetMapMode of
    // Properties map mode
    ioProperties:
      Result := TioProperty.Create(ARttiPropField as TRttiProperty, ATable, ATypeAlias, ASqlFieldName, ALoadSql, AFieldType, ASkipped,
        AReadWrite, ARelationType, ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName, ARelationLoadType,
        AMetadata_FieldType, AMetadata_FieldLength, AMetadata_FieldPrecision, AMetadata_FieldScale, AMetadata_FieldNotNull,
        AMetadata_Default, AMetadata_FieldUnicode, AMetadata_CustomFieldType, AMetadata_FieldSubType, AMetadata_FKCreate,
        AMetadata_FKOnDeleteAction, AMetadata_FKOnUpdateAction);
    // Fields map mode
    ioFields:
      Result := TioField.Create(ARttiPropField as TRttiField, ATable, ATypeAlias, ASqlFieldName, ALoadSql, AFieldType, ASkipped,
        AReadWrite, ARelationType, ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName, ARelationLoadType,
        AMetadata_FieldType, AMetadata_FieldLength, AMetadata_FieldPrecision, AMetadata_FieldScale, AMetadata_FieldNotNull,
        AMetadata_Default, AMetadata_FieldUnicode, AMetadata_CustomFieldType, AMetadata_FieldSubType, AMetadata_FKCreate,
        AMetadata_FKOnDeleteAction, AMetadata_FKOnUpdateAction);
  end;
end;

class function TioContextFactory.GetPropertyByClassRefAndName(const AClassRef: TioClassRef; const APropertyName: String)
  : IioContextProperty;
begin
  Result := Self.Map(AClassRef).GetProperties.GetPropertyByName(APropertyName);
end;

class function TioContextFactory.GroupBy(const ASqlText: String): IioGroupBy;
begin
  Result := TioGroupBy.Create(ASqlText);
end;

class function TioContextFactory.JoinItem(const AJoinAttribute: ioJoin): IioJoinItem;
begin
  Result := TioJoinItem.Create(AJoinAttribute.JoinType, AJoinAttribute.JoinClassRef, AJoinAttribute.JoinCondition);
end;

class function TioContextFactory.Joins: IioJoins;
begin
  Result := TioJoins.Create;
end;

class function TioContextFactory.Map(const AClassRef: TioClassRef): IioMap;
var
  ARttiContext: TRttiContext;
  ARttiType: TRttiInstanceType;
  ATable: IioContextTable;
begin
  // Rtti init
  ARttiContext := TioRttiContextFactory.RttiContext;
  ARttiType := ARttiContext.GetType(AClassRef).AsInstance;
  // Get the table
  ATable := Self.Table(ARttiType);
  // Create the context
  Result := TioMap.Create(AClassRef, ARttiContext, ARttiType, ATable, Self.Properties(ARttiType, ATable));
end;

class function TioContextFactory.Properties(const Typ: TRttiInstanceType; const ATable: IioContextTable): IioContextProperties;
var
  Prop: System.Rtti.TRttiMember;
  PropsFields: TArray<System.Rtti.TRttiMember>;
  Attr: TCustomAttribute;
  PropID: Boolean;
  PropIDSkipOnInsert: Boolean;
  PropTypeAlias: String;
  PropFieldName: String;
  PropFieldType: String;
  PropLoadSql: String;
  PropSkip: Boolean;
  PropReadWrite: TioReadWrite;
  PropRelationType: TioRelationType;
  PropRelationChildTypeName: String;
  PropRelationChildTypeAlias: String;
  PropRelationChildPropertyName: String;
  PropRelationChildLoadType: TioLoadType;
  // FIeld metadata
  PropMetadata_FieldType: TioMetadataFieldType;
  PropMetadata_FieldSubType: string;
  PropMetadata_FieldLength: Integer;
  PropMetadata_FieldPrecision: Integer;
  PropMetadata_FieldScale: Integer;
  PropMetadata_FieldNotNull: Boolean;
  PropMetadata_FieldUnicode: Boolean;
  PropMetadata_CustomFieldType: string;
  PropMetadata_Default: TValue;
  PropMetadata_FKAutoCreate: TioFKCreate;
  PropMetadata_FKOnDeleteAction: TioFKAction;
  PropMetadata_FKOnUpdateAction: TioFKAction;
  // O.B. 26/06/18 - Used by DBBuilder
  LRttiProperty: TRttiProperty;
  LRttiField: TRttiField;

  function GetMetadata_FieldTypeByTypeKind(const ATypeKind: TTypeKind; const AQualifiedName: string): TioMetadataFieldType;
  begin
    Result := ioMdInteger;
    case ATypeKind of
      tkEnumeration:
        if AQualifiedName = 'System.Boolean' then
          Exit(ioMdBoolean)
        else
          Exit(ioMdInteger);
      tkInteger, tkInt64:
        Exit(ioMdInteger);
      tkFloat:
        if AQualifiedName = 'System.TDate' then
          Exit(ioMdDate)
        else if AQualifiedName = 'System.TDateTime' then
          Exit(ioMdDateTime)
        else if AQualifiedName = 'System.TTime' then
          Exit(ioMdTime)
        else
          Exit(ioMdDecimal);
      tkString, tkLString, tkWString, tkUString:
        Exit(ioMdVarchar);
      tkRecord:
        if AQualifiedName = 'System.SysUtils.TTimeStamp' then
          Exit(ioMdDateTime);
      tkClass, tkInterface:
        Exit(ioMdBinary);
    end;
  end;

begin
  // Get members list (Properties or Fields)
  case ATable.GetMapMode of
    ioProperties:
      PropsFields := TArray<System.Rtti.TRttiMember>(TObject(Typ.AsInstance.GetProperties));
    ioFields:
      PropsFields := TArray<System.Rtti.TRttiMember>(TObject(Typ.AsInstance.GetFields));
  end;
  // Create result Properties object
  Result := TioProperties.Create;
  // Loop all properties
  for Prop in PropsFields do
  begin
    // Getting metedata FieldType from Prop TypeKind (DBBuilder)
    if Prop is TRttiProperty then
    begin
      LRttiProperty := Prop as TRttiProperty;
      PropMetadata_FieldType := GetMetadata_FieldTypeByTypeKind(LRttiProperty.PropertyType.TypeKind,
        LRttiProperty.PropertyType.QualifiedName);
    end
    else if Prop is TRttiField then
    begin
      LRttiField := Prop as TRttiField;
      PropMetadata_FieldType := GetMetadata_FieldTypeByTypeKind(LRttiField.FieldType.TypeKind, LRttiField.FieldType.QualifiedName);
    end
    else
      raise EioException.Create(Self.ClassName + '.Properties: Invalid property/field type.');

    // ====================================================================================================
    // Mauri 08/02/2020: Secondo me questo blocco di codice si può eliminare del tutto perchè tanto, arrivati qui
    // il Metadata_FieldType è stato già determinato in modo corretto dalle righe precedenti
    // anche nel caso di una proprietà contente un oggetto e con relazione EmbeddedHasOne/Many
    // ----------------------------------------------------------------------------------------------------
    // // M.M. 08/10/18
    // // Controlla gli attributi per capire se ci sono relazioni Embedded
    // // per poter stabilire il tipo di default da utilizzare per la
    // // creazione del campo nel builder se non viene specificato un
    // // attributo specifico
    // // Mauri: Non si potrebbe evitare di ciclare per tutti gli attributi qui visto che lo facciamo già
    // //         più sotto? Potremmo unire i due cicli facendone uno solo?
    // for Attr in Prop.GetAttributes do
    // begin
    // // M.M. 27/09/18 Nel caso di relazioni ioRTEmbeddedHasOne, ioRTEmbeddedHasMany
    // // viene impostato un campo di tipo binary
    // if (Attr is ioEmbeddedHasOne) or (Attr is ioEmbeddedHasMany) then
    // begin
    // PropMetadata_FieldType := ioMdBinary;
    // Break;
    // end;
    // end;
    // ====================================================================================================

    PropMetadata_FieldLength := IO_DEFAULT_FIELD_LENGTH;
    PropMetadata_FieldPrecision := IO_DEFAULT_FIELD_PRECISION;
    PropMetadata_FieldScale := IO_DEFAULT_FIELD_SCALE;
    PropMetadata_FieldNotNull := False;
    PropMetadata_FieldUnicode := True;
    PropMetadata_CustomFieldType := '';
    PropMetadata_FieldSubType := '';
    PropMetadata_FKAutoCreate := fkCreate;
    PropMetadata_FKOnDeleteAction := fkUnspecified;
    PropMetadata_FKOnUpdateAction := fkUnspecified;

    // PropFieldName: if the MapMpde is ioFields then remove the first character ("F" usually)
    PropFieldName := Prop.Name;
    if (ATable.GetMapMode = ioFields) then
      PropFieldName := TioField.Remove_F_FromName(PropFieldName);
    // Elimina il primo carattere (di solito la F)
    // Skip RefCount property from TInterfacedObject
    // Se la proprietà esiste già nella mappa (può accadere quando si fa property override)
    if (PropFieldName = 'RefCount') or (PropFieldName = 'Disposed') or Result.PropertyExists(PropFieldName) then
      Continue;
    // ObjStatus property
    if PropFieldName = 'ObjStatus' then
    begin
      Result.ObjStatusProperty := Self.GetProperty(ATable, Prop, '', '', '', '', True, iorwReadOnly, ioRTNone, '', '', '', ioEagerLoad,
        PropMetadata_FieldType, PropMetadata_FieldLength, PropMetadata_FieldPrecision, PropMetadata_FieldScale,
        PropMetadata_FieldNotNull, nil, PropMetadata_FieldUnicode, PropMetadata_CustomFieldType, PropMetadata_FieldSubType,
        PropMetadata_FKAutoCreate, PropMetadata_FKOnUpdateAction, PropMetadata_FKOnDeleteAction);
      Continue;
    end;
    // Prop Init
    PropID := (Uppercase(PropFieldName) = 'ID');
    // Is a OID property if the name of the property itself is 'ID'
    PropIDSkipOnInsert := True;
    PropTypeAlias := '';
    PropFieldType := '';
    PropLoadSql := '';
    PropSkip := False;
    PropReadWrite := iorwReadWrite;
    PropRelationType := ioRTNone;
    PropRelationChildTypeName := '';
    PropRelationChildTypeAlias := '';
    PropRelationChildPropertyName := '';
    PropRelationChildLoadType := ioEagerLoad;
    // Check attributes
    for Attr in Prop.GetAttributes do
    begin
      if Attr is ioOID then
      begin
        PropID := True;
        PropIDSkipOnInsert := ioOID(Attr).SkipOnInsert;
      end;
      if Attr is ioTypeAlias then
        PropTypeAlias := ioTypeAlias(Attr).Value;
      if Attr is ioField then
        PropFieldName := ioField(Attr).Value;
      if Attr is ioFieldType then
        PropFieldType := ioFieldType(Attr).Value;
      if Attr is ioLoadSql then
        PropLoadSql := ioLoadSql(Attr).Value;
      if Attr is ioSkip then
        PropSkip := True;
      if Attr is ioLoadOnly then
        PropReadWrite := iorwReadOnly;
      if Attr is ioPersistOnly then
        PropReadWrite := iorwWriteOnly;
      // Relations
      if Attr is ioEmbeddedHasMany then
      begin
        PropRelationType := ioRTEmbeddedHasMany;
        PropRelationChildTypeName := ioEmbeddedHasMany(Attr).ChildTypeName;
        PropRelationChildTypeAlias := ioEmbeddedHasMany(Attr).ChildTypeAlias;
      end;
      if Attr is ioEmbeddedHasOne then
      begin
        PropRelationType := ioRTEmbeddedHasOne;
        PropRelationChildTypeName := ioEmbeddedHasOne(Attr).ChildTypeName;
        PropRelationChildTypeAlias := ioEmbeddedHasOne(Attr).ChildTypeAlias;
      end;
      if Attr is ioBelongsTo then
      begin
        PropRelationType := ioRTBelongsTo;
        PropRelationChildTypeName := ioBelongsTo(Attr).ChildTypeName;
        PropRelationChildTypeAlias := ioBelongsTo(Attr).ChildTypeAlias;
        PropMetadata_FieldType := ioMdInteger; // If is a BelongsTo relation then the field type on DB in integer
      end;
      if Attr is ioHasMany then
      begin
        PropRelationType := ioRTHasMany;
        PropRelationChildTypeName := ioHasMany(Attr).ChildTypeName;
        PropRelationChildTypeAlias := ioHasMany(Attr).ChildTypeAlias;
        PropRelationChildPropertyName := ioHasMany(Attr).ChildPropertyName;
        PropRelationChildLoadType := ioHasMany(Attr).LoadType;
      end;
      if Attr is ioHasOne then
      begin
        PropRelationType := ioRTHasOne;
        PropRelationChildTypeName := ioHasOne(Attr).ChildTypeName;
        PropRelationChildTypeAlias := ioHasOne(Attr).ChildTypeAlias;
        PropRelationChildPropertyName := ioHasOne(Attr).ChildPropertyName;
      end;

      // Indexes
      if Attr is ioIndex then
      begin
        // If the "ACommaSepFieldList" is empty then set the current property field name
        if ioIndex(Attr).CommaSepFieldList.IsEmpty then
          ioIndex(Attr).CommaSepFieldList := PropFieldName;
        // Add the current index attribute
        ATable.GetIndexList(True).Add(ioIndex(Attr));
      end;
      // M.M. 01/08/18 - Metadata Used by DBBuilder
      if Attr is ioFTVarchar then
      begin
        PropMetadata_FieldType := ioMdVarchar;
        PropMetadata_FieldLength := ioFTVarchar(Attr).Length;
        PropMetadata_FieldNotNull := ioFTVarchar(Attr).NotNull;
        PropMetadata_FieldUnicode := ioFTVarchar(Attr).IsUnicode;
      end;
      if Attr is ioFTChar then
      begin
        PropMetadata_FieldType := ioMdChar;
        PropMetadata_FieldLength := ioFTChar(Attr).Length;
        PropMetadata_FieldNotNull := ioFTChar(Attr).NotNull;
        PropMetadata_FieldUnicode := ioFTChar(Attr).IsUnicode;
      end;
      if Attr is ioFTInteger then
      begin
        PropMetadata_FieldType := ioMdInteger;
        PropMetadata_FieldPrecision := ioFTInteger(Attr).Precision;
        PropMetadata_FieldNotNull := ioFTChar(Attr).NotNull;
      end;
      if Attr is ioFTFloat then
      begin
        PropMetadata_FieldType := ioMdFloat;
        PropMetadata_FieldNotNull := ioFTFloat(Attr).NotNull;
      end;
      if Attr is ioFTDate then
      begin
        PropMetadata_FieldType := ioMdDate;
        PropMetadata_FieldNotNull := ioFTDate(Attr).NotNull;
      end;
      if Attr is ioFTTime then
      begin
        PropMetadata_FieldType := ioMdTime;
        PropMetadata_FieldNotNull := ioFTTime(Attr).NotNull;
      end;
      if Attr is ioFTDateTime then
      begin
        PropMetadata_FieldType := ioMdDateTime;
        PropMetadata_FieldNotNull := ioFTDateTime(Attr).NotNull;
      end;
      if Attr is ioFTDecimal then
      begin
        PropMetadata_FieldType := ioMdDecimal;
        PropMetadata_FieldPrecision := ioFTDecimal(Attr).Precision;
        PropMetadata_FieldScale := ioFTDecimal(Attr).Scale;
        PropMetadata_FieldNotNull := ioFTDecimal(Attr).NotNull;
      end;
      if Attr is ioFTNumeric then
      begin
        PropMetadata_FieldType := ioMdNumeric;
        PropMetadata_FieldPrecision := ioFTNumeric(Attr).Precision;
        PropMetadata_FieldScale := ioFTNumeric(Attr).Scale;
        PropMetadata_FieldNotNull := ioFTNumeric(Attr).NotNull;
      end;
      if Attr is ioFTBoolean then
      begin
        PropMetadata_FieldType := ioMdBoolean;
        PropMetadata_FieldNotNull := ioFTBoolean(Attr).NotNull;
      end;
      if Attr is ioFTBinary then
      begin
        PropMetadata_FieldType := ioMdBinary;
        PropMetadata_FieldSubType := ioFTBinary(Attr).BinarySubType;
        PropMetadata_FieldNotNull := ioFTBinary(Attr).NotNull;
      end;
      if Attr is ioFTCustom then
      begin
        PropMetadata_FieldType := ioMdCustomFieldType;
        PropMetadata_CustomFieldType := ioFTCustom(Attr).Value;
      end;
      if Attr is ioFTDefault then
        PropMetadata_Default := ioFTDefault(Attr).Value;
      if Attr is ioForeignKey then
      begin
        PropMetadata_FKAutoCreate := ioForeignKey(Attr).AutoCreate;
        PropMetadata_FKOnDeleteAction := ioForeignKey(Attr).OnDeleteAction;
        PropMetadata_FKOnUpdateAction := ioForeignKey(Attr).OnUpdateAction;
      end;

    end;
    // Create and add property
    Result.Add(Self.GetProperty(ATable, Prop, PropTypeAlias, PropFieldName, PropLoadSql, PropFieldType, PropSkip, PropReadWrite,
      PropRelationType, PropRelationChildTypeName, PropRelationChildTypeAlias, PropRelationChildPropertyName, PropRelationChildLoadType,
      PropMetadata_FieldType, PropMetadata_FieldLength, PropMetadata_FieldPrecision, PropMetadata_FieldScale, PropMetadata_FieldNotNull,
      PropMetadata_Default, PropMetadata_FieldUnicode, PropMetadata_CustomFieldType, PropMetadata_FieldSubType,
      PropMetadata_FKAutoCreate, PropMetadata_FKOnDeleteAction, PropMetadata_FKOnUpdateAction), PropID, PropIDSkipOnInsert);
  end;
end;

class function TioContextFactory.Table(const Typ: TRttiInstanceType): IioContextTable;
var
  LAttr: TCustomAttribute;
  LTableName, LConnectionDefName, LKeyGenerator: String;
  LClassFromField: IioClassFromField;
  LJoins: IioJoins;
  LGroupBy: IioGroupBy;
  LMapMode: TioMapModeType;
  LIndexList: TioIndexList;
  LAutoCreateDB: Boolean;
begin
  try
    // Prop Init
    LTableName := Typ.MetaclassType.ClassName.Substring(1);
    // Elimina il primo carattere (di solito la T)
    LConnectionDefName := '';
    LKeyGenerator := '';
    LJoins := Self.Joins;
    LClassFromField := nil;
    LGroupBy := nil;
    LMapMode := ioProperties;
    LIndexList := nil;
    LAutoCreateDB := True;
    // Check attributes
    for LAttr in Typ.GetAttributes do
    begin
      if (LAttr is ioTable) then
      begin
        if not ioTable(LAttr).Value.IsEmpty then
          LTableName := ioTable(LAttr).Value;
        LMapMode := ioTable(LAttr).MapMode;
      end;
      if LAttr is ioKeyGenerator then
        LKeyGenerator := ioKeyGenerator(LAttr).Value;
      if LAttr is ioConnectionDefName then
        LConnectionDefName := ioConnectionDefName(LAttr).Value;
      if LAttr is ioClassFromField then
        LClassFromField := Self.ClassFromField(Typ);
      if LAttr is ioJoin then
        LJoins.Add(Self.JoinItem(ioJoin(LAttr)));
      if (LAttr is ioGroupBy) and (not Assigned(LGroupBy)) then
        LGroupBy := Self.GroupBy(ioGroupBy(LAttr).Value);
      if LAttr is ioDisableAutoCreateDB then
        LAutoCreateDB := False;
      // Index attribute (NB: costruisce la lista di indici solo se serve e così anche nella mappa)
      if LAttr is ioIndex then
      begin
        if not Assigned(LIndexList) then
          LIndexList := TioIndexList.Create;
        LIndexList.Add(ioIndex(LAttr));
      end;
    end;
    // KeyGenerator
    if LKeyGenerator.IsEmpty then
      LKeyGenerator := LTableName;
    // Create result Properties object
    Result := TioContextTable.Create(LTableName, LKeyGenerator, LClassFromField, LJoins, LGroupBy, LConnectionDefName, LMapMode,
      LAutoCreateDB, Typ);
    // If an IndexList is present then assign it to the ioTable
    if Assigned(LIndexList) and (LIndexList.Count > 0) then
      Result.SetIndexList(LIndexList);
  finally
    // Free the IndexList if necessary
    if Assigned(LIndexList) and (LIndexList.Count = 0) then
      FreeAndNil(LIndexList);
  end;
end;

end.
