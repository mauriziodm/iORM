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
unit iORM.Context.Properties.Interfaces;

interface

uses
  iORM.Attributes,
  iORM.CommonTypes,
  iORM.Interfaces,
  System.Rtti,
  System.Generics.Collections, iORM.Context.Table.Interfaces, System.Classes,
  System.TypInfo;

type

  // ReadWrite options (for properties and even classes)
  TioLoadPersist = (lpLoadOnly, lpLoadAndPersist, lpPersistOnly);

  // Options set for GetSql functions parameter
  TioSqlRequestType = (ioAll=0, ioSelect, ioUpdate, ioInsert, ioDelete, ioExist);

  // Options set for field metadata used in DBBuilder
  TioMetadataFieldType = (ioMdVarchar, ioMdChar, ioMdInteger, ioMdFloat, ioMdDate, ioMdTime, ioMdDateTime, ioMdDecimal, ioMdNumeric,
    ioMdBoolean, ioMdBinary, ioMdCustomFieldType);

  IioProperty = interface
    ['{A79DD7E8-D2B2-4F78-A07A-7757605AC94C}']
    procedure ClearRelationData;
    function GetLoadSql: String;
    function LoadSqlExist: Boolean;
    function GetName: string;
    function GetSqlQualifiedFieldName: String;
    function GetSqlFullQualifiedFieldName: String;
    function GetSqlFieldName(const AClearDelimiters: Boolean=False): String;
    function GetSqlFieldAlias: String;
    function GetSqlParamName: String;
    function GetSqlWhereParamName: String;
    function GetFieldType: String;
    function IsBlob: Boolean;
    function IsStream: Boolean;
    function GetValue(const Instance: Pointer): TValue;
    function GetValueAsObject(const Instance: Pointer): TObject;
    procedure SetValue(const Instance: Pointer; const AValue: TValue);
    function GetSqlValue(const ADataObject: TObject): String;
    function GetRttiType: TRttiType;
    function GetTypeInfo: PTypeInfo;
    function GetTypeName: String;
    function GetTypeAlias: String;
    function IsInterface: Boolean;
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
    function IsDBWriteEnabled: Boolean;
    function IsDBReadEnabled: Boolean;
    function IsInstance: Boolean;
    function IsWritable: Boolean;
    function IsTransient: Boolean;
    function IsEnumeration: Boolean;
    function IsObjCreateds: Boolean;
    function IsObjUpdateds: Boolean;

    function HasAutodetectedHasManyRelation: Boolean;
    function isHasManyChildVirtualProperty: Boolean;
    procedure SetMetadata_FieldType(const AMetadata_FieldType: TioMetadataFieldType);
    procedure SetMetadata_FieldLength(const AMetadata_FieldLength: Integer);
    procedure SetMetadata_FieldPrecision(const AMetadata_FieldPrecision: Integer);
    procedure SetMetadata_FieldScale(const AMetadata_FieldScale: Integer);
    procedure SetMetadata_FieldNotNull(const AMetadata_FieldNotNull: Boolean);
    procedure SetMetadata_FieldUnicode(const AMetadata_FieldUnicode: Boolean);
    procedure SetMetadata_CustomFieldType(const AMetadata_CustomFieldType: string);
    procedure SetMetadata_FieldSubType(const AMetadata_FieldSubType: string);
    procedure SetMetadata_Default(const AMetadata_Default: TValue);
    procedure SetMetadata_FKCreate(const AMetadata_FKCreate: TioFKCreate);
    procedure SetMetadata_FKOnDeleteAction(const AOnDeleteAction: TioFKAction);
    procedure SetMetadata_FKOnUpdateAction(const AUpdateAction: TioFKAction);
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

    // PropertyRole property
    function GetPropertyRole: TioPropertyRole;
    property PropertyRole: TioPropertyRole read GetPropertyRole;
    // WhereCompareOp property
    procedure SetWhereCompareOp(const Value: TioCompareOp);
    function GetWhereCompareOp: TioCompareOp;
    property WhereCompareOp: TioCompareOp read GetWhereCompareOp write SetWhereCompareOp;
    // WhereLogicOp property
    procedure SetWhereLogicOp(const Value: TioLogicOp);
    function GetWhereLogicOp: TioLogicOp;
    property WhereLogicOp: TioLogicOp read GetWhereLogicOp write SetWhereLogicOp;
    // WhereGroupName property
    procedure SetWhereGroupName(const Value: String);
    function GetWhereGroupName: String;
    property WhereGroupName: String read GetWhereGroupName write SetWhereGroupName;
    // WhereGroupLogicOp property
    procedure SetWhereGroupLogicOp(const Value: TioLogicOp);
    function GetWhereGroupLogicOp: TioLogicOp;
    property WhereGroupLogicOp: TioLogicOp read GetWhereGroupLogicOp write SetWhereGroupLogicOp;
    // WhereMasterGroupName property
    procedure SetWhereMasterGroupName(const Value: String);
    function GetWhereMasterGroupName: String;
    property WhereMasterGroupName: String read GetWhereMasterGroupName write SetWhereMasterGroupName;
    // WhereNullValue property
    procedure SetWhereNullValue(const Value: TValue);
    function GetWhereNullValue: TValue;
    property WhereNullValue: TValue read GetWhereNullValue write SetWhereNullValue;
    // WhereSkip property
    procedure SetWhereSkip(const Value: Boolean);
    function GetWhereSkip: Boolean;
    property WhereSkip: Boolean read GetWhereSkip write SetWhereSkip;
    // WhereTargetPropName property
    procedure SetWhereTargetPropName(const Value: String);
    function GetWhereTargetPropName: String;
    property WhereTargetPropName: String read GetWhereTargetPropName write SetWhereTargetPropName;
  end;

  IioProperties = interface(IioSqlItem)
    ['{AB30A3A2-640C-4BEF-B301-2CB7C855037B}']
    /// This method add to the TrueClassVirtualMap it's properties (if not already exists)
    procedure CopyPropertiesToTrueClassVirtualMap(const ATrueClassVirtualMapProperties: IioProperties);
    function GetEnumerator: TEnumerator<iORM.Context.Properties.Interfaces.IioProperty>;
    procedure Add(const AProperty:IioProperty);
    function PropertyExists(const APropertyName: String): Boolean;
    function GetIdProperty: IioProperty;
    function GetPropertyByName(const APropertyName:String): IioProperty;
    procedure SetTable(const ATable:IioTable);
    // Blob field present
    function BlobFieldExists: Boolean;
    // ObjectStatus property
    function ObjStatusPropertyExist: Boolean;
    function GetObjStatusProperty: IioProperty;
    procedure SetObjStatusProperty(const AValue: IioProperty);
    property ObjStatusProperty:IioProperty read GetObjStatusProperty write SetObjStatusProperty;
    // ObjVersion property
    function ObjVersionPropertyExist: Boolean;
    function GetObjVersionProperty: IioProperty;
    procedure SetObjVersionProperty(const AValue: IioProperty);
    property ObjVersionProperty: IioProperty read GetObjVersionProperty write SetObjVersionProperty;
    // ObjCreated property
    function ObjCreatedPropertyExist: Boolean;
    function GetObjCreatedProperty: IioProperty;
    procedure SetObjCreatedProperty(const AValue: IioProperty);
    property ObjCreatedProperty: IioProperty read GetObjCreatedProperty write SetObjCreatedProperty;
    // ObjCreatedUserID property
    function ObjCreatedUserIDPropertyExist: Boolean;
    function GetObjCreatedUserIDProperty: IioProperty;
    procedure SetObjCreatedUserIDProperty(const AValue: IioProperty);
    property ObjCreatedUserIDProperty: IioProperty read GetObjCreatedUserIDProperty write SetObjCreatedUserIDProperty;
    // ObjCreatedUserName property
    function ObjCreatedUserNamePropertyExist: Boolean;
    function GetObjCreatedUserNameProperty: IioProperty;
    procedure SetObjCreatedUserNameProperty(const AValue: IioProperty);
    property ObjCreatedUserNameProperty: IioProperty read GetObjCreatedUserNameProperty write SetObjCreatedUserNameProperty;
    // ObjUpdated property
    function ObjUpdatedPropertyExist: Boolean;
    function GetObjUpdatedProperty: IioProperty;
    procedure SetObjUpdatedProperty(const AValue: IioProperty);
    property ObjUpdatedProperty: IioProperty read GetObjUpdatedProperty write SetObjUpdatedProperty;
    // ObjUpdatedUserID property
    function ObjUpdatedUserIDPropertyExist: Boolean;
    function GetObjUpdatedUserIDProperty: IioProperty;
    procedure SetObjUpdatedUserIDProperty(const AValue: IioProperty);
    property ObjUpdatedUserIDProperty: IioProperty read GetObjUpdatedUserIDProperty write SetObjUpdatedUserIDProperty;
    // ObjUpdatedUserName property
    function ObjUpdatedUserNamePropertyExist: Boolean;
    function GetObjUpdatedUserNameProperty: IioProperty;
    procedure SetObjUpdatedUserNameProperty(const AValue: IioProperty);
    property ObjUpdatedUserNameProperty: IioProperty read GetObjUpdatedUserNameProperty write SetObjUpdatedUserNameProperty;
  end;

implementation

end.
