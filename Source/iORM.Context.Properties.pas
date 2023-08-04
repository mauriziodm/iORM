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
unit iORM.Context.Properties;

interface

uses
  iORM.Context.Properties.Interfaces,
  iORM.CommonTypes,
  iORM.Attributes,
  iORM.SqlItems,
  System.Rtti,
  System.Generics.Collections, iORM.Context.Table.Interfaces, System.Classes,
  System.TypInfo, iORM.Context.Interfaces;

type

  // Classe che rappresenta una proprietà
  TioProperty = class(TInterfacedObject, IioProperty)
  strict private
    FTransient: Boolean;
    FRttiProperty: TRttiProperty;
    FTypeAlias: String;
    FFieldDefinitionString, FSqlFieldTableName, FSqlFieldName, FSqlFieldAlias: String;
    FLoadSql: String;
    FFieldType: String;
    FRelationType: TioRelationType;
    FRelationChildTypeName: String;
    FRelationChildTypeAlias: String;
    FRelationChildPropertyName: String;
    FRelationChildPropertyPath: TStrings;
    FRelationLazyLoad: Boolean;
    FNotHasMany: Boolean;
    FTable: IioTable;
    FReadWrite: TioLoadPersist;
    // Smart where
    FWhereCompareOp: TioCompareOp;
    FWhereGroupLogicOp: TioLogicOp;
    FWhereGroupName: String;
    FWhereLogicOp: TioLogicOp;
    FWhereMasterGroupName: String;
    FWhereNullValue: TValue;
    FWhereSkip: Boolean;
    FWhereTargetPropName: String;
    // M.M. 01/08/18 - MetadataType used by DBBuilder
    FMetadata_FieldType: TioMetadataFieldType;
    FMetadata_FieldLength: Integer;
    FMetadata_FieldPrecision: Integer;
    FMetadata_FieldScale: Integer;
    FMetadata_FieldNotNull: Boolean;
    FMetadata_FieldUnicode: Boolean;
    FMetadata_CustomFieldType: string;
    FMetadata_Default: TValue;
    FMetadata_FieldSubType: string;
    FMetadata_FKCreate: TioFKCreate;
    FMetadata_FKOnDeleteAction: TioFKAction;
    FMetadata_FKOnUpdateAction: TioFKAction;
    procedure SetRelationChildNameAndPath(const AQualifiedChildPropertyName: String);
    procedure SetFieldData;
    procedure SetLoadSqlData;
    procedure SetWhereCompareOp(const Value: TioCompareOp);
    procedure SetWhereGroupLogicOp(const Value: TioLogicOp);
    procedure SetWhereGroupName(const Value: String);
    procedure SetWhereLogicOp(const Value: TioLogicOp);
    procedure SetWhereMasterGroupName(const Value: String);
    procedure SetWhereNullValue(const Value: TValue);
    procedure SetWhereSkip(const Value: Boolean);
    procedure SetWhereTargetPropName(const Value: String);
    function GetWhereGroupName: String;
    function GetWhereCompareOp: TioCompareOp;
    function GetWhereGroupLogicOp: TioLogicOp;
    function GetWhereLogicOp: TioLogicOp;
    function GetWhereMasterGroupName: String;
    function GetWhereNullValue: TValue;
    function GetWhereSkip: Boolean;
    function GetWhereTargetPropName: String;
    function GetPropertyRole: TioPropertyRole;
  strict protected
    FPropertyRole: TioPropertyRole;
    constructor Create(const ATable: IioTable; const ATypeAlias, AFieldDefinitionString, ALoadSql, AFieldType: String; const ATransient, AIsID: Boolean;
      const AReadWrite: TioLoadPersist; const ARelationType: TioRelationType; const ARelationChildTypeName, ARelationChildTypeAlias,
      ARelationChildPropertyName: String; const ARelationLazyLoad: Boolean; const ANotHasMany: Boolean; const AMetadata_FieldType: TioMetadataFieldType;
      const AMetadata_FieldLength: Integer; const AMetadata_FieldPrecision: Integer; const AMetadata_FieldScale: Integer; const AMetadata_FieldNotNull: Boolean;
      const AMetadata_Default: TValue; const AMetadata_FieldUnicode: Boolean; const AMetadata_CustomFieldType: string; const AMetadata_FieldSubType: string;
      const AMetadata_FKCreate: TioFKCreate; const AMetadata_FKOnDeleteAction, AMetadata_FKOnUpdateAction: TioFKAction); overload;
    procedure AssignPropertyRole(const AIsID: Boolean);
  public
    constructor Create(const ARttiProperty: TRttiProperty; const ATable: IioTable; const ATypeAlias, AFieldDefinitionString, ALoadSql, AFieldType: String;
      const ATransient, AIsID: Boolean; const AReadWrite: TioLoadPersist; const ARelationType: TioRelationType;
      const ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName: String; const ARelationLazyLoad: Boolean; const ANotHasMany: Boolean;
      const AMetadata_FieldType: TioMetadataFieldType; const AMetadata_FieldLength: Integer; const AMetadata_FieldPrecision: Integer;
      const AMetadata_FieldScale: Integer; const AMetadata_FieldNotNull: Boolean; const AMetadata_Default: TValue; const AMetadata_FieldUnicode: Boolean;
      const AMetadata_CustomFieldType: string; const AMetadata_FieldSubType: string; const AMetadata_FKCreate: TioFKCreate;
      const AMetadata_FKOnDeleteAction, AMetadata_FKOnUpdateAction: TioFKAction); overload;
    procedure ClearRelationData;
    function GetLoadSql: String;
    function LoadSqlExist: Boolean;
    function GetName: String; virtual;
    function GetSqlQualifiedFieldName: String; virtual;
    function GetSqlFullQualifiedFieldName: String; virtual;
    function GetSqlFieldTableName: String;
    function GetSqlFieldName(const AClearDelimiters: Boolean = False): String; virtual;
    function GetSqlFieldAlias: String; virtual;
    function GetSqlParamName: String; virtual;
    function GetSqlWhereParamName: String; virtual;
    function GetFieldType: String;
    function GetValue(const Instance: Pointer): TValue; virtual;
    function GetValueAsObject(const Instance: Pointer): TObject; virtual;
    procedure SetValue(const Instance: Pointer; const AValue: TValue); virtual;
    function GetSqlValue(const ADataObject: TObject): String;
    function GetRttiType: TRttiType; virtual;
    function GetInternalRttiPropField: System.Rtti.TRttiNamedObject; virtual;
    function GetTypeInfo: PTypeInfo; virtual;
    function GetTypeName: String;
    function GetTypeAlias: String;
    function GetRelationType: TioRelationType;
    function GetRelationChildTypeName: String;
    function GetRelationChildTypeAlias: String;
    function GetRelationChildPropertyName: String;
    function RelationChildPropertyPathAssigned: Boolean;
    function GetRelationChildPropertyPath: TStrings;
    function GetRelationLazyLoad: Boolean;
    function GetRelationChildObject(const Instance: Pointer; const AResolvePropertyPath: Boolean = True): TObject;
    function GetRelationChildObjectID(const Instance: Pointer): Integer;
    procedure SetTable(const ATable: IioTable);

    function IsSqlSelectRequestCompliant: Boolean;
    function IsSqlInsertRequestCompliant(const AIDIsNull: Boolean): Boolean;
    function IsSqlUpdateRequestCompliant: Boolean;
    function IsInterface: Boolean;
    function IsDBWriteEnabled: Boolean;
    function IsDBReadEnabled: Boolean;
    function IsInstance: Boolean;
    function IsWritable: Boolean; virtual;
    function IsTransient: Boolean;
    function IsBlob: Boolean;
    function IsStream: Boolean;
    function HasAutodetectedHasManyRelation: Boolean;
    function isHasManyChildVirtualProperty: Boolean; virtual;
    function IsEnumeration: Boolean; virtual;
    function IsObjCreateds: Boolean;
    function IsObjUpdateds: Boolean;

    procedure SetMetadata_FieldType(const AMetadata_FieldType: TioMetadataFieldType);
    procedure SetMetadata_FieldLength(const AMetadata_FieldLength: Integer);
    procedure SetMetadata_FieldPrecision(const AMetadata_FieldPrecision: Integer);
    procedure SetMetadata_FieldScale(const AMetadata_FieldScale: Integer);
    procedure SetMetadata_FieldNotNull(const AMetadata_FieldNotNull: Boolean);
    procedure SetMetadata_FieldUnicode(const AMetadata_FieldUnicode: Boolean);
    procedure SetMetadata_CustomFieldType(const AMetadata_CustomFieldType: string);
    procedure SetMetadata_FKCreate(const AMetadata_FKCreate: TioFKCreate);
    procedure SetMetadata_FieldSubType(const AMetadata_FieldSubType: string);
    procedure SetMetadata_Default(const AMetadata_Default: TValue);
    procedure SetMetadata_FKOnDeleteAction(const AOnDeleteAction: TioFKAction);
    procedure SetMetadata_FKOnUpdateAction(const AOnUpdateAction: TioFKAction);
    function GetMetadata_FieldType: TioMetadataFieldType;
    function GetMetadata_FieldLength: Integer;
    function GetMetadata_FieldPrecision: Integer;
    function GetMetadata_FieldScale: Integer;
    function GetMetadata_FieldNotNull: Boolean;
    function GetMetadata_FieldUnicode: Boolean;
    function GetMetadata_CustomFieldType: string;
    function GetMetadata_FieldSubType: string;
    function GetMetadata_Default: TValue;
    function GetMetadata_FKCreate: TioFKCreate;
    function GetMetadata_FKOnDeleteAction: TioFKAction;
    function GetMetadata_FKOnUpdateAction: TioFKAction;

    property PropertyRole: TioPropertyRole read GetPropertyRole;
    property WhereCompareOp: TioCompareOp read GetWhereCompareOp write SetWhereCompareOp;
    property WhereGroupName: String read GetWhereGroupName write SetWhereGroupName;
    property WhereGroupLogicOp: TioLogicOp read GetWhereGroupLogicOp write SetWhereGroupLogicOp;
    property WhereLogicOp: TioLogicOp read GetWhereLogicOp write SetWhereLogicOp;
    property WhereMasterGroupName: String read GetWhereMasterGroupName write SetWhereMasterGroupName;
    property WhereNullValue: TValue read GetWhereNullValue write SetWhereNullValue;
    property WhereTargetPropName: String read GetWhereTargetPropName write SetWhereTargetPropName;
    property WhereSkip: Boolean read GetWhereSkip write SetWhereSkip;
  end;

  // Autodetected HasMany relation child virtual property (foreign key)
  TioHasManyChildVirtualProperty = class(TioProperty)
  strict private
    FRttiType: TRttiType;
  public
    constructor Create(const ATable: IioTable);
    function GetName: String; override;
    function GetSqlFieldName(const AClearDelimiters: Boolean = False): String; override;
    function GetSqlFieldAlias: String; override;
    function GetSqlParamName: String; override;
    function GetSqlWhereParamName: String; override;
    function GetSqlQualifiedFieldName: String; override;
    function GetSqlFullQualifiedFieldName: String; override;
    function GetValue(const Instance: Pointer): TValue; override;
    procedure SetValue(const Instance: Pointer; const AValue: TValue); override;
    function GetRttiType: TRttiType; override;
    function GetTypeInfo: PTypeInfo; override;
    function IsWritable: Boolean; override;
    function isHasManyChildVirtualProperty: Boolean; override;
    function IsEnumeration: Boolean; override;
  end;

  // Classe che rappresenta un field della classe
  TioField = class(TioProperty)
  strict private
    FRttiProperty: TRttiField;
    FName: String;
  public
    constructor Create(const ARttiField: TRttiField; const ATable: IioTable; const ATypeAlias, AFieldDefinitionString, ALoadSql, AFieldType: String;
      const ATransient, AIsID: Boolean; const AReadWrite: TioLoadPersist; const ARelationType: TioRelationType;
      const ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName: String; const ARelationLazyLoad: Boolean; const ANotHasMany: Boolean;
      const AMetadata_FieldType: TioMetadataFieldType; const AMetadata_FieldLength: Integer; const AMetadata_FieldPrecision: Integer;
      const AMetadata_FieldScale: Integer; const AMetadata_FieldNotNull: Boolean; const AMetadata_Default: TValue; const AMetadata_FieldUnicode: Boolean;
      const AMetadata_CustomFieldType: string; const AMetadata_FieldSubType: string; const AMetadata_FKCreate: TioFKCreate;
      const AMetadata_FKOnDeleteAction, AMetadata_FKOnUpdateAction: TioFKAction); overload;
    class function Remove_F_FromName(const AFieldName: String): String;
    function GetName: String; override;
    function GetValue(const Instance: Pointer): TValue; override;
    procedure SetValue(const Instance: Pointer; const AValue: TValue); override;
    function GetRttiType: TRttiType; override;
    function GetInternalRttiPropField: System.Rtti.TRttiNamedObject; override;
    function GetTypeInfo: PTypeInfo; override;
    function IsWritable: Boolean; override;
    function IsEnumeration: Boolean; override;
  end;

  // Classe con l'elenco delle proprietà della classe
  TioPropertiesGetSqlFunction = reference to function(AProperty: IioProperty): String;

  TioProperties = class(TioSqlItem, IioProperties)
  strict private
    FPropertyItems: TList<IioProperty>;
    FIdProperty: IioProperty;
    FObjStatusProperty: IioProperty;
    FObjVersionProperty: IioProperty;
    FObjCreatedProperty: IioProperty;
    FObjCreatedUserIDProperty: IioProperty;
    FObjCreatedUserNameProperty: IioProperty;
    FObjUpdatedProperty: IioProperty;
    FObjUpdatedUserIDProperty: IioProperty;
    FObjUpdatedUserNameProperty: IioProperty;
    FBlobFieldExists: Boolean;
  private
    // ObjStatus property
    function GetObjStatusProperty: IioProperty;
    procedure SetObjStatusProperty(const AValue: IioProperty);
    function ObjStatusPropertyExist: Boolean;
    // ObjVersion property
    function GetObjVersionProperty: IioProperty;
    procedure SetObjVersionProperty(const AValue: IioProperty);
    function ObjVersionPropertyExist: Boolean;
    // ObjCreated property
    function GetObjCreatedProperty: IioProperty;
    procedure SetObjCreatedProperty(const AValue: IioProperty);
    function ObjCreatedPropertyExist: Boolean;
    // ObjCreatedUserID property
    function GetObjCreatedUserIDProperty: IioProperty;
    procedure SetObjCreatedUserIDProperty(const AValue: IioProperty);
    function ObjCreatedUserIDPropertyExist: Boolean;
    // ObjCreatedUserName property
    function GetObjCreatedUserNameProperty: IioProperty;
    procedure SetObjCreatedUserNameProperty(const AValue: IioProperty);
    function ObjCreatedUserNamePropertyExist: Boolean;
    // ObjLastUpdate property
    function GetObjUpdatedProperty: IioProperty;
    procedure SetObjUpdatedProperty(const AValue: IioProperty);
    function ObjUpdatedPropertyExist: Boolean;
    // ObjLastUpdateUserID property
    function GetObjUpdatedUserIDProperty: IioProperty;
    procedure SetObjUpdatedUserIDProperty(const AValue: IioProperty);
    function ObjUpdatedUserIDPropertyExist: Boolean;
    // ObjLastUpdateUserName property
    function GetObjUpdatedUserNameProperty: IioProperty;
    procedure SetObjUpdatedUserNameProperty(const AValue: IioProperty);
    function ObjUpdatedUserNamePropertyExist: Boolean;
  public
    constructor Create; reintroduce;
    destructor Destroy; override;
    /// This method add to the TrueClassVirtualMap it's properties (if not already exists)
    procedure CopyPropertiesToTrueClassVirtualMap(const ATrueClassVirtualMapProperties: IioProperties);
    function GetEnumerator: TEnumerator<IioProperty>;
    function GetSql: String; reintroduce; overload;
    procedure Add(const AProperty: IioProperty);
    function PropertyExists(const APropertyName: String): Boolean;
    function GetIdProperty: IioProperty;
    function GetPropertyByName(const APropertyName: String; const ARaiseIfNotFound: Boolean = True): IioProperty;
    procedure SetTable(const ATable: IioTable);
    // Blob field present
    function BlobFieldExists: Boolean;
    // ObjStatus property
    property ObjStatusProperty: IioProperty read GetObjStatusProperty write SetObjStatusProperty;
    // ObjVersion property
    property ObjVersionProperty: IioProperty read GetObjVersionProperty write SetObjVersionProperty;
    // ObjCreated property
    property ObjCreatedProperty: IioProperty read GetObjCreatedProperty write SetObjCreatedProperty;
    property ObjCreatedUserIDProperty: IioProperty read GetObjCreatedUserIDProperty write SetObjCreatedUserIDProperty;
    property ObjCreatedUserNameProperty: IioProperty read GetObjCreatedUserNameProperty write SetObjCreatedUserNameProperty;
    // ObjLastUpdate property
    property ObjUpdatedProperty: IioProperty read GetObjUpdatedProperty write SetObjUpdatedProperty;
    property ObjUpdatedUserIDProperty: IioProperty read GetObjUpdatedUserIDProperty write SetObjUpdatedUserIDProperty;
    property ObjUpdatedUserNameProperty: IioProperty read GetObjUpdatedUserNameProperty write SetObjUpdatedUserNameProperty;
  end;

implementation

uses
  iORM.DB.Factory, iORM.Exceptions, System.SysUtils, iORM.SqlTranslator,
  System.StrUtils, iORM.Utilities,
  iORM.DB.ConnectionContainer, iORM.DB.Interfaces, iORM.Context.Container,
  iORM.RttiContext.Factory, iORM.Context.Map.Interfaces;

{ TioProperty }

procedure TioProperty.ClearRelationData;
begin
  FRelationType := rtNone;
  FRelationChildTypeName := '';
  FRelationChildTypeAlias := '';
  FRelationChildPropertyName := '';
  FRelationLazyLoad := False;
end;

constructor TioProperty.Create(const ARttiProperty: TRttiProperty; const ATable: IioTable;
  const ATypeAlias, AFieldDefinitionString, ALoadSql, AFieldType: String; const ATransient, AIsID: Boolean; const AReadWrite: TioLoadPersist;
  const ARelationType: TioRelationType; const ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName: String;
  const ARelationLazyLoad: Boolean; const ANotHasMany: Boolean; const AMetadata_FieldType: TioMetadataFieldType; const AMetadata_FieldLength: Integer;
  const AMetadata_FieldPrecision: Integer; const AMetadata_FieldScale: Integer; const AMetadata_FieldNotNull: Boolean; const AMetadata_Default: TValue;
  const AMetadata_FieldUnicode: Boolean; const AMetadata_CustomFieldType: string; const AMetadata_FieldSubType: string; const AMetadata_FKCreate: TioFKCreate;
  const AMetadata_FKOnDeleteAction, AMetadata_FKOnUpdateAction: TioFKAction);
begin
  // NB: No inherited here
  Self.Create(ATable, ATypeAlias, AFieldDefinitionString, ALoadSql, AFieldType, ATransient, AIsID, AReadWrite, ARelationType, ARelationChildTypeName,
    ARelationChildTypeAlias, ARelationChildPropertyName, ARelationLazyLoad, ANotHasMany, AMetadata_FieldType, AMetadata_FieldLength, AMetadata_FieldPrecision,
    AMetadata_FieldScale, AMetadata_FieldNotNull, AMetadata_Default, AMetadata_FieldUnicode, AMetadata_CustomFieldType, AMetadata_FieldSubType,
    AMetadata_FKCreate, AMetadata_FKOnDeleteAction, AMetadata_FKOnUpdateAction);
  // Set the RttiProperty
  FRttiProperty := ARttiProperty;
  // Set the property role
  AssignPropertyRole(AIsID);
end;

constructor TioProperty.Create(const ATable: IioTable; const ATypeAlias, AFieldDefinitionString, ALoadSql, AFieldType: String; const ATransient, AIsID: Boolean;
  const AReadWrite: TioLoadPersist; const ARelationType: TioRelationType; const ARelationChildTypeName, ARelationChildTypeAlias,
  ARelationChildPropertyName: String; const ARelationLazyLoad: Boolean; const ANotHasMany: Boolean; const AMetadata_FieldType: TioMetadataFieldType;
  const AMetadata_FieldLength: Integer; const AMetadata_FieldPrecision: Integer; const AMetadata_FieldScale: Integer; const AMetadata_FieldNotNull: Boolean;
  const AMetadata_Default: TValue; const AMetadata_FieldUnicode: Boolean; const AMetadata_CustomFieldType: string; const AMetadata_FieldSubType: string;
  const AMetadata_FKCreate: TioFKCreate; const AMetadata_FKOnDeleteAction, AMetadata_FKOnUpdateAction: TioFKAction);
begin
  inherited Create;
  FTable := ATable;
  FTypeAlias := ATypeAlias;
  FFieldDefinitionString := AFieldDefinitionString;
  FFieldType := AFieldType;
  FTransient := ATransient;
  FReadWrite := AReadWrite;
  FLoadSql := ALoadSql;
  // Relation fields
  FRelationType := ARelationType;
  FRelationChildTypeName := ARelationChildTypeName;
  FRelationChildTypeAlias := ARelationChildTypeAlias;
  FRelationLazyLoad := ARelationLazyLoad;
  FNotHasMany := ANotHasMany;
  // M.M. 01/08/18 - MetadataType used by DBBuilder
  FMetadata_FieldType := AMetadata_FieldType;
  FMetadata_FieldLength := AMetadata_FieldLength;
  FMetadata_FieldPrecision := AMetadata_FieldPrecision;
  FMetadata_FieldScale := AMetadata_FieldScale;
  FMetadata_FieldNotNull := AMetadata_FieldNotNull;
  FMetadata_FieldUnicode := AMetadata_FieldUnicode;
  FMetadata_CustomFieldType := AMetadata_CustomFieldType;
  FMetadata_FieldSubType := AMetadata_FieldSubType;
  FMetadata_Default := AMetadata_Default;
  FMetadata_FKCreate := AMetadata_FKCreate;
  FMetadata_FKOnDeleteAction := AMetadata_FKOnDeleteAction;
  FMetadata_FKOnUpdateAction := AMetadata_FKOnUpdateAction;
  // Set the RelationChildPropertyName & RelationChildPropertyPath
  SetRelationChildNameAndPath(ARelationChildPropertyName);
  // --------------------------------
  // Quando si fa un Join in una classe (attributo ioJoin) poi nelle proprietà che ricevono il valore dai campi della
  // joined class/table si deve usare anche l'attributo "ioField" per indicare ad iORM in che modo reperirne poi il
  // valore anche in caso di ambiguità dovuta campi con lo stesso nome nelle tabelle coinvolte.
  // Esempio:
  // Classe: [ioJoin(jtInner, TCostGeneric, '[TCostGeneric.CostType] = [TCostType.ID]')]
  // Proprietà: >>>>>>>> [ioField('[TCostGeneric].TravelID')]  <<<<<<<<<
  // --------------------------------
  SetFieldData;
  // Translate the LoadSQLData statement if needed
  SetLoadSqlData;
end;

function TioProperty.GetFieldType: String;
begin
  // ================================================================================
  // NB: Questa funzione è usata solo da questa classe stessa (Self.IsBlob) e dalla
  // creazione automatica del DB per determinare il tipo di campo. Siccome
  // l'unicoDB per il quale è disponibile la creazione automatica del DB è SQLite
  // non è necessario che questa funzione si adatti ai diversi RDBMS e quindi la lascio
  // fissa così. Questo va bene anche all'interno della funzione Self.IsBlob
  // perchè questa verifica solo se il tipo comincia per BLOB e uesto va bene per
  // qualunque DB.
  // ================================================================================
  // If the FField is not empty then return it
  if not FFieldType.IsEmpty then
    Exit(FFieldType);
  // According to the RelationType of the property...
  case Self.GetRelationType of
    // Normal property, no relation, field type is by TypeKind of the property itself
    rtNone:
      begin
        case Self.GetRttiType.TypeKind of
          tkInt64, tkInteger, tkEnumeration:
            Result := 'INTEGER';
          tkFloat:
            Result := 'REAL';
          tkString, tkUString, tkWChar, tkLString, tkWString, tkChar:
            Result := 'TEXT';
          tkClass, tkInterface:
            Result := 'BLOB';
        end;
      end;
    // If it is an ioRTEmbedded property then the field type is always BLOB
    rtEmbeddedHasMany, rtEmbeddedHasOne:
      Result := 'BLOB';
    // If it's a BelongsTo relation property then field type is always INTEGER
    // because the ID fields always are INTEGERS values
    rtBelongsTo:
      Result := 'INTEGER';
    // Otherwise return NULL field type
  else
    Result := 'NULL';
  end;
end;

function TioProperty.GetInternalRttiPropField: System.Rtti.TRttiNamedObject;
begin
  Result := FRttiProperty;
end;

function TioProperty.GetLoadSql: String;
begin
  Result := '(' + Self.FLoadSql + ') AS ' + Self.GetSqlFieldAlias;
end;

function TioProperty.GetMetadata_CustomFieldType: string;
begin
  Result := FMetadata_CustomFieldType;
end;

function TioProperty.GetMetadata_Default: TValue;
begin
  Result := FMetadata_Default;
end;

function TioProperty.GetMetadata_FKCreate: TioFKCreate;
begin
  Result := FMetadata_FKCreate;
end;

function TioProperty.GetMetadata_FieldSubType: string;
begin
  Result := FMetadata_FieldSubType;
end;

function TioProperty.GetMetadata_FieldLength: Integer;
begin
  Result := FMetadata_FieldLength;
end;

function TioProperty.GetMetadata_FieldNotNull: Boolean;
begin
  Result := FMetadata_FieldNotNull or (FPropertyRole = prObjID);
end;

function TioProperty.GetMetadata_FieldPrecision: Integer;
begin
  Result := FMetadata_FieldPrecision;
end;

function TioProperty.GetMetadata_FieldScale: Integer;
begin
  Result := FMetadata_FieldScale;
end;

function TioProperty.GetMetadata_FieldType: TioMetadataFieldType;
begin
  Result := FMetadata_FieldType;
end;

function TioProperty.GetMetadata_FieldUnicode: Boolean;
begin
  Result := FMetadata_FieldUnicode;
end;

function TioProperty.GetMetadata_FKOnDeleteAction: TioFKAction;
begin
  Result := FMetadata_FKOnDeleteAction;
end;

function TioProperty.GetMetadata_FKOnUpdateAction: TioFKAction;
begin
  Result := FMetadata_FKOnUpdateAction;
end;

function TioProperty.GetSqlFullQualifiedFieldName: String;
begin
  Result := GetSqlQualifiedFieldName + ' AS ' + FSqlFieldAlias;
end;

function TioProperty.GetName: String;
begin
  Result := FRttiProperty.Name;
end;

function TioProperty.GetPropertyRole: TioPropertyRole;
begin
  Result := FPropertyRole;
end;

function TioProperty.GetRelationChildTypeAlias: String;
begin
  Result := FRelationChildTypeAlias;
end;

function TioProperty.GetRelationChildTypeName: String;
begin
  Result := FRelationChildTypeName;
end;

function TioProperty.GetRelationChildObject(const Instance: Pointer; const AResolvePropertyPath: Boolean): TObject;
var
  AValue: TValue;
begin
  // Extract the child related object
  AValue := Self.GetValue(Instance);
  Result := TioUtilities.TValueToObject(AValue, True);
  // If a RelationChildPropertyPath is assigned then resolve it
  if Self.RelationChildPropertyPathAssigned and AResolvePropertyPath then
    Result := TioUtilities.ResolveChildPropertyPath(Result, FRelationChildPropertyPath);
end;

function TioProperty.GetRelationChildObjectID(const Instance: Pointer): Integer;
var
  FChildMap: IioMap;
  FChildObject: TObject;
begin
  // Init
  Result := IO_INTEGER_NULL_VALUE;
  // Extract the child related object
  FChildObject := Self.GetRelationChildObject(Instance);
  // If the related child object not exists then exit (return 'NULL')
  if not Assigned(FChildObject) then
    Exit;
  // Else create the ioContext for the object and return the ID
  FChildMap := TioMapContainer.GetMap(FChildObject.ClassName);
  Result := FChildMap.GetProperties.GetIdProperty.GetValue(FChildObject).AsInteger;
end;

function TioProperty.GetRelationChildPropertyName: String;
begin
  Result := FRelationChildPropertyName;
end;

function TioProperty.GetRelationChildPropertyPath: TStrings;
begin
  Result := FRelationChildPropertyPath;
end;

function TioProperty.GetRelationLazyLoad: Boolean;
begin
  Result := FRelationLazyLoad;
end;

function TioProperty.GetRelationType: TioRelationType;
begin
  Result := FRelationType;
end;

function TioProperty.GetRttiType: TRttiType;
begin
  Result := FRttiProperty.PropertyType;
end;

function TioProperty.GetTypeAlias: String;
begin
  Result := FTypeAlias;
end;

function TioProperty.GetTypeInfo: PTypeInfo;
begin
  Result := FRttiProperty.PropertyType.Handle;
end;

function TioProperty.GetTypeName: String;
begin
  Result := Self.GetRttiType.Name;
end;

function TioProperty.GetSqlFieldAlias: String;
begin
  Result := FSqlFieldAlias;
end;

function TioProperty.GetSqlFieldName(const AClearDelimiters: Boolean): String;
begin
  // Result := FSqlFieldName;
  if AClearDelimiters then
    Result := FSqlFieldName
  else
    Result := TioDbFactory.SqlDataConverter(FTable.GetConnectionDefName).FieldNameToSqlFieldName(FSqlFieldName);
end;

function TioProperty.GetSqlFieldTableName: String;
begin
  Result := FSqlFieldTableName;
end;

function TioProperty.GetSqlQualifiedFieldName: String;
begin
  // Result := FQualifiedSqlFieldName;
  Result := TioDbFactory.SqlDataConverter(FTable.GetConnectionDefName).FieldNameToSqlFieldName(FSqlFieldTableName) + '.' +
    TioDbFactory.SqlDataConverter(FTable.GetConnectionDefName).FieldNameToSqlFieldName(FSqlFieldName);
end;

function TioProperty.GetSqlParamName: String;
begin
  Result := 'P_' + Self.GetSqlFieldAlias;
end;

function TioProperty.GetSqlValue(const ADataObject: TObject): String;
begin
  Result := TioDbFactory.SqlDataConverter(FTable.GetConnectionDefName).TValueToSql(Self.GetValue(ADataObject));
end;

function TioProperty.GetSqlWhereParamName: String;
begin
  Result := 'W_' + Self.GetSqlFieldAlias;
end;

function TioProperty.GetValue(const Instance: Pointer): TValue;
begin
  Result := FRttiProperty.GetValue(Instance);
end;

function TioProperty.GetValueAsObject(const Instance: Pointer): TObject;
var
  AValue: TValue;
begin
  AValue := Self.GetValue(Instance);
  Result := TioUtilities.TValueToObject(AValue, False)
end;

function TioProperty.GetWhereCompareOp: TioCompareOp;
begin
  Result := FWhereCompareOp;
end;

function TioProperty.GetWhereGroupLogicOp: TioLogicOp;
begin
  Result := FWhereGroupLogicOp;
end;

function TioProperty.GetWhereGroupName: String;
begin
  Result := FWhereGroupName;
end;

function TioProperty.GetWhereLogicOp: TioLogicOp;
begin
  Result := FWhereLogicOp;
end;

function TioProperty.GetWhereMasterGroupName: String;
begin
  Result := FWhereMasterGroupName;
end;

function TioProperty.GetWhereNullValue: TValue;
begin
  Result := FWhereNullValue;
end;

function TioProperty.GetWhereSkip: Boolean;
begin
  Result := FWhereSkip;
end;

function TioProperty.GetWhereTargetPropName: String;
begin
  Result := FWhereTargetPropName;
end;

function TioProperty.HasAutodetectedHasManyRelation: Boolean;
begin
  Result := (FRelationType = rtHasMany) and (FRelationChildPropertyName = IO_HASMANY_CHILD_VIRTUAL_PROPERTY_NAME);
end;

function TioProperty.IsBlob: Boolean;
begin
  Result := ((FRelationType = rtNone) or (FRelationType = rtEmbeddedHasMany) or (FRelationType = rtEmbeddedHasOne)) and Self.GetFieldType.StartsWith('BLOB');
end;

function TioProperty.IsInstance: Boolean;
begin
  Result := Self.GetRttiType.IsInstance;
end;

function TioProperty.IsInterface: Boolean;
begin
  Result := (Self.GetRttiType.TypeKind = tkInterface);
end;

function TioProperty.IsObjCreateds: Boolean;
begin
  Result := (FPropertyRole >= prObjCreated) and (FPropertyRole <= prObjCreatedUserName);
end;

function TioProperty.IsObjUpdateds: Boolean;
begin
  Result := (FPropertyRole >= prObjUpdated) and (FPropertyRole <= prObjUpdatedUserName);
end;

function TioProperty.IsDBReadEnabled: Boolean;
begin
  Result := (FReadWrite <= lpLoadAndPersist) and not FTransient;
end;

function TioProperty.IsTransient: Boolean;
begin
  Result := FTransient;
end;

function TioProperty.IsSqlSelectRequestCompliant: Boolean;
begin
  Result := (FReadWrite <= lpLoadAndPersist) and (not FTransient) and (not isHasManyChildVirtualProperty) and not(FRelationType in [rtHasMany, rtHasOne]);
end;

function TioProperty.IsSqlUpdateRequestCompliant: Boolean;
begin
  { TODO : Una qualche sorta di parametro per poter decidere se nelle query update ci deve essere anche l'ID oppure no? }
  Result := (FReadWrite >= lpLoadAndPersist) and (not FTransient) and (FPropertyRole <> prObjID) and (not IsObjCreateds) and not(FRelationType in [rtHasMany, rtHasOne]);
end;

function TioProperty.IsSqlInsertRequestCompliant(const AIDIsNull: Boolean): Boolean;
begin
  Result := (FReadWrite >= lpLoadAndPersist) and (not FTransient) and (not(FRelationType in [rtHasMany, rtHasOne])) and ((FPropertyRole <> prObjID) or (not AIDIsNull));
end;

function TioProperty.IsStream: Boolean;
begin
  Result := (Self.GetRttiType.IsInstance) and (Self.GetRttiType.AsInstance.MetaclassType.InheritsFrom(TStream));
end;

function TioProperty.IsWritable: Boolean;
begin
  Result := FRttiProperty.IsWritable;
end;

function TioProperty.IsDBWriteEnabled: Boolean;
begin
  Result := (FReadWrite >= lpLoadAndPersist) and not FTransient;
end;

function TioProperty.IsEnumeration: Boolean;
begin
  Result := FRttiProperty.PropertyType is TRttiEnumerationType;
end;

function TioProperty.isHasManyChildVirtualProperty: Boolean;
begin
  Result := False;
end;

function TioProperty.LoadSqlExist: Boolean;
begin
  Result := Self.FLoadSql <> '';
end;

function TioProperty.RelationChildPropertyPathAssigned: Boolean;
begin
  Result := Assigned(FRelationChildPropertyPath);
end;

procedure TioProperty.AssignPropertyRole(const AIsID: Boolean);
begin
  if (not AIsID) and (not GetRttiType.Name.StartsWith('TioObj')) then
    FPropertyRole := prRegular
  else
  if AIsID then
    FPropertyRole := prObjID
  else
  if GetRttiType.Name = TioUtilities.TypeInfoToTypeName(TypeInfo(TioObjStatus)) then
    FPropertyRole := prObjStatus
  else
  if GetRttiType.Name = TioUtilities.TypeInfoToTypeName(TypeInfo(TioObjVersion)) then
    FPropertyRole := prObjVersion
  else
  if GetRttiType.Name = TioUtilities.TypeInfoToTypeName(TypeInfo(TioObjUpdated)) then
    FPropertyRole := prObjUpdated
  else
  if GetRttiType.Name = TioUtilities.TypeInfoToTypeName(TypeInfo(TioObjUpdatedUserID)) then
    FPropertyRole := prObjUpdatedUserID
  else
  if GetRttiType.Name = TioUtilities.TypeInfoToTypeName(TypeInfo(TioObjUpdatedUserName)) then
    FPropertyRole := prObjUpdatedUserName
  else
  if GetRttiType.Name = TioUtilities.TypeInfoToTypeName(TypeInfo(TioObjCreated)) then
    FPropertyRole := prObjCreated
  else
  if GetRttiType.Name = TioUtilities.TypeInfoToTypeName(TypeInfo(TioObjCreatedUserID)) then
    FPropertyRole := prObjCreatedUserID
  else
  if GetRttiType.Name = TioUtilities.TypeInfoToTypeName(TypeInfo(TioObjCreatedUserName)) then
    FPropertyRole := prObjCreatedUserName;
end;

procedure TioProperty.SetFieldData;
var
  LDotPos, LAsPos: Smallint;
  LValue: String;
begin
  // --------------------------------
  // Quando si fa un Join in una classe (attributo ioJoin) poi nelle proprietà che ricevono il valore dai campi della
  // joined class/table si deve usare anche l'attributo "ioField" per indicare ad iORM in che modo reperirne poi il
  // valore anche in caso di ambiguità dovuta campi con lo stesso nome nelle tabelle coinvolte.
  // Esempio:
  // Classe: [ioJoin(jtInner, TCostGeneric, '[TCostGeneric.CostType] = [TCostType.ID]')]
  // Proprietà: >>>>>>>> [ioField('[TCostGeneric].TravelID')]  <<<<<<<<<
  // --------------------------------
  LValue := FFieldDefinitionString;
  // Translate (if contains tags)
  LValue := TioSqlTranslator.Translate(LValue, FTable.GetClassName);
  // Retrieve the markers position
  LDotPos := Pos('.', LValue);
  LAsPos := Pos(' AS ', LValue, LDotPos);
  if LAsPos = 0 then
    LAsPos := LValue.Length + 1;
  // Retrieve Table reference
  FSqlFieldTableName := LeftStr(LValue, LDotPos - 1);
  if FSqlFieldTableName = '' then
    FSqlFieldTableName := FTable.TableName;
  // Retrieve FieldName
  FSqlFieldName := MidStr(LValue, LDotPos + 1, LAsPos - LDotPos - 1);
  // Retrieve Field Alias
  FSqlFieldAlias := MidStr(LValue, LAsPos + 4, LValue.Length);
  if FSqlFieldAlias = '' then
    FSqlFieldAlias := FSqlFieldTableName + '_' + FSqlFieldName;
end;

procedure TioProperty.SetLoadSqlData;
begin
  // Set LoadSql statement (if exist)
  if Self.FLoadSql <> '' then
    FLoadSql := TioSqlTranslator.Translate(FLoadSql, FTable.GetClassName);
end;

procedure TioProperty.SetMetadata_CustomFieldType(const AMetadata_CustomFieldType: string);
begin
  FMetadata_CustomFieldType := AMetadata_CustomFieldType;
end;

procedure TioProperty.SetMetadata_Default(const AMetadata_Default: TValue);
begin
  FMetadata_Default := AMetadata_Default;
end;

procedure TioProperty.SetMetadata_FKCreate(const AMetadata_FKCreate: TioFKCreate);
begin
  FMetadata_FKCreate := AMetadata_FKCreate;
end;

procedure TioProperty.SetMetadata_FieldSubType(const AMetadata_FieldSubType: string);
begin
  FMetadata_FieldSubType := AMetadata_FieldSubType;
end;

procedure TioProperty.SetMetadata_FieldLength(const AMetadata_FieldLength: Integer);
begin
  FMetadata_FieldLength := AMetadata_FieldLength;
end;

procedure TioProperty.SetMetadata_FieldNotNull(const AMetadata_FieldNotNull: Boolean);
begin
  FMetadata_FieldNotNull := AMetadata_FieldNotNull;
end;

procedure TioProperty.SetMetadata_FieldPrecision(const AMetadata_FieldPrecision: Integer);
begin
  FMetadata_FieldPrecision := AMetadata_FieldPrecision;
end;

procedure TioProperty.SetMetadata_FieldScale(const AMetadata_FieldScale: Integer);
begin
  FMetadata_FieldScale := AMetadata_FieldScale;
end;

procedure TioProperty.SetMetadata_FieldType(const AMetadata_FieldType: TioMetadataFieldType);
begin
  FMetadata_FieldType := AMetadata_FieldType;
end;

procedure TioProperty.SetMetadata_FieldUnicode(const AMetadata_FieldUnicode: Boolean);
begin
  FMetadata_FieldUnicode := AMetadata_FieldUnicode;
end;

procedure TioProperty.SetMetadata_FKOnDeleteAction(const AOnDeleteAction: TioFKAction);
begin
  FMetadata_FKOnDeleteAction := AOnDeleteAction;
end;

procedure TioProperty.SetMetadata_FKOnUpdateAction(const AOnUpdateAction: TioFKAction);
begin
  FMetadata_FKOnUpdateAction := AOnUpdateAction;
end;

procedure TioProperty.SetRelationChildNameAndPath(const AQualifiedChildPropertyName: String);
begin
  // If the AQualifiedChildPropertyName is empty then exit
  if AQualifiedChildPropertyName.IsEmpty then
    Exit;
  // Create the StringList, set the Delimiter and DelimitedText
  FRelationChildPropertyPath := TStringList.Create;
  FRelationChildPropertyPath.Delimiter := '.';
  FRelationChildPropertyPath.DelimitedText := AQualifiedChildPropertyName;
  // The last element is the ChildPropertyName
  FRelationChildPropertyName := FRelationChildPropertyPath[FRelationChildPropertyPath.Count - 1];
  // Remove the last element
  FRelationChildPropertyPath.Delete(FRelationChildPropertyPath.Count - 1);
  // If the remaining list is empty then free it (optimization)
  if FRelationChildPropertyPath.Count = 0 then
    FreeAndNil(FRelationChildPropertyPath);
end;

procedure TioProperty.SetTable(const ATable: IioTable);
begin
  FTable := ATable;
end;

procedure TioProperty.SetValue(const Instance: Pointer; const AValue: TValue);
begin
  FRttiProperty.SetValue(Instance, AValue);
  // ***ChildPropertyPath***
end;

procedure TioProperty.SetWhereCompareOp(const Value: TioCompareOp);
begin
  FWhereCompareOp := Value;
end;

procedure TioProperty.SetWhereGroupLogicOp(const Value: TioLogicOp);
begin
  FWhereGroupLogicOp := Value;
end;

procedure TioProperty.SetWhereGroupName(const Value: String);
begin
  FWhereGroupName := Value.ToUpper;
end;

procedure TioProperty.SetWhereLogicOp(const Value: TioLogicOp);
begin
  FWhereLogicOp := Value;
end;

procedure TioProperty.SetWhereMasterGroupName(const Value: String);
begin
  FWhereMasterGroupName := Value.ToUpper;
end;

procedure TioProperty.SetWhereNullValue(const Value: TValue);
begin
  FWhereNullValue := Value;
end;

procedure TioProperty.SetWhereSkip(const Value: Boolean);
begin
  FWhereSkip := Value;
end;

procedure TioProperty.SetWhereTargetPropName(const Value: String);
begin
  FWhereTargetPropName := Value;
end;

{ TioProperties }

procedure TioProperties.Add(const AProperty: IioProperty);
begin
  FPropertyItems.Add(AProperty);
  if AProperty.PropertyRole = prObjID then
    FIdProperty := AProperty;
  if AProperty.IsBlob then
    FBlobFieldExists := True;
end;

function TioProperties.BlobFieldExists: Boolean;
begin
  Result := FBlobFieldExists;
end;

constructor TioProperties.Create;
begin
  FBlobFieldExists := False;
  FObjStatusProperty := nil;
  FObjVersionProperty := nil;
  FObjCreatedProperty := nil;
  FObjUpdatedProperty := nil;
  FPropertyItems := TList<IioProperty>.Create;
end;

destructor TioProperties.Destroy;
begin
  FPropertyItems.Free;
  inherited;
end;

procedure TioProperties.CopyPropertiesToTrueClassVirtualMap(const ATrueClassVirtualMapProperties: IioProperties);
var
  LProperty: IioProperty;
begin
  // Copy owned properties to TrueClassVirtualMap.Properties if not already exists
  for LProperty in FPropertyItems do
    if not ATrueClassVirtualMapProperties.PropertyExists(LProperty.GetName) then
      ATrueClassVirtualMapProperties.Add(LProperty);
  // Copy ObjStatus property to TrueClassVirtualMap.Properties if not already exists
  if ObjStatusPropertyExist and not ATrueClassVirtualMapProperties.ObjStatusPropertyExist then
    ATrueClassVirtualMapProperties.ObjStatusProperty := ObjStatusProperty;
  // Copy ObjVersion property to TrueClassVirtualMap.Properties if not already exists
  if ObjVersionPropertyExist and not ATrueClassVirtualMapProperties.ObjVersionPropertyExist then
    ATrueClassVirtualMapProperties.ObjVersionProperty := ObjVersionProperty;
end;

function TioProperties.PropertyExists(const APropertyName: String): Boolean;
var
  CurrProp: IioProperty;
begin
  for CurrProp in FPropertyItems do
    if CurrProp.GetName.ToUpper.Equals(APropertyName.ToUpper) then
      Exit(True);
  Result := False;
end;

function TioProperties.GetEnumerator: TEnumerator<IioProperty>;
begin
  Result := FPropertyItems.GetEnumerator;
end;

function TioProperties.GetIdProperty: IioProperty;
begin
  Result := FIdProperty;
end;

function TioProperties.GetObjCreatedProperty: IioProperty;
begin
  Result := FObjCreatedProperty;
end;

function TioProperties.GetObjCreatedUserIDProperty: IioProperty;
begin
  Result := FObjCreatedUserIDProperty;
end;

function TioProperties.GetObjCreatedUserNameProperty: IioProperty;
begin
  Result := FObjCreatedUserNameProperty;
end;

function TioProperties.GetObjStatusProperty: IioProperty;
begin
  Result := FObjStatusProperty;
end;

function TioProperties.GetObjUpdatedProperty: IioProperty;
begin
  Result := FObjUpdatedProperty;
end;

function TioProperties.GetObjUpdatedUserIDProperty: IioProperty;
begin
  Result := FObjUpdatedUserIDProperty;
end;

function TioProperties.GetObjUpdatedUserNameProperty: IioProperty;
begin
  Result := FObjUpdatedUserNameProperty;
end;

function TioProperties.GetObjVersionProperty: IioProperty;
begin
  Result := FObjVersionProperty;
end;

function TioProperties.GetPropertyByName(const APropertyName: String; const ARaiseIfNotFound: Boolean = True): IioProperty;
var
  CurrProp: IioProperty;
begin
  Result := nil;
  for CurrProp in FPropertyItems do
    if CurrProp.GetName.ToUpper.Equals(APropertyName.ToUpper) then
      Exit(CurrProp);
  if ARaiseIfNotFound then
    raise EioException.Create(Self.ClassName + ': Context property "' + APropertyName + '" not found.');
end;

function TioProperties.GetSql: String;
begin
  raise EioException.Create(ClassName, 'GetSql', 'Method not to be called on this class');
end;

function TioProperties.ObjCreatedPropertyExist: Boolean;
begin
  Result := Assigned(FObjCreatedProperty);
end;

function TioProperties.ObjCreatedUserIDPropertyExist: Boolean;
begin
  Result := Assigned(FObjCreatedUserIDProperty);
end;

function TioProperties.ObjCreatedUserNamePropertyExist: Boolean;
begin
  Result := Assigned(FObjCreatedUserNameProperty);
end;

function TioProperties.ObjStatusPropertyExist: Boolean;
begin
  Result := Assigned(FObjStatusProperty);
end;

function TioProperties.ObjUpdatedPropertyExist: Boolean;
begin
  Result := Assigned(FObjUpdatedProperty);
end;

function TioProperties.ObjUpdatedUserIDPropertyExist: Boolean;
begin
  Result := Assigned(FObjUpdatedUserIDProperty);
end;

function TioProperties.ObjUpdatedUserNamePropertyExist: Boolean;
begin
  Result := Assigned(FObjUpdatedUserNameProperty);
end;

function TioProperties.ObjVersionPropertyExist: Boolean;
begin
  Result := Assigned(FObjVersionProperty);
end;

procedure TioProperties.SetObjCreatedProperty(const AValue: IioProperty);
begin
  FObjCreatedProperty := AValue;
end;

procedure TioProperties.SetObjCreatedUserIDProperty(const AValue: IioProperty);
begin
  FObjCreatedUserIDProperty := AValue;
end;

procedure TioProperties.SetObjCreatedUserNameProperty(const AValue: IioProperty);
begin
  FObjCreatedUserNameProperty := AValue;
end;

procedure TioProperties.SetObjStatusProperty(const AValue: IioProperty);
begin
  FObjStatusProperty := AValue;
end;

procedure TioProperties.SetObjUpdatedProperty(const AValue: IioProperty);
begin
  FObjUpdatedProperty := AValue;
end;

procedure TioProperties.SetObjUpdatedUserIDProperty(const AValue: IioProperty);
begin
  FObjUpdatedUserIDProperty := AValue;
end;

procedure TioProperties.SetObjUpdatedUserNameProperty(const AValue: IioProperty);
begin
  FObjUpdatedUserNameProperty := AValue;
end;

procedure TioProperties.SetObjVersionProperty(const AValue: IioProperty);
begin
  FObjVersionProperty := AValue;
end;

procedure TioProperties.SetTable(const ATable: IioTable);
var
  AProperty: IioProperty;
begin
  for AProperty in FPropertyItems do
    AProperty.SetTable(ATable);
end;

{ TioField }

constructor TioField.Create(const ARttiField: TRttiField; const ATable: IioTable; const ATypeAlias, AFieldDefinitionString, ALoadSql, AFieldType: String;
  const ATransient, AIsID: Boolean; const AReadWrite: TioLoadPersist; const ARelationType: TioRelationType;
  const ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName: String; const ARelationLazyLoad: Boolean; const ANotHasMany: Boolean;
  const AMetadata_FieldType: TioMetadataFieldType; const AMetadata_FieldLength: Integer; const AMetadata_FieldPrecision: Integer;
  const AMetadata_FieldScale: Integer; const AMetadata_FieldNotNull: Boolean; const AMetadata_Default: TValue; const AMetadata_FieldUnicode: Boolean;
  const AMetadata_CustomFieldType: string; const AMetadata_FieldSubType: string; const AMetadata_FKCreate: TioFKCreate;
  const AMetadata_FKOnDeleteAction, AMetadata_FKOnUpdateAction: TioFKAction);
begin
  // NB: No inherited here
  Self.Create(ATable, ATypeAlias, AFieldDefinitionString, ALoadSql, AFieldType, ATransient, AIsID, AReadWrite, ARelationType, ARelationChildTypeName,
    ARelationChildTypeAlias, ARelationChildPropertyName, ARelationLazyLoad, ANotHasMany, AMetadata_FieldType, AMetadata_FieldLength, AMetadata_FieldPrecision,
    AMetadata_FieldScale, AMetadata_FieldNotNull, AMetadata_Default, AMetadata_FieldUnicode, AMetadata_CustomFieldType, AMetadata_FieldSubType,
    AMetadata_FKCreate, AMetadata_FKOnDeleteAction, AMetadata_FKOnUpdateAction);
  // Set the RttiProperty
  FRttiProperty := ARttiField;
  // Clean the field name from the "T"
  FName := Self.Remove_F_FromName(ARttiField.Name);
  // Set the property role
  AssignPropertyRole(AIsID);
end;

function TioField.GetInternalRttiPropField: System.Rtti.TRttiNamedObject;
begin
  Result := FRttiProperty;
end;

function TioField.GetName: String;
begin
  // No inherited
  Result := FName;
end;

function TioField.GetRttiType: TRttiType;
begin
  // No inherited
  Result := FRttiProperty.FieldType;
end;

function TioField.GetTypeInfo: PTypeInfo;
begin
  // No inherited
  Result := FRttiProperty.FieldType.Handle;
end;

function TioField.GetValue(const Instance: Pointer): TValue;
begin
  // No inherited
  // 2023-01-17 Carlo Marona
  if Instance <> nil then
    Result := FRttiProperty.GetValue(Instance)
  else
    Result := TValue.Empty;
end;

function TioField.IsEnumeration: Boolean;
begin
  Result := FRttiProperty.FieldType is TRttiEnumerationType;
end;

function TioField.IsWritable: Boolean;
begin
  // A private field is always writable
  Result := True;
end;

class function TioField.Remove_F_FromName(const AFieldName: String): String;
begin
  if Uppercase(AFieldName).StartsWith('F') then
    Result := AFieldName.Substring(1); // Elimina il primo carattere (di solito la F)
end;

procedure TioField.SetValue(const Instance: Pointer; const AValue: TValue);
begin
  // No inherited
  FRttiProperty.SetValue(Instance, AValue);
end;

{ TioHasManyChildVirtualProperty }

constructor TioHasManyChildVirtualProperty.Create(const ATable: IioTable);
begin
  inherited Create(ATable, '', '', '', '', False, False, lpLoadAndPersist, rtNone, '', '', '', False, False, ioMdInteger, IO_DEFAULT_FIELD_LENGTH,
    IO_DEFAULT_FIELD_PRECISION, IO_DEFAULT_FIELD_SCALE, True, TValue.Empty, True, '', '', fkCreate, fkUnspecified, fkUnspecified);
  FRttiType := TioRttiFactory.GetRttiTypeByTypeInfo(TypeInfo(Integer));
end;

function TioHasManyChildVirtualProperty.GetName: String;
begin
  // No inherited
  Result := IO_HASMANY_CHILD_VIRTUAL_PROPERTY_NAME;
end;

function TioHasManyChildVirtualProperty.GetRttiType: TRttiType;
begin
  // No inherited
  Result := FRttiType;
end;

function TioHasManyChildVirtualProperty.GetSqlFieldAlias: String;
begin
  // No inherited
  Result := GetSqlFieldTableName + '_' + IO_HASMANY_CHILD_VIRTUAL_PROPERTY_NAME;
end;

function TioHasManyChildVirtualProperty.GetSqlFieldName(const AClearDelimiters: Boolean): String;
begin
  // No inherited
  Result := IO_HASMANY_CHILD_VIRTUAL_PROPERTY_NAME;
end;

function TioHasManyChildVirtualProperty.GetSqlFullQualifiedFieldName: String;
begin
  // No inherited
  Result := GetSqlFieldTableName + '.' + IO_HASMANY_CHILD_VIRTUAL_PROPERTY_NAME + ' AS ' + GetSqlFieldTableName + '_' + IO_HASMANY_CHILD_VIRTUAL_PROPERTY_NAME;
end;

function TioHasManyChildVirtualProperty.GetSqlParamName: String;
begin
  // No inherited
  Result := 'P_' + GetSqlFieldTableName + '_' + IO_HASMANY_CHILD_VIRTUAL_PROPERTY_NAME;
end;

function TioHasManyChildVirtualProperty.GetSqlQualifiedFieldName: String;
begin
  // No inherited
  Result := GetSqlFieldTableName + '.' + IO_HASMANY_CHILD_VIRTUAL_PROPERTY_NAME;
end;

function TioHasManyChildVirtualProperty.GetSqlWhereParamName: String;
begin
  // No inherited
  Result := 'W_' + GetSqlFieldTableName + '_' + IO_HASMANY_CHILD_VIRTUAL_PROPERTY_NAME;
end;

function TioHasManyChildVirtualProperty.GetTypeInfo: PTypeInfo;
begin
  // No inherited
  Result := FRttiType.Handle;
end;

function TioHasManyChildVirtualProperty.GetValue(const Instance: Pointer): TValue;
begin
  // No inherited
  raise EioException.Create(ClassName, 'GetValue', 'Method not implemented on this class');
end;

function TioHasManyChildVirtualProperty.IsEnumeration: Boolean;
begin
  // No inherited
  Result := FRttiType is TRttiEnumerationType;
end;

function TioHasManyChildVirtualProperty.isHasManyChildVirtualProperty: Boolean;
begin
  // No inherited
  Result := True;
end;

function TioHasManyChildVirtualProperty.IsWritable: Boolean;
begin
  // No inherited
  Result := False;
end;

procedure TioHasManyChildVirtualProperty.SetValue(const Instance: Pointer; const AValue: TValue);
begin
  // No inherited
  raise EioException.Create(ClassName, 'GetValue', 'Method not implemented on this class');
end;

end.
