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
    class function GetProperty(const AMapMode:TioMapModeType; const ARttiPropField:TRttiMember; const ATypeAlias, ASqlFieldName, ALoadSql, AFieldType:String;
      const AReadWrite:TioReadWrite; const ARelationType:TioRelationType; const ARelationChildTypeName, ARelationChildTypeAlias,
      ARelationChildPropertyName:String; const ARelationLoadType:TioLoadType; const ARelationChildAutoIndex:Boolean): IioContextProperty;
    class function Properties(const Typ: TRttiInstanceType; const ATable: IioContextTable): IioContextProperties;
    class function ClassFromField(Typ: TRttiInstanceType; const ASqlFieldName:String=IO_CLASSFROMFIELD_FIELDNAME): IioClassFromField;
    class function Joins: IioJoins;
    class function JoinItem(const AJoinAttribute:ioJoin): IioJoinItem;
    class function GroupBy(const ASqlText:String): IioGroupBy;
    class function Table(const Typ: TRttiInstanceType): IioContextTable;
    class function Map(const AClassRef: TioClassRef): IioMap;
    class function Context(const AClassName: String; const AioWhere:IioWhere=nil; const ADataObject:TObject=nil; const AConnectionName:String=''): IioContext;
    class function GetPropertyByClassRefAndName(const AClassRef: TioClassRef; const APropertyName:String): IioContextProperty;
    class function GetIDPropertyByClassRef(const AClassRef: TioClassRef): IioContextProperty;
  end;

implementation

uses
  iORM.Context, iORM.Context.Properties,
  System.SysUtils, iORM.Context.Table,
  iORM.RttiContext.Factory, iORM.Context.Container, iORM.Context.Map,
  System.StrUtils;

{ TioBuilderProperties }

class function TioContextFactory.ClassFromField(Typ: TRttiInstanceType;
  const ASqlFieldName: String): IioClassFromField;
var
  Ancestors, QualifiedClassName, ClassName:String;
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
  Result := TioClassFromField.Create(ASqlFieldName, ClassName, QualifiedClassName, Ancestors);
end;

class function TioContextFactory.Context(const AClassName: String;
  const AioWhere: IioWhere; const ADataObject: TObject; const AConnectionName:String): IioContext;
begin
  // Get the Context from the ContextContainer
  Result := TioContext.Create(AClassName,
                              TioMapContainer.GetMap(AClassName),
                              AioWhere,
                              ADataObject,
                              AConnectionName
                              );
end;

class function TioContextFactory.GetIDPropertyByClassRef(
  const AClassRef: TioClassRef): IioContextProperty;
begin
  Result := Self.Map(AClassRef).GetProperties.GetIdProperty;
end;

class function TioContextFactory.GetProperty(const AMapMode:TioMapModeType; const ARttiPropField: TRttiMember; const ATypeAlias, ASqlFieldName, ALoadSql,
  AFieldType: String; const AReadWrite: TioReadWrite; const ARelationType: TioRelationType; const ARelationChildTypeName,
  ARelationChildTypeAlias, ARelationChildPropertyName: String; const ARelationLoadType: TioLoadType; const ARelationChildAutoIndex:Boolean): IioContextProperty;
begin
  case AMapMode of
    // Properties map mode
    ioProperties:
      Result := TioProperty.Create(
         ARttiPropField as TRttiProperty
        ,ATypeAlias
        ,ASqlFieldName
        ,ALoadSql
        ,AFieldType
        ,AReadWrite
        ,ARelationType
        ,ARelationChildTypeName
        ,ARelationChildTypeAlias
        ,ARelationChildPropertyName
        ,ARelationLoadType
        ,ARelationChildAutoIndex
      );
    // Fields map mode
    ioFields:
      Result := TioField.Create(
         ARttiPropField as TRttiField
        ,ATypeAlias
        ,ASqlFieldName
        ,ALoadSql
        ,AFieldType
        ,AReadWrite
        ,ARelationType
        ,ARelationChildTypeName
        ,ARelationChildTypeAlias
        ,ARelationChildPropertyName
        ,ARelationLoadType
        ,ARelationChildAutoIndex
      );
  end;
end;

class function TioContextFactory.GetPropertyByClassRefAndName(
  const AClassRef: TioClassRef;
  const APropertyName: String): IioContextProperty;
begin
  Result := Self.Map(AClassRef).GetProperties.GetPropertyByName(APropertyName);
end;

class function TioContextFactory.GroupBy(const ASqlText:String): IioGroupBy;
begin
  Result := TioGroupBy.Create(ASqlText);
end;

class function TioContextFactory.JoinItem(const AJoinAttribute:ioJoin): IioJoinItem;
begin
  Result := TioJoinItem.Create(AJoinAttribute.JoinType,
                               AJoinAttribute.JoinClassRef,
                               AJoinAttribute.JoinCondition
                              );
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
  Result := TioMap.Create(AClassRef,
                          ARttiContext,
                          ARttiType,
                          ATable,
                          Self.Properties(ARttiType, ATable)
                         );
end;

class function TioContextFactory.Properties(
  const Typ: TRttiInstanceType; const ATable: IioContextTable): IioContextProperties;
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
  PropRelationChildAutoIndex: Boolean;
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
    // PropFieldName: if the MapMpde is ioFields then remove the first character ("F" usually)
    PropFieldName := Prop.Name;
    if (ATable.GetMapMode = ioFields) then
      PropFieldName := TioField.Remove_F_FromName(PropFieldName);  // Elimina il primo carattere (di solito la F)
    // Skip RefCount property from TInterfacedObject
    if (PropFieldName = 'RefCount')
    or (PropFieldName = 'Disposed')
      then Continue;
    // ObjStatus property
    if PropFieldName = 'ObjStatus' then
    begin
      Result.ObjStatusProperty := Self.GetProperty(ATable.GetMapMode, Prop, '', '', '', '', iorwReadOnly, ioRTNone, '', '', '', ioImmediateLoad, False);
      Continue;
    end;
    // Prop Init
    PropId := (Uppercase(PropFieldName) = 'ID');  // Is a OID property if the name of the property itself is 'ID'
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
    PropRelationChildLoadType := ioImmediateLoad;
    PropRelationChildAutoIndex := False;
    // Check attributes
    for Attr in Prop.GetAttributes do
    begin
      if Attr is ioOID then
      begin
        PropID := True;
        PropIDSkipOnInsert := ioOID(Attr).SkipOnInsert;
      end;
      if Attr is ioTypeAlias then PropTypeAlias := ioTypeAlias(Attr).Value;
      if Attr is ioField then PropFieldName := ioField(Attr).Value;
      if Attr is ioFieldType then PropFieldType := ioFieldType(Attr).Value;
      if Attr is ioLoadSql then PropLoadSql := ioLoadSql(Attr).Value;
      if Attr is ioSkip then PropSkip := True;
      if Attr is ioReadOnly then PropReadWrite := iorwReadOnly;
      if Attr is ioWriteOnly then PropReadWrite := iorwWriteOnly;
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
      end;
      if Attr is ioHasMany then
      begin
        PropRelationType := ioRTHasMany;
        PropRelationChildTypeName := ioHasMany(Attr).ChildTypeName;
        PropRelationChildTypeAlias := ioHasMany(Attr).ChildTypeAlias;
        PropRelationChildPropertyName := ioHasMany(Attr).ChildPropertyName;
        PropRelationChildLoadType := ioHasMany(Attr).LoadType;
        PropRelationChildAutoIndex := ioHasMany(Attr).AutoIndex;
      end;
      if Attr is ioHasOne then
      begin
        PropRelationType := ioRTHasOne;
        PropRelationChildTypeName := ioHasOne(Attr).ChildTypeName;
        PropRelationChildTypeAlias := ioHasOne(Attr).ChildTypeAlias;
        PropRelationChildPropertyName := ioHasOne(Attr).ChildPropertyName;
        PropRelationChildAutoIndex := ioHasMany(Attr).AutoIndex;
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
    end;
    // Create and add property
    if not PropSkip then Result.Add(Self.GetProperty(ATable.GetMapMode
                                                    ,Prop
                                                    ,PropTypeAlias
                                                    ,PropFieldName
                                                    ,PropLoadSql
                                                    ,PropFieldType
                                                    ,PropReadWrite
                                                    ,PropRelationType
                                                    ,PropRelationChildTypeName
                                                    ,PropRelationChildTypeAlias
                                                    ,PropRelationChildPropertyName
                                                    ,PropRelationChildLoadType
                                                    ,PropRelationChildAutoIndex)
                                    ,PropId
                                    ,PropIDSkipOnInsert
                                    );
  end;
end;

class function TioContextFactory.Table(const Typ: TRttiInstanceType): IioContextTable;
var
  Attr: TCustomAttribute;
  TableName, ConnectionDefName, AKeyGenerator: String;
  ClassFromField: IioClassFromField;
  AJoins: IioJoins;
  AGroupBy: IioGroupBy;
  AMapMode: TioMapModeType;
  LIndexList: TioIndexList;
begin
  try
    // Prop Init
    TableName := Typ.MetaclassType.ClassName.Substring(1);  // Elimina il primo carattere (di solito la T)
    ConnectionDefName := '';
    AKeyGenerator := '';
    AJoins := Self.Joins;
    AGroupBy := nil;
    AMapMode := ioProperties;
    LIndexList := nil;
    // Check attributes
    for Attr in Typ.GetAttributes do
    begin
      if (Attr is ioTable) then
      begin
        if not ioTable(Attr).Value.IsEmpty then TableName := ioTable(Attr).Value;
        AMapMode := ioTable(Attr).MapMode;
      end;
      if Attr is ioKeyGenerator then AKeyGenerator := ioKeyGenerator(Attr).Value;
      if Attr is ioConnectionDefName then ConnectionDefName := ioConnectionDefName(Attr).Value;
      if Attr is ioClassFromField then ClassFromField := Self.ClassFromField(Typ);
      if Attr is ioJoin then AJoins.Add(Self.JoinItem(   ioJoin(Attr)   ));
      if (Attr is ioGroupBy) and (not Assigned(AGroupBy)) then AGroupBy := Self.GroupBy(   ioGroupBy(Attr).Value   );
      // Index attribute (NB: costruisce la lista di indici solo se serve e così anche nella mappa)
      if Attr is ioIndex then
      begin
        if not Assigned(LIndexList) then
          LIndexList := TioIndexList.Create(False);
        LIndexList.Add(ioIndex(Attr));
      end;
    end;
    // KeyGenerator
    if AKeyGenerator.IsEmpty then AKeyGenerator := TableName;
    // Create result Properties object
    Result := TioContextTable.Create(TableName, AKeyGenerator, ClassFromField, AJoins, AGroupBy, ConnectionDefName, AMapMode, Typ);
    // If an IndexList is present then assign it to the ioTable
    if Assigned(LIndexList) and (LIndexList.Count > 0) then
      Result.SetIndexList(LIndexList);
  finally
    // Free the IndexList if necessary
    if Assigned(LIndexList) and (LIndexList.Count = 0) then
      LIndexList.Free;
  end;
end;

end.
