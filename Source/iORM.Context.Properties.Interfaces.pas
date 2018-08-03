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
  TioReadWrite = (iorwReadOnly, iorwReadWrite, iorwWriteOnly);

  // Options set for GetSql functions parameter
  TioSqlRequestType = (ioAll=0, ioSelect, ioUpdate, ioInsert, ioDelete, ioExist);

  // Options set for field metadata used in DBBuilder
  TioMetadataFieldType = (ioMdVarchar,ioMdChar,ioMdInteger,ioMdFloat,ioMdDate,ioMdTime,ioMdDateTime,ioMdDecimal,ioMdNumeric,ioMdBoolean,ioMdBinary,ioMdCustomFieldType);

  IioContextProperty = interface
    ['{A79DD7E8-D2B2-4F78-A07A-7757605AC94C}']
    function GetLoadSql: String;
    function LoadSqlExist: Boolean;
    function GetName: string;
    function GetSqlQualifiedFieldName: String;
    function GetSqlFullQualifiedFieldName: String;
    function GetSqlFieldName(AClearDelimiters: Boolean=False): String;
    function GetSqlFieldAlias: String;
    function GetSqlParamName: String;
    function GetFieldType: String;
    function IsBlob: Boolean;
    function IsStream: Boolean;
    function GetValue(Instance: Pointer): TValue;
    function GetValueAsObject(Instance: Pointer): TObject;
    procedure SetValue(Instance: Pointer; AValue: TValue);
    function GetSqlValue(ADataObject: TObject): string;
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
    function GetRelationChildObject(Instance: Pointer): TObject;
    function GetRelationChildObjectID(const Instance: Pointer): Integer;
    function GetRelationChildAutoIndex: Boolean;
    procedure SetTable(ATable:IioContextTable);
    procedure SetFieldData;
    procedure SetLoadSqlData;
    function IsSqlRequestCompliant(ASqlRequestType:TioSqlRequestType): Boolean;
    procedure SetIsID(AValue:Boolean);
    function IsID: Boolean;
    procedure SetIDSkipOnInsert(const AIDSkipOnInsert: Boolean);
    function IDSkipOnInsert: Boolean;
    function IsDBWriteEnabled: Boolean;
    function IsDBReadEnabled: Boolean;
    function IsInstance: Boolean;
    function IsWritable: Boolean;
    function IsSkipped: Boolean;
    // M.M. 01/08/18 - DBBuilder
    procedure SetMetadata_FieldType(const AMetadata_FieldType: TioMetadataFieldType);
    procedure SetMetadata_FieldLength(const AMetadata_FieldLength: Integer);
    procedure SetMetadata_FieldPrecision(const AMetadata_FieldPrecision: Integer);
    procedure SetMetadata_FieldScale(const AMetadata_FieldScale: Integer);
    procedure SetMetadata_FieldNullable(const AMetadata_FieldNullable: Boolean);
    procedure SetMetadata_FieldUnicode(const AMetadata_FieldUnicode: Boolean);
    procedure SetMetadata_CustomFieldType(const AMetadata_CustomFieldType: string);
    function GetMetadata_FieldType: TioMetadataFieldType;
    function GetMetadata_FieldLength: Integer;
    function GetMetadata_FieldPrecision: Integer;
    function GetMetadata_FieldScale: Integer;
    function GetMetadata_FieldNullable: Boolean;
    function GetMetadata_FieldUnicode: Boolean;
    function GetMetadata_CustomFieldType: string;
  end;

  IioContextProperties = interface(IioSqlItem)
    ['{AB30A3A2-640C-4BEF-B301-2CB7C855037B}']
    function GetEnumerator: TEnumerator<iORM.Context.Properties.Interfaces.IioContextProperty>;
    procedure Add(AProperty:IioContextProperty; AIsId:Boolean=False; AIDSkipOnInsert:Boolean=True);
    function GetIdProperty: IioContextProperty;
    function GetPropertyByName(APropertyName:String): IioContextProperty;
    procedure SetTable(ATable:IioContextTable);
    function GetSql(ASqlRequestType:TioSqlRequestType=ioAll): String; overload;
    procedure SetFieldData;
    procedure SetLoadSqlData;
    // Blob field present
    function BlobFieldExists: Boolean;
    // ObjectStatus Exist
    function ObjStatusExist: Boolean;
    // ObjectStatus property
    function GetObjStatusProperty: IioContextProperty;
    procedure SetObjStatusProperty(AValue: IioContextProperty);
    property ObjStatusProperty:IioContextProperty read GetObjStatusProperty write SetObjStatusProperty;
  end;

implementation

end.
