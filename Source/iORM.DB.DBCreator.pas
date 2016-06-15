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



unit iORM.DB.DBCreator;

interface

uses
  iORM.DB.DBCreator.Interfaces, System.Generics.Collections, System.Rtti,
  iORM.DB.Interfaces, iORM.Context.Properties.Interfaces,
  iORM.Context.Interfaces, iORM.Context.Map.Interfaces,
  iORM.Context.Table.Interfaces;

type

  TioDBCreatorField = class(TInterfacedObject, IioDBCreatorField)
  strict private
    FFieldName: String;
    FIsKeyField: Boolean;
    FProperty: IioContextProperty;
    FSqlGenerator: IioDBCreatorSqlGenerator;
    FDBFieldExist: Boolean;
    FDBFieldSameType: Boolean;
    FIsClassFromField: Boolean;
  strict protected
    // FieldName
    function GetFieldName: String;
    // FieldType
    function GetFieldType: String;
    // IsKeyFeld
    function GetIsKeyField: Boolean;
    // DBFieldExists
    procedure SetDBFieldExist(AValue:Boolean);
    function GetDBFieldExist: Boolean;
    // DBFieldSameType
    procedure SetDBFieldSameType(AValue:Boolean);
    function GetDBFieldSameType: Boolean;
    // IsClassFromFIeld
    function GetIsClassFromField: Boolean;
    property IsClassFromField:Boolean read GetIsClassFromField;
  public
    constructor Create(AFieldName:String; AIsKeyField:Boolean; AProperty:IioContextProperty; ASqlGenerator:IioDBCreatorSqlGenerator; AIsClassFromField:Boolean);
    property FieldName:String read GetFieldName;
    property FieldType:String read GetFieldType;
    property IsKeyField:Boolean read GetIsKeyField;
    property DBFieldExist:Boolean read GetDBFieldExist write SetDBFieldExist;
    property DBFieldSameType:Boolean read GetDBFieldSameType write SetDBFieldSameType;
    // Rtti property reference
    function GetProperty: IioContextProperty;
  end;

  TioDBCreatorTable = class(TInterfacedObject, IioDBCreatorTable)
  strict private
    FTableName: String;
    FFields: TioDBCreatorFieldList;
    FIsClassFromField: Boolean;
    FSqlGenerator: IioDBCreatorSqlGenerator;
    FMap: IioMap;
    FIndexList: TioIndexList;
    // TableName
    function GetTableName: String;
    Procedure SetTableName(AValue:String);
    // Fields
    function GetFields: TioDBCreatorFieldList;
    // TableState
    function TableState: TioDBCreatorTableState;
    // IsClassFromField
    function IsClassFromField: Boolean;
    // IndexList
    function GetIndexList: TioIndexList;
  public
    constructor Create(const ATableName:String; const AIsClassFromField:Boolean; const ASqlGenerator:IioDBCreatorSqlGenerator; const AMap:IioMap);
    destructor Destroy; override;
    function FieldExists(AFieldName:String): Boolean;
    function IDField: IioDBCreatorField;
    function GetMap: IioMap;
    property TableName:String read GetTableName write SetTableName;
    property Fields:TioDBCreatorFieldList read GetFields;
    property IndexList:TioIndexList read GetIndexList;
  end;

  TioDBCreator = class(TInterfacedObject, IioDBCreator)
  strict private
    FTables: TioDBCreatorTableList;
    FSqlGenerator: IioDBCreatorSqlGenerator;
  strict protected
    function FindOrCreateTable(const ATableName:String; const AIsClassFromField:Boolean; const AMap:IioMap): IioDBCreatorTable;
    procedure LoadTableStructure(AMap: IioMap);
    procedure LoadDBStructure;
    procedure CreateIndexByAttributes;
    procedure CreateIndexByRelations;
  public
    constructor Create(ASqlGenerator:IioDBCreatorSqlGenerator); overload;
    destructor Destroy; override;
    procedure AutoCreateDatabase(const AAutoCreateIndexesByAttributes:Boolean=True; const AAutoCreateIndexesByRelations:Boolean=True);
    function Tables: TioDBCreatorTableList;
  end;


implementation

uses
  iORM.Attributes, iORM.DB.DBCreator.Factory,
  iORM.Context.Factory, System.SysUtils,
  iORM.CommonTypes, iORM.RttiContext.Factory, iORM.Context.Container,
  iORM, iORM.Resolver.Interfaces, iORM.Resolver.Factory;

{ TioDBCreatorField }

constructor TioDBCreatorField.Create(AFieldName: String; AIsKeyField: Boolean; AProperty:IioContextProperty; ASqlGenerator:IioDBCreatorSqlGenerator; AIsClassFromField:Boolean);
begin
  FSqlGenerator := ASqlGenerator;
  FFieldName := AFieldName;
  FIsKeyField := AIsKeyField;
  FProperty := AProperty;
  FDBFieldExist := False;
  FDBFieldSameType := False;
  FIsClassFromField := AIsClassFromField;
end;

function TioDBCreatorField.GetDBFieldExist: Boolean;
begin
  Result := FDBFieldExist;
end;

function TioDBCreatorField.GetDBFieldSameType: Boolean;
begin
  Result := FDBFieldSameType;
end;

function TioDBCreatorField.GetFieldName: String;
begin
  Result := FFieldName;
end;

function TioDBCreatorField.GetFieldType: String;
begin
  if Self.IsClassFromField
    then Result := TioDBCreatorFactory.GetSqlGenerator.GetClassFromFieldColumnType
    else Result := FProperty.GetFieldType;
end;

function TioDBCreatorField.GetIsClassFromField: Boolean;
begin
  Result := FIsClassFromField;
end;

function TioDBCreatorField.GetIsKeyField: Boolean;
begin
  Result := FIsKeyField;
end;

function TioDBCreatorField.GetProperty: IioContextProperty;
begin
  Result := FProperty;
end;

procedure TioDBCreatorField.SetDBFieldExist(AValue: Boolean);
begin
  FDBFieldExist := AValue;
end;

procedure TioDBCreatorField.SetDBFieldSameType(AValue: Boolean);
begin
  FDBFieldSameType := AValue;
end;

{ TioDBCreatorTable }

constructor TioDBCreatorTable.Create(const ATableName: String; const AIsClassFromField:Boolean; const ASqlGenerator:IioDBCreatorSqlGenerator; const AMap:IioMap);
begin
  FSqlGenerator := ASqlGenerator;
  FTableName := ATableName;
  FIsClassFromField := AIsClassFromField;
  FFields := TioDBCreatorFieldList.Create;
  FMap := AMap;
  FIndexList := TioIndexList.Create(False);
end;

destructor TioDBCreatorTable.Destroy;
begin
  FFields.Free;
  FIndexList.Free;
  inherited;
end;

function TioDBCreatorTable.FieldExists(AFieldName: String): Boolean;
begin
  Result := FFields.ContainsKey(AFieldName);
end;

function TioDBCreatorTable.GetFields: TioDBCreatorFieldList;
begin
  Result := FFields;
end;

function TioDBCreatorTable.GetIndexList: TioIndexList;
begin
  Result := FIndexList;
end;

function TioDBCreatorTable.GetMap: IioMap;
begin
  Result := FMap;
end;

function TioDBCreatorTable.GetTableName: String;
begin
  Result := FTableName;
end;

function TioDBCreatorTable.IDField: IioDBCreatorField;
var
  AField: IioDBCreatorField;
begin
  Result := nil;
  for AField in Self.Fields.Values do
    if AField.IsKeyField then
    begin
      Result := AField;
      Exit;
    end;
end;

function TioDBCreatorTable.IsClassFromField: Boolean;
begin
  Result := FIsClassFromField;
end;

procedure TioDBCreatorTable.SetTableName(AValue: String);
begin
  FTableName := AValue;
end;

function TioDBCreatorTable.TableState: TioDBCreatorTableState;
var
  AField: IioDBCreatorField;
begin
  Result := tsOk;
  // Check if tsNewTable
  if not FSqlGenerator.TableExists(Self) then
  begin
    Result := tsNew;
    Exit;
  end;
  // Check if tsModified
  for AField in Fields.Values do
  begin
    FSqlGenerator.LoadFieldsState(Self);
    if (not AField.DBFieldExist) or (not AField.DBFieldSameType) then
    begin
      Result := tsModified;
      Exit;
    end;
  end;
end;

{ TioDBCreator }

procedure TioDBCreator.AutoCreateDatabase(const AAutoCreateIndexesByAttributes:Boolean=True; const AAutoCreateIndexesByRelations:Boolean=True);
var
  ATable: IioDBCreatorTable;
begin
  // Build DB structure analizing Rtti informations
  Self.LoadDBStructure;
  // Create or restructure database
  FSqlGenerator.AutoCreateDatabase(Self);
  // Create indexes
  if AAutoCreateIndexesByAttributes then
    Self.CreateIndexByAttributes;
  if AAutoCreateIndexesByRelations then
    Self.CreateIndexByRelations;
end;

constructor TioDBCreator.Create(ASqlGenerator:IioDBCreatorSqlGenerator);
begin
  inherited Create;
  FSqlGenerator := ASqlGenerator;
  FTables := TioDBCreatorTableList.Create;
end;

procedure TioDBCreator.CreateIndexByAttributes;
var
  LTable: IioDBCreatorTable;
  LioIndex: ioIndex;
begin
  // Loop for all tables
  for LTable in FTables.Values do
    // Loop for all indexes
    for LioIndex in LTable.IndexList do
      io.RefTo(LTable.GetMap.GetClassName).CreateIndex(
      LioIndex.IndexName,
      LioIndex.CommaSepFieldList,
      LioIndex.IndexOrientation,
      LioIndex.Unique
      );
end;

procedure TioDBCreator.CreateIndexByRelations;
var
  LTable: IioDBCreatorTable;
  LProp: IioContextProperty;
    // Nested
    procedure NestedCreateIndexByRelation;
    var
      LResolvedTypeList: IioResolvedTypeList;
      LResolvedTypeName: String;
      LMap: IioMap;
      LChildProp: IioContextProperty;
    begin
      // Resolve the type and alias
      LResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(LProp.GetRelationChildTypeName, LProp.GetRelationChildTypeAlias, rmAll);
      // Loop for all classes in the sesolved type list
      for LResolvedTypeName in LResolvedTypeList do
      begin
        // Get the map for the current ResolverTypeName
        LMap := TioMapContainer.GetMap(LResolvedTypeName);
        // get the child property
        LChildProp := LMap.GetProperties.GetPropertyByName(LProp.GetRelationChildPropertyName);
        // Create the index
        io.RefTo(LResolvedTypeName).CreateIndex(LChildProp.GetSqlFieldName);
      end;
    end;
begin
  // Loop for all tables
  for LTable in FTables.Values do
    // Loop for all properties of the ccurrent class/table
    for LProp in LTable.GetMap.GetProperties do
      // If the current property is a relation property (only HasMany or HasOne) then create
      //  the foreign key index
      if  (   (LProp.GetRelationType = iortHasMany) or (LProp.GetRelationType = iortHasOne)   )
      and LProp.GetRelationChildAutoIndex
      then
        NestedCreateIndexByRelation;
end;

procedure TioDBCreator.LoadDBStructure;
var
  AContextSlot: TioMapSlot;
begin
  // Loop for all entities (model classes) of the application
  //  and load the TableStructure
  for AContextSlot in TioMapContainer.GetContainer.Values
    do Self.LoadTableStructure(AContextSlot.GetMap);
end;

procedure TioDBCreator.LoadTableStructure(AMap: IioMap);
var
  AProperty: IioContextProperty;
  ATable: IioDBCreatorTable;
  AField: IioDBCreatorField;
  LIndex: ioIndex;
  ATableName: String;
  ARttiType: TRttiInstanceType;
begin
  ATableName := AMap.GetTable.TableName;
  // Find or Create Table
  ATable := Self.FindOrCreateTable(AMap.GetTable.TableName, AMap.GetTable.IsClassFromField, AMap);
  // Loop for properties
  for AProperty in AMap.GetProperties do
  begin
    // For creation purpose a HasMany or HasOne relation property
    //  must not create the field
    if (AProperty.GetRelationType = ioRTHasMany)
    or (AProperty.GetRelationType = ioRTHasOne)
      then Continue;
    // If not already exixts create and add it to the list
    if ATable.FieldExists(AProperty.GetSqlFieldName) then Continue;
    AField := TioDBCreatorFactory.GetField(AProperty.GetSqlFieldName
                                          ,(AProperty = AMap.GetProperties.GetIdProperty)
                                          ,AProperty
                                          ,FSqlGenerator
                                          ,False
                                          );
    ATable.Fields.Add(AField.FieldName, AField);
  end;
  // If ClassFromField is enabled then add the field
  // If not already exixts create and add it to the list
  if ATable.IsClassFromField and (not ATable.FieldExists(IO_CLASSFROMFIELD_FIELDNAME)) then
  begin
    AField := TioDBCreatorFactory.GetField(IO_CLASSFROMFIELD_FIELDNAME
                                          ,False
                                          ,nil
                                          ,FSqlGenerator
                                          ,True
                                          );
    ATable.Fields.Add(AField.FieldName, AField);
  end;
  // If some explicit index is present then add it to the list
  if AMap.GetTable.IndexListExists then
    for LIndex in AMap.GetTable.GetIndexList(False) do
      ATable.IndexList.Add(LIndex);
end;

function TioDBCreator.Tables: TioDBCreatorTableList;
begin
  Result := FTables;
end;

destructor TioDBCreator.Destroy;
begin
  FTables.Free;
  inherited;
end;

function TioDBCreator.FindOrCreateTable(const ATableName: String; const AIsClassFromField:Boolean; const AMap:IioMap): IioDBCreatorTable;
begin
  // If table is already present return it
  if Self.FTables.ContainsKey(ATableName) then
  begin
    Result := Self.FTables.Items[ATableName];
    Exit;
  end;
  // Otherwise create a new Table and add it to the list then return it
  Result := TioDBCreatorFactory.GetTable(ATableName, AIsClassFromField, FSqlGenerator, AMap);
  Self.FTables.Add(ATableName, Result);
end;

end.
