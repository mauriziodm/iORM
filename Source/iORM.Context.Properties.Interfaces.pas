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

  IioContextProperty = interface
    ['{A79DD7E8-D2B2-4F78-A07A-7757605AC94C}']
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
    function GetRelationLoadType: TioLoadType;
    function GetRelationChildObject(const Instance: Pointer; const AResolvePropertyPath: Boolean = True): TObject;
    function GetRelationChildObjectID(const Instance: Pointer): Integer;
    procedure SetTable(const ATable: IioContextTable);
    function IsSqlRequestCompliant(const ASqlRequestType: TioSqlRequestType): Boolean;
    procedure SetIsID(const AValue:Boolean);
    function IsID: Boolean;
    procedure SetIDSkipOnInsert(const AIDSkipOnInsert: Boolean);
    function IDSkipOnInsert: Boolean;
    function IsDBWriteEnabled: Boolean;
    function IsDBReadEnabled: Boolean;
    function IsInstance: Boolean;
    function IsWritable: Boolean;
    function IsTransient: Boolean;
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

  end;

  IioContextProperties = interface(IioSqlItem)
    ['{AB30A3A2-640C-4BEF-B301-2CB7C855037B}']
    function GetEnumerator: TEnumerator<iORM.Context.Properties.Interfaces.IioContextProperty>;
    procedure Add(const AProperty:IioContextProperty);
    function PropertyExists(const APropertyName: String): Boolean;
    function GetIdProperty: IioContextProperty;
    function GetPropertyByName(const APropertyName:String): IioContextProperty;
    function GetSql(const ASqlRequestType: TioSqlRequestType = ioAll): String; overload;
    procedure SetTable(const ATable:IioContextTable);
    // Blob field present
    function BlobFieldExists: Boolean;
    // ObjectStatus Exist
    function ObjStatusExist: Boolean;
    // ObjectVersion Exist
    function ObjVersionExist: Boolean;
    function IsObjVersionProperty(const AProperty: IioContextProperty): Boolean;
    // ObjectStatus property
    function GetObjStatusProperty: IioContextProperty;
    procedure SetObjStatusProperty(const AValue: IioContextProperty);
    property ObjStatusProperty:IioContextProperty read GetObjStatusProperty write SetObjStatusProperty;
    // ObjVersion property
    function GetObjVersionProperty: IioContextProperty;
    procedure SetObjVersionProperty(const AValue: IioContextProperty);
    property ObjVersionProperty: IioContextProperty read GetObjVersionProperty write SetObjVersionProperty;
  end;

implementation

end.
