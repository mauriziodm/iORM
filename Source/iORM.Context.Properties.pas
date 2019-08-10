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



unit iORM.Context.Properties;

interface

uses
  iORM.Context.Properties.Interfaces,
  iORM.CommonTypes,
  iORM.Attributes,
  iORM.SqlItems,
  System.Rtti,
  System.Generics.Collections, iORM.Context.Table.Interfaces, System.Classes,
  System.TypInfo;

type

  // Classe che rappresenta una proprietà
  TioProperty = class (TInterfacedObject, IioContextProperty)
  strict private
    FIsID: Boolean;
    FSkipped: Boolean;
    FIDSkipOnInsert: Boolean;
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
    FRelationChildAutoIndex: Boolean;
    FRelationLoadType: TioLoadType;
    FTable:IioContextTable;
    FReadWrite: TioReadWrite;
    // M.M. 01/08/18 - MetadataType used by DBBuilder
    FMetadata_FieldType: TioMetadataFieldType;
    FMetadata_FieldLength: Integer;
    FMetadata_FieldPrecision: Integer;
    FMetadata_FieldScale: Integer;
    FMetadata_FieldNullable: Boolean;
    FMetadata_FieldUnicode: Boolean;
    FMetadata_CustomFieldType: string;
    FMetadata_FKCreate: Boolean;
    FMetadata_FieldSubType: string;
    // O.B. 19/06/19 - MetadataType used by DBBuilder
    FMetadata_FKCascadeDelete : Boolean;
    FMetadata_FKCascadeUpdate : Boolean;

    procedure SetRelationChildNameAndPath(const AQualifiedChildPropertyName:String);
    // NB: Gli altri due attributes (ioEmbeddedSkip e ioEmbeddedStreamable) non sono necessari qui
    //      perchè li usa solo l'ObjectsMappers al suo interno, iORM non li usa
  strict protected
    constructor Create(const ATypeAlias, AFieldDefinitionString, ALoadSql, AFieldType:String; const ASkipped:Boolean;
      const AReadWrite:TioReadWrite; const ARelationType:TioRelationType; const ARelationChildTypeName, ARelationChildTypeAlias,
      ARelationChildPropertyName:String; const ARelationLoadType:TioLoadType; const ARelationChildAutoIndex:Boolean;
      const AMetadata_FieldType: TioMetadataFieldType; const AMetadata_FieldLength: Integer; const AMetadata_FieldPrecision: Integer;
      const AMetadata_FieldScale: Integer; const AMetadata_FieldNullable: Boolean; const AMetadata_FieldUnicode: Boolean;
      const AMetadata_CustomFieldType: string; const AMetadata_FKCreate: boolean; const AMetadata_FieldSubType: string;
      const AMetadata_FKCascadeDelete, AMetadata_FKCascadeUpdate : Boolean); overload;
  public
    constructor Create(const ARttiProperty:TRttiProperty; const ATypeAlias, AFieldDefinitionString, ALoadSql, AFieldType:String; const ASkipped:Boolean;
      const AReadWrite:TioReadWrite; const ARelationType:TioRelationType; const ARelationChildTypeName, ARelationChildTypeAlias,
      ARelationChildPropertyName:String; const ARelationLoadType:TioLoadType; const ARelationChildAutoIndex:Boolean;
      const AMetadata_FieldType: TioMetadataFieldType; const AMetadata_FieldLength: Integer; const AMetadata_FieldPrecision: Integer;
      const AMetadata_FieldScale: Integer; const AMetadata_FieldNullable: Boolean; const AMetadata_FieldUnicode: Boolean;
      const AMetadata_CustomFieldType: string; const AMetadata_FKCreate: boolean; const AMetadata_FieldSubType: string;
      const AMetadata_FKCascadeDelete, AMetadata_FKCascadeUpdate : Boolean); overload;
    function GetLoadSql: String;
    function LoadSqlExist: Boolean;
    function GetName: String; virtual;
    function GetSqlQualifiedFieldName: String;
    function GetSqlFullQualifiedFieldName: String;
    function GetSqlFieldTableName: String;
    function GetSqlFieldName(AClearDelimiters: Boolean=False): String;
    function GetSqlFieldAlias: String;
    function GetSqlParamName: String;
    function GetFieldType: String;
    function IsBlob: Boolean;
    function IsStream: Boolean;
    function GetValue(Instance: Pointer): TValue; virtual;
    function GetValueAsObject(Instance: Pointer): TObject; virtual;
    procedure SetValue(Instance: Pointer; AValue:TValue); virtual;
    function GetSqlValue(ADataObject:TObject): String;
    function GetRttiType: TRttiType; virtual;
    function GetTypeInfo: PTypeInfo; virtual;
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
    function IsWritable: Boolean; virtual;
    function IsSkipped: Boolean;
    // M.M. 01/08/18 - DBBuilder
    procedure SetMetadata_FieldType(const AMetadata_FieldType: TioMetadataFieldType);
    procedure SetMetadata_FieldLength(const AMetadata_FieldLength: Integer);
    procedure SetMetadata_FieldPrecision(const AMetadata_FieldPrecision: Integer);
    procedure SetMetadata_FieldScale(const AMetadata_FieldScale: Integer);
    procedure SetMetadata_FieldNullable(const AMetadata_FieldNullable: Boolean);
    procedure SetMetadata_FieldUnicode(const AMetadata_FieldUnicode: Boolean);
    procedure SetMetadata_CustomFieldType(const AMetadata_CustomFieldType: string);
    procedure SetMetadata_FKCreate(const AMetadata_FKCreate: boolean);
    procedure SetMetadata_FieldSubType(const AMetadata_FieldSubType: string);
    function GetMetadata_FieldType: TioMetadataFieldType;
    function GetMetadata_FieldLength: Integer;
    function GetMetadata_FieldPrecision: Integer;
    function GetMetadata_FieldScale: Integer;
    function GetMetadata_FieldNullable: Boolean;
    function GetMetadata_FieldUnicode: Boolean;
    function GetMetadata_CustomFieldType: string;
    function GetMetadata_FKCreate: boolean;
    function GetMetadata_FieldSubType: string;
    // O.B. 19/06/19 - DBBuilder
    procedure SetMetadata_FKCascadeDelete(const AMetadata_FKCascadeDelete: boolean);
    function GetMetadata_FKCascadeDelete: boolean;
    procedure SetMetadata_FKCascadeUpdate(const AMetadata_FKCascadeUpdate: boolean);
    function GetMetadata_FKCascadeUpdate: boolean;
  end;

  // Classe che rappresenta un field della classe
  TioField = class(TioProperty)
  strict private
    FRttiProperty: TRttiField;
    FName: String;
  public
    constructor Create(const ARttiField:TRttiField; const ATypeAlias, AFieldDefinitionString, ALoadSql, AFieldType:String; const ASkipped:Boolean;
      const AReadWrite:TioReadWrite; const ARelationType:TioRelationType; const ARelationChildTypeName, ARelationChildTypeAlias,
      ARelationChildPropertyName:String; const ARelationLoadType:TioLoadType; const ARelationChildAutoIndex:Boolean;
      const AMetadata_FieldType: TioMetadataFieldType; const AMetadata_FieldLength: Integer; const AMetadata_FieldPrecision: Integer;
      const AMetadata_FieldScale: Integer; const AMetadata_FieldNullable: Boolean; const AMetadata_FieldUnicode: Boolean;
      const AMetadata_CustomFieldType: string; const AMetadata_FKCreate: boolean; const AMetadata_FieldSubType: string;
      const AMetadata_FKCascadeDelete, AMetadata_FKCascadeUpdate : Boolean); overload;
    class function Remove_F_FromName(AFieldName:String): String;
    function GetName: String; override;
    function GetValue(Instance: Pointer): TValue; override;
    procedure SetValue(Instance: Pointer; AValue:TValue); override;
    function GetRttiType: TRttiType; override;
    function GetTypeInfo: PTypeInfo; override;
    function IsWritable: Boolean; override;
  end;


  // Classe con l'elenco delle proprietà della classe
  TioPropertiesGetSqlFunction = reference to function(AProperty:IioContextProperty):String;
  TioProperties = class (TioSqlItem, IioContextProperties)
  strict private
    FPropertyItems: TList<IioContextProperty>;
    FIdProperty: IioContextProperty;
    FObjStatusProperty: IioContextProperty;
    FBlobFieldExists: Boolean;
  strict protected
    function InternalGetSql(ASqlRequestType:TioSqlRequestType; AFunc:TioPropertiesGetSqlFunction): String;
    // ObjectStatus property
    function GetObjStatusProperty: IioContextProperty;
    procedure SetObjStatusProperty(AValue: IioContextProperty);
  public
    constructor Create;reintroduce;
    destructor Destroy; override;
    function GetEnumerator: TEnumerator<IioContextProperty>;
    function GetSql: String; reintroduce; overload;
    function GetSql(ASqlRequestType:TioSqlRequestType=ioAll): String; reintroduce; overload;
    procedure Add(AProperty:IioContextProperty; AIsId:Boolean=False; AIDSkipOnInsert:Boolean=True);
    function PropertyExists(const APropertyName: String): Boolean;
    function GetIdProperty:IioContextProperty;
    function GetPropertyByName(APropertyName:String): IioContextProperty;
    procedure SetTable(ATable:IioContextTable);
    procedure SetFieldData;
    procedure SetLoadSqlData;
    // Blob field present
    function BlobFieldExists: Boolean;
    // ObjectStatus Exist
    function ObjStatusExist: Boolean;
    // ObjectStatus property
    property ObjStatusProperty:IioContextProperty read GetObjStatusProperty write SetObjStatusProperty;
  end;


implementation

uses
  iORM.Context.Interfaces,
  iORM.DB.Factory, iORM.Exceptions, System.SysUtils, iORM.SqlTranslator,
  System.StrUtils, iORM.Context.Map.Interfaces, iORM.Rtti.Utilities,
  iORM.DB.ConnectionContainer, iORM.DB.Interfaces, iORM.Context.Container;

{ TioProperty }

constructor TioProperty.Create(const ARttiProperty: TRttiProperty; const ATypeAlias, AFieldDefinitionString, ALoadSql,
  AFieldType: String; const ASkipped:Boolean; const AReadWrite: TioReadWrite; const ARelationType: TioRelationType; const ARelationChildTypeName,
  ARelationChildTypeAlias, ARelationChildPropertyName: String; const ARelationLoadType: TioLoadType; const ARelationChildAutoIndex:Boolean;
  const AMetadata_FieldType: TioMetadataFieldType; const AMetadata_FieldLength: Integer; const AMetadata_FieldPrecision: Integer;
  const AMetadata_FieldScale: Integer; const AMetadata_FieldNullable: Boolean; const AMetadata_FieldUnicode: Boolean;
  const AMetadata_CustomFieldType: string; const AMetadata_FKCreate: boolean; const AMetadata_FieldSubType: string;
  const AMetadata_FKCascadeDelete, AMetadata_FKCascadeUpdate : Boolean);
begin
  // NB: No inherited here
  Self.Create(ATypeAlias, AFieldDefinitionString, ALoadSql, AFieldType, ASkipped, AReadWrite,
    ARelationType, ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName, ARelationLoadType, ARelationChildAutoIndex,
    AMetadata_FieldType,AMetadata_FieldLength, AMetadata_FieldPrecision, AMetadata_FieldScale,AMetadata_FieldNullable, AMetadata_FieldUnicode, AMetadata_CustomFieldType,
    AMetadata_FKCreate, AMetadata_FieldSubType, AMetadata_FKCascadeDelete,AMetadata_FKCascadeUpdate);
  FRttiProperty := ARttiProperty;
end;

constructor TioProperty.Create(const ATypeAlias, AFieldDefinitionString, ALoadSql, AFieldType: String; const ASkipped:Boolean;
  const AReadWrite: TioReadWrite; const ARelationType: TioRelationType; const ARelationChildTypeName, ARelationChildTypeAlias,
  ARelationChildPropertyName: String; const ARelationLoadType: TioLoadType; const ARelationChildAutoIndex:Boolean;
  const AMetadata_FieldType: TioMetadataFieldType; const AMetadata_FieldLength: Integer; const AMetadata_FieldPrecision: Integer;
  const AMetadata_FieldScale: Integer; const AMetadata_FieldNullable: Boolean; const AMetadata_FieldUnicode: Boolean;
  const AMetadata_CustomFieldType: string; const AMetadata_FKCreate: boolean; const AMetadata_FieldSubType: string;
  const AMetadata_FKCascadeDelete, AMetadata_FKCascadeUpdate : Boolean);
begin
  inherited Create;
  FTypeAlias := ATypeAlias;
  FFieldDefinitionString := AFieldDefinitionString;
  FFieldType := AFieldType;
  FSkipped := ASkipped;
  FReadWrite := AReadWrite;
  FLoadSql := ALoadSql;
  // Relation fields
  FRelationType := ARelationType;
  FRelationChildTypeName := ARelationChildTypeName;
  FRelationChildTypeAlias := ARelationChildTypeAlias;
  FRelationChildAutoIndex := ARelationChildAutoIndex;
  FRelationLoadType := ARelationLoadType;
  // M.M. 01/08/18 - MetadataType used by DBBuilder
  FMetadata_FieldType := AMetadata_FieldType;
  FMetadata_FieldLength := AMetadata_FieldLength;
  FMetadata_FieldPrecision := AMetadata_FieldPrecision;
  FMetadata_FieldScale := AMetadata_FieldScale;
  FMetadata_FieldNullable := AMetadata_FieldNullable;
  FMetadata_FieldUnicode := AMetadata_FieldUnicode;
  FMetadata_CustomFieldType := AMetadata_CustomFieldType;
  FMetadata_FKCreate := AMetadata_FKCreate;
  FMetadata_FieldSubType := AMetadata_FieldSubType;
  // O.B. 19/06/19 - MetadataType used by DBBuilder
  FMetadata_FKCascadeDelete := AMetadata_FKCascadeDelete;
  FMetadata_FKCascadeUpdate := AMetadata_FKCascadeUpdate;
  // Set the RelationChildPropertyName & RelationChildPropertyPath
  Self.SetRelationChildNameAndPath(ARelationChildPropertyName);
end;

function TioProperty.GetFieldType: String;
begin
  // ================================================================================
  // NB: Questa funzione è usata solo da questa classe stessa (Self.IsBlob) e dalla
  //      creazione automatica del DB per determinare il tipo di campo. Siccome
  //      l'unicoDB per il quale è disponibile la creazione automatica del DB è SQLite
  //      non è necessario che questa funzione si adatti ai diversi RDBMS e quindi la lascio
  //      fissa così. Questo va bene anche all'interno della funzione Self.IsBlob
  //      perchè questa verifica solo se il tipo comincia per BLOB e uesto va bene per
  //      qualunque DB.
  // ================================================================================
  // If the FField is not empty then return it
  if not FFieldType.IsEmpty then
    Exit(FFieldType);
  // According to the RelationType of the property...
  case Self.GetRelationType of
    // Normal property, no relation, field type is by TypeKind of the property itself
    ioRTNone: begin
      case Self.GetRttiType.TypeKind of
        tkInt64, tkInteger, tkEnumeration: Result := 'INTEGER';
        tkFloat: Result := 'REAL';
        tkString, tkUString, tkWChar, tkLString, tkWString, tkChar: Result := 'TEXT';
        tkClass, tkInterface: Result := 'BLOB';
      end;
    end;
    // If it is an ioRTEmbedded property then the field type is always BLOB
    ioRTEmbeddedHasMany, ioRTEmbeddedHasOne: Result := 'BLOB';
    // If it's a BelongsTo relation property then field type is always INTEGER
    //  because the ID fields always are INTEGERS values
    ioRTBelongsTo: Result := 'INTEGER';
    // Otherwise return NULL field type
    else Result := 'NULL';
  end;
end;

function TioProperty.GetLoadSql: String;
begin
  Result := '(' + Self.FLoadSql + ') AS ' + Self.GetSqlFieldAlias;
end;

function TioProperty.GetMetadata_CustomFieldType: string;
begin
  Result := FMetadata_CustomFieldType;
end;

function TioProperty.GetMetadata_FKCreate: boolean;
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

function TioProperty.GetMetadata_FieldNullable: Boolean;
begin
  Result := FMetadata_FieldNullable;
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

function TioProperty.GetMetadata_FKCascadeDelete: boolean;
begin
  result := FMetadata_FKCascadeDelete;
end;

function TioProperty.GetMetadata_FKCascadeUpdate: boolean;
begin
  result := FMetadata_FKCascadeUpdate;
end;

function TioProperty.GetSqlFullQualifiedFieldName: String;
begin
  Result := GetSqlQualifiedFieldName + ' AS ' + FSqlFieldAlias;
end;

function TioProperty.GetName: String;
begin
  Result := FRttiProperty.Name;
end;

function TioProperty.GetRelationChildTypeAlias: String;
begin
  Result := FRelationChildTypeAlias;
end;

function TioProperty.GetRelationChildTypeName: String;
begin
  Result := FRelationChildTypeName;
end;

function TioProperty.GetRelationChildAutoIndex: Boolean;
begin
  Result := FRelationChildAutoIndex;
end;

function TioProperty.GetRelationChildObject(Instance: Pointer): TObject;
var
  AValue: TValue;
begin
  // Extract the child related object
  AValue := Self.GetValue(Instance);
  Result := TioRttiUtilities.TValueToObject(AValue, True);
  // If a RelationChildPropertyPath is assigned then resolve it
  if Self.RelationChildPropertyPathAssigned then
    Result := TioRttiUtilities.ResolveChildPropertyPath(Result, FRelationChildPropertyPath);
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

function TioProperty.GetRelationLoadType: TioLoadType;
begin
  Result := FRelationLoadType;
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

function TioProperty.GetSqlFieldName(AClearDelimiters: Boolean): String;
begin
//  Result := FSqlFieldName;
  if AClearDelimiters then
    Result := FSqlFieldName
  else
    Result := TioDbFactory.SqlDataConverter.FieldNameToSqlFieldName(FSqlFieldName);
end;

function TioProperty.GetSqlFieldTableName: String;
begin
  Result := FSqlFieldTableName;
end;

function TioProperty.GetSqlQualifiedFieldName: String;
begin
//  Result := FQualifiedSqlFieldName;
  Result := TioDbFactory.SqlDataConverter.FieldNameToSqlFieldName(FSqlFieldTableName) + '.' + TioDbFactory.SqlDataConverter.FieldNameToSqlFieldName(FSqlFieldName);
end;

function TioProperty.GetSqlParamName: String;
begin
  Result := 'P_' + Self.GetSqlFieldAlias;
end;

function TioProperty.GetSqlValue(ADataObject:TObject): String;
begin
  Result := TioDbFactory.SqlDataConverter.TValueToSql(Self.GetValue(ADataObject));
end;

function TioProperty.GetValue(Instance: Pointer): TValue;
begin
  Result := FRttiProperty.GetValue(Instance);
end;

function TioProperty.GetValueAsObject(Instance: Pointer): TObject;
var
  AValue: TValue;
begin
  AValue := Self.GetValue(Instance);
  Result := TioRttiUtilities.TValueToObject(AValue, False)
end;

function TioProperty.IDSkipOnInsert: Boolean;
begin
  Result := FIDSkipOnInsert;
end;

function TioProperty.IsBlob: Boolean;
begin
  Result := ((FRelationType = ioRTNone) or (FRelationType = ioRTEmbeddedHasMany) or (FRelationType = ioRTEmbeddedHasOne))
    and Self.GetFieldType.StartsWith('BLOB');
end;

function TioProperty.IsID: Boolean;
begin
  Result := FIsID;
end;

function TioProperty.IsInstance: Boolean;
begin
  Result := Self.GetRttiType.IsInstance;
end;

function TioProperty.IsInterface: Boolean;
begin
  Result := (Self.GetRttiType.TypeKind = tkInterface);
end;

function TioProperty.IsDBReadEnabled: Boolean;
begin
  Result := (FReadWrite <= iorwReadWrite) and not FSkipped;
end;

function TioProperty.IsSkipped: Boolean;
begin
  Result := FSkipped;
end;

function TioProperty.IsSqlRequestCompliant(
  ASqlRequestType: TioSqlRequestType): Boolean;
begin
  case ASqlRequestType of
    ioSelect: Result := (FReadWrite <= iorwReadWrite) and not FSkipped;
    ioInsert:
    begin
      Result := (FReadWrite >= iorwReadWrite) and not FSkipped;
      // NB: Se la proprietà è l'ID e stiamo utilizzando una connessione a SQLServer
      //      e il flag IDSkipOnInsert = True evita di inserire anche questa proprietà
      //      nell'elenco (della query insert).
      if Self.IsID and Self.IDSkipOnInsert and (TioConnectionManager.GetConnectionInfo.ConnectionType = cdtSQLServer) then
        Result := False;
    end;
    ioUpdate: Result := (FReadWrite >= iorwReadWrite) and not FSkipped;
  else Result := True;
  end;
end;

function TioProperty.IsStream: Boolean;
begin
  Result := (Self.GetRttiType.IsInstance)
        and (Self.GetRttiType.AsInstance.MetaclassType.InheritsFrom(TSTream));
end;

function TioProperty.IsWritable: Boolean;
begin
  Result := FRttiProperty.IsWritable;
end;

function TioProperty.IsDBWriteEnabled: Boolean;
begin
  Result := (FReadWrite >= iorwReadWrite) and not FSkipped;
end;

function TioProperty.LoadSqlExist: Boolean;
begin
  Result := Self.FLoadSql <> '';
end;

function TioProperty.RelationChildPropertyPathAssigned: Boolean;
begin
  Result := Assigned(FRelationChildPropertyPath);
end;

procedure TioProperty.SetFieldData;
var
  DotPos, AsPos: Smallint;
  AValue: String;
begin
  AValue := FFieldDefinitionString;
  // Translate (if contains tags)
  AValue := TioSqlTranslator.Translate(AValue, '');
  // Retrieve the markers position
  DotPos := Pos('.', AValue);
  AsPos := Pos(' AS ', AValue, DotPos);
  if AsPos = 0 then AsPos := AValue.Length+1;
  // Retrieve Table reference
  FSqlFieldTableName := LeftStr(AValue, DotPos-1);
  if FSqlFieldTableName = '' then FSqlFieldTableName := FTable.TableName;
  // Retrieve FieldName
  FSqlFieldName := MidStr(AValue, DotPos+1, AsPos-DotPos-1);
  // Retrieve Field Alias
  FSqlFieldAlias := MidStr(AValue, AsPos+4, AValue.Length);
  if FSqlFieldAlias = '' then FSqlFieldAlias := FSqlFieldTableName + '_' + FSqlFieldName;
end;

procedure TioProperty.SetIDSkipOnInsert(const AIDSkipOnInsert: Boolean);
begin
  FIDSkipOnInsert := AIDSkipOnInsert;
end;

procedure TioProperty.SetIsID(AValue: Boolean);
begin
  FisID := AValue;
end;

procedure TioProperty.SetLoadSqlData;
begin
  // Set LoadSql statement (if exist)
  if Self.FLoadSql <> ''
    then FLoadSql := TioSqlTranslator.Translate(FLoadSql, '');
end;

procedure TioProperty.SetMetadata_CustomFieldType(
  const AMetadata_CustomFieldType: string);
begin
  FMetadata_CustomFieldType := AMetadata_CustomFieldType;
end;

procedure TioProperty.SetMetadata_FKCreate(
  const AMetadata_FKCreate: boolean);
begin
  FMetadata_FKCreate := AMetadata_FKCreate;
end;

procedure TioProperty.SetMetadata_FieldSubType(const AMetadata_FieldSubType: string);
begin
  FMetadata_FieldSubType := AMetadata_FieldSubType;
end;

procedure TioProperty.SetMetadata_FieldLength(
  const AMetadata_FieldLength: Integer);
begin
  FMetadata_FieldLength := AMetadata_FieldLength;
end;

procedure TioProperty.SetMetadata_FieldNullable(
  const AMetadata_FieldNullable: Boolean);
begin
  FMetadata_FieldNullable := AMetadata_FieldNullable;
end;

procedure TioProperty.SetMetadata_FieldPrecision(
  const AMetadata_FieldPrecision: Integer);
begin
  FMetadata_FieldPrecision := AMetadata_FieldPrecision;
end;

procedure TioProperty.SetMetadata_FieldScale(
  const AMetadata_FieldScale: Integer);
begin
  FMetadata_FieldScale := AMetadata_FieldScale;
end;

procedure TioProperty.SetMetadata_FieldType(
  const AMetadata_FieldType: TioMetadataFieldType);
begin
  FMetadata_FieldType := AMetadata_FieldType;
end;

procedure TioProperty.SetMetadata_FieldUnicode(
  const AMetadata_FieldUnicode: Boolean);
begin
  FMetadata_FieldUnicode := AMetadata_FieldUnicode;
end;

procedure TioProperty.SetMetadata_FKCascadeDelete(const AMetadata_FKCascadeDelete: boolean);
begin
  FMetadata_FKCascadeDelete := AMetadata_FKCascadeDelete;
end;

procedure TioProperty.SetMetadata_FKCascadeUpdate(const AMetadata_FKCascadeUpdate: boolean);
begin
  FMetadata_FKCascadeUpdate := AMetadata_FKCascadeUpdate;
end;

procedure TioProperty.SetRelationChildNameAndPath(const AQualifiedChildPropertyName: String);
begin
  // If the AQualifiedChildPropertyName is empty then exit
  if AQualifiedChildPropertyName.IsEmpty then Exit;
  // Create the StringList, set the Delimiter and DelimitedText
  FRelationChildPropertyPath := TStringList.Create;
  FRelationChildPropertyPath.Delimiter := '.';
  FRelationChildPropertyPath.DelimitedText := AQualifiedChildPropertyName;
  // The last element is the ChildPropertyName
  FRelationChildPropertyName := FRelationChildPropertyPath[FRelationChildPropertyPath.Count-1];
  // Remove the last element
  FRelationChildPropertyPath.Delete(FRelationChildPropertyPath.Count-1);
  // If the remaining list is empty then free it (optimization)
  if FRelationChildPropertyPath.Count = 0 then
    FreeAndNil(FRelationChildPropertyPath);
end;

procedure TioProperty.SetTable(ATable: IioContextTable);
begin
  FTable := ATable;
end;

procedure TioProperty.SetValue(Instance: Pointer; AValue: TValue);
begin
  FRttiProperty.SetValue(Instance, AValue);
//  ***ChildPropertyPath***
end;

{ TioProperties }

procedure TioProperties.Add(AProperty: IioContextProperty; AIsId, AIDSkipOnInsert: Boolean);
begin
  FPropertyItems.Add(AProperty);
  if AIsId then FIdProperty := AProperty;
  AProperty.SetIsID(AIsId);
  AProperty.SetIDSkipOnInsert(AIDSkipOnInsert);
  if AProperty.IsBlob then Self.FBlobFieldExists := True;
end;

function TioProperties.BlobFieldExists: Boolean;
begin
  Result := FBlobFieldExists;
end;

constructor TioProperties.Create;
begin
  FBlobFieldExists := False;
  FObjStatusProperty := nil;
  FPropertyItems := TList<IioContextProperty>.Create;
end;

destructor TioProperties.Destroy;
begin
  FPropertyItems.Free;
  inherited;
end;

function TioProperties.PropertyExists(const APropertyName: String): Boolean;
var
  CurrProp: IioContextProperty;
begin
  for CurrProp in FPropertyItems do
    if CurrProp.GetName.ToUpper.Equals(APropertyName.ToUpper) then
      Exit(True);
  Result := False;
end;

function TioProperties.GetEnumerator
  : TEnumerator<IioContextProperty>;
begin
  Result := FPropertyItems.GetEnumerator;
end;

function TioProperties.GetIdProperty: IioContextProperty;
begin
  Result := FIdProperty;
end;

function TioProperties.GetObjStatusProperty: IioContextProperty;
begin
  Result := FObjStatusProperty;
end;

function TioProperties.GetPropertyByName(
  APropertyName: String): IioContextProperty;
var
  CurrProp: IioContextProperty;
begin
  for CurrProp in FPropertyItems do
    if CurrProp.GetName.ToUpper.Equals(APropertyName.ToUpper) then
      Exit(CurrProp);
  raise EioException.Create(Self.ClassName +  ': Context property "' + APropertyName + '" not found');
end;

function TioProperties.GetSql: String;
begin
  // Use Internal function with an anonomous method
  Result := Self.InternalGetSql(
    ioAll,
    function (AProp:IioCOntextProperty): String
    begin
      Result := AProp.GetSqlFieldName;
    end
  );
end;


function TioProperties.GetSql(ASqlRequestType: TioSqlRequestType): String;
var
  AFunc: TioPropertiesGetSqlFunction;
begin
  // Get the function by ASqlRequestType value
  case ASqlRequestType of
    ioSelect: AFunc := function (AProp:IioCOntextProperty): String
                       begin
                         if AProp.LoadSqlExist
                           then Result := AProp.GetLoadSql
                           else Result := AProp.GetSqlFullQualifiedFieldName;
                       end;
  else AFunc := function (AProp:IioCOntextProperty): String
                begin
                  Result := AProp.GetSqlFieldName;
                end;
  end;
  // Use Internal function with an anonomous method
  Result := Self.InternalGetSql(ASqlRequestType, AFunc);
end;

function TioProperties.InternalGetSql(ASqlRequestType:TioSqlRequestType;
  AFunc: TioPropertiesGetSqlFunction): String;
var
  Prop: IioContextProperty;
begin
  for Prop in FPropertyItems do
  begin
    // If the property is not compliant with the request then skip it
    if not Prop.IsSqlRequestCompliant(ASqlRequestType) then Continue;
    // If current prop is a list of HasMany or HasOne related objects skip this property
    if (Prop.GetRelationType = ioRTHasMany) or (Prop.GetRelationType = ioRTHasOne) then
      Continue;
    // Add the current property
    if Result <> '' then Result := Result + ', ';
    Result := Result + AFunc(Prop);
  end;
end;

function TioProperties.ObjStatusExist: Boolean;
begin
  Result := Assigned(FObjStatusProperty);
end;

procedure TioProperties.SetFieldData;
var
  AProperty: IioContextProperty;
begin
  for AProperty in FPropertyItems
    do AProperty.SetFieldData;
end;

procedure TioProperties.SetLoadSqlData;
var
  AProperty: IioContextProperty;
begin
  for AProperty in FPropertyItems
    do AProperty.SetLoadSqlData;
end;

procedure TioProperties.SetObjStatusProperty(AValue: IioContextProperty);
begin
  FObjStatusProperty := AValue;
end;

procedure TioProperties.SetTable(ATable: IioContextTable);
var
  AProperty: IioContextProperty;
begin
  for AProperty in FPropertyItems do
    AProperty.SetTable(ATable);
end;

{ TioField }

constructor TioField.Create(const ARttiField:TRttiField; const ATypeAlias, AFieldDefinitionString, ALoadSql, AFieldType:String; const ASkipped:Boolean;
      const AReadWrite:TioReadWrite; const ARelationType:TioRelationType; const ARelationChildTypeName, ARelationChildTypeAlias,
      ARelationChildPropertyName:String; const ARelationLoadType:TioLoadType; const ARelationChildAutoIndex:Boolean;
      const AMetadata_FieldType: TioMetadataFieldType; const AMetadata_FieldLength: Integer; const AMetadata_FieldPrecision: Integer;
      const AMetadata_FieldScale: Integer; const AMetadata_FieldNullable: Boolean; const AMetadata_FieldUnicode: Boolean;
      const AMetadata_CustomFieldType: string; const AMetadata_FKCreate: boolean; const AMetadata_FieldSubType: string;
      const AMetadata_FKCascadeDelete, AMetadata_FKCascadeUpdate : Boolean);
begin
  // NB: No inherited here
  Self.Create(ATypeAlias, AFieldDefinitionString, ALoadSql, AFieldType, ASkipped, AReadWrite,
    ARelationType, ARelationChildTypeName, ARelationChildTypeAlias, ARelationChildPropertyName, ARelationLoadType, ARelationChildAutoIndex,
    AMetadata_FieldType,AMetadata_FieldLength, AMetadata_FieldPrecision, AMetadata_FieldScale,AMetadata_FieldNullable, AMetadata_FieldUnicode, AMetadata_CustomFieldType,
    AMetadata_FKCreate, AMetadata_FieldSubType, AMetadata_FKCascadeDelete, AMetadata_FKCascadeUpdate);

  FRttiProperty := ARttiField;
  FName := Self.Remove_F_FromName(ARttiField.Name);
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

function TioField.GetValue(Instance: Pointer): TValue;
begin
  // No inherited
  Result := FRttiProperty.GetValue(Instance);
end;

function TioField.IsWritable: Boolean;
begin
  // A private field is always writable
  Result := True;
end;

class function TioField.Remove_F_FromName(AFieldName:String): String;
begin
  if Uppercase(AFieldName).StartsWith('F') then
    Result := AFieldName.Substring(1);  // Elimina il primo carattere (di solito la F)
end;

procedure TioField.SetValue(Instance: Pointer; AValue: TValue);
begin
  // No inherited
  FRttiProperty.SetValue(Instance, AValue);
end;

end.


