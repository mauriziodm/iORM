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


unit iORM.DB.DBBuilder.Engine;

interface

uses
  System.Classes,
  System.Generics.Collections,
  iORM.DB.DBBuilder.Interfaces,
  iORM.Context.Properties.Interfaces,
  iORM.Context.Container,
  iORM.Attributes,
  iORM.Context.Map.Interfaces,
  iORM.Context.Table.Interfaces;

type
  TioDBBuilderField = class(TInterfacedObject, IioDBBuilderField)
  strict private
    FFieldName: String;
    FIsKeyField: Boolean;
    FProperty: IioContextProperty;
    FSqlGenerator: IioDBBuilderSqlGenerator;
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
    constructor Create(AFieldName:String; AIsKeyField:Boolean; AProperty:IioContextProperty; ASqlGenerator:IioDBBuilderSqlGenerator; AIsClassFromField:Boolean);
    property FieldName:String read GetFieldName;
    property FieldType:String read GetFieldType;
    property IsKeyField:Boolean read GetIsKeyField;
    property DBFieldExist:Boolean read GetDBFieldExist write SetDBFieldExist;
    property DBFieldSameType:Boolean read GetDBFieldSameType write SetDBFieldSameType;
    // Rtti property reference
    function GetProperty: IioContextProperty;
  end;

  TioDBBuilderTable = class(TInterfacedObject, IioDBBuilderTable)
  strict private
    FTableName: String;
    FFields: TioDBBuilderFieldList;
    FIsClassFromField: Boolean;
    FSqlGenerator: IioDBBuilderSqlGenerator;
    FMap: IioMap;
    FIndexList: TioIndexList;
    // TableName
    function GetTableName: String;
    Procedure SetTableName(AValue:String);
    // Fields
    function GetFields: TioDBBuilderFieldList;
    // TableState
    //function TableState: TioDBBuilderTableState;
    // IsClassFromField
    function IsClassFromField: Boolean;
    procedure SetClassFromField(const AValue: Boolean);
    // IndexList
    function GetIndexList: TioIndexList;
  public
    constructor Create(const ATableName:String; const AIsClassFromField:Boolean; const ASqlGenerator:IioDBBuilderSqlGenerator; const AMap:IioMap);
    destructor Destroy; override;
    function FieldExists(AFieldName:String): Boolean;
    function IDField: IioDBBuilderField;
    function GetMap: IioMap;
    property TableName:String read GetTableName write SetTableName;
    property Fields:TioDBBuilderFieldList read GetFields;
    property IndexList:TioIndexList read GetIndexList;
  end;

  TioDBBuilder = class(TInterfacedObject, IioDBBuilder)
  strict private
    FTables: TioDBBuilderTableList;
    FSqlGenerator: IioDBBuilderSqlGenerator;
  strict protected
    function GetField(AFieldName:String; AIsKeyField:Boolean; AProperty:IioContextProperty; ASqlGenerator:IioDBBuilderSqlGenerator; AIsClassFromField:Boolean): IioDBBuilderField;
    function GetTable(const ATableName: String; const AIsClassFromField:Boolean; const ASqlGenerator:IioDBBuilderSqlGenerator; const AMap:IioMap): IioDBBuilderTable;
    function FindOrCreateTable(const ATableName:String; const AIsClassFromField:Boolean; const AMap:IioMap): IioDBBuilderTable;
    procedure LoadTableStructure(AMap: IioMap);
    procedure LoadDBStructure;
  public
    constructor Create;
    destructor Destroy; override;
    function GenerateDBScript(const ADbName: string): string;
  end;

implementation

uses
  System.SysUtils,
  iORM.DB.DBBuilder.Factory,
  iORM.DB.ConnectionContainer,
  iORM.Resolver.Factory,
  iORM.Resolver.ByDependencyInjection,
  iORM.Containers.List,
  iORM.Containers.Interfaces,
  iORM.Resolver.Interfaces,
  iORM.Context.Factory,
  iORM.Context.Interfaces, System.Rtti, iORM.CommonTypes;

{ TioDBBuilder }

constructor TioDBBuilder.Create;
begin
  FTables := TioDBBuilderTableList.Create;
end;

destructor TioDBBuilder.Destroy;
begin
  FTables.Free;
  inherited;
end;

function TioDBBuilder.FindOrCreateTable(const ATableName: String;
  const AIsClassFromField: Boolean; const AMap: IioMap): IioDBBuilderTable;
begin
  // If table is already present return it
  if FTables.ContainsKey(ATableName) then
  begin
    Result := FTables.Items[ATableName];
    Result.SetClassFromField(Result.IsClassFromField or AIsClassFromField);
    Exit;
  end;
  // Otherwise create a new Table and add it to the list then return it
  Result := Self.GetTable(ATableName, AIsClassFromField, FSqlGenerator, AMap);
  Self.FTables.Add(ATableName, Result);
end;

function TioDBBuilder.GenerateDBScript(const ADbName: string): string;
var
  LSb: TStringBuilder;
  LSqlGenerator: IioDBBuilderSqlGenerator;
  LDatabaseName: string;
  LPairTable: TPair<string,IioDBBuilderTable>;
  LPairField: TPair<string,IioDBBuilderField>;
  LTableName: string;
  //LContextProperty: IioContextProperty;
  LSourceTableName: string;
  LRel: TioRelationType;
  LChildTypeName: string;
  LChildTypeAlias: string;
  LChildPropertyName: string;
  LResolvedTypeList: IioList<string>;
  LResolvedTypeName: string;
  LChildContext: IioContext;
  LSourceFieldName: string;
  LDestinationTableName: string;
  LDestinationFieldName: string;
begin
  // Build DB structure analizing Model Rtti informations
  Self.LoadDBStructure;

  LSb := TStringBuilder.Create;

  try
    LSqlGenerator := TioDBBuilderFactory.NewSqlGenerator;
    LDatabaseName := ADbName;

    // Verification of Database Existence
    if not LSqlGenerator.DatabaseExists(LDatabaseName) then
    begin
      LSb.AppendLine(LSqlGenerator.CreateDatabase(LDatabaseName));
    end;

    // Move into Current Database
    LSb.AppendLine();
    LSb.AppendLine(LSqlGenerator.UseDatabase(LDatabaseName));

    // Loop for all entities (model classes) of the application
    for LPairTable in FTables do
    begin
      LTableName := LPairTable.Value.TableName;

      // Check Table Existence
      if not LSqlGenerator.TableExists(LDatabaseName, LTableName) then
      begin
        LSb.AppendLine();
        LSb.AppendLine(LSqlGenerator.BeginCreateTable(LTableName));

        //for LContextProperty in LPair.Value.GetMap.GetProperties do
        //  LSb.AppendLine(LSqlGenerator.CreateField(LContextProperty));

        for LPairField in LPairTable.Value.Fields do
        begin
          LSb.AppendLine(LSqlGenerator.CreateField(LPairField.Value.GetProperty));
        end;

        if LPairTable.Value.IsClassFromField then
          LSb.AppendLine(LSqlGenerator.CreateClassInfoField);


        LSb.AppendLine(LSqlGenerator.EndCreateTable);

        // Generate Primary Key
        LSb.AppendLine(LSqlGenerator.AddPrimaryKey(LTableName, LPairTable.Value.IDField.GetProperty));
      end
      else
      begin

//        for LContextProperty in LPairTable.Value.GetMap.GetProperties do
//        begin
        for LPairField in LPairTable.Value.Fields do
        begin
          if not LSqlGenerator.FieldExists(LDatabaseName, LPairTable.Value.TableName, LPairField.Value.GetProperty.GetName) then
          begin
            LSb.AppendLine();
            LSb.AppendLine(LSqlGenerator.BeginAlterTable(LTableName));
            LSb.AppendLine(LSqlGenerator.AddField(LPairField.Value.GetProperty));
            LSb.AppendLine(LSqlGenerator.EndAlterTable);
          end
          else
          begin
            if LSqlGenerator.FieldModified(LDatabaseName, LPairTable.Value.TableName, LPairField.Value.GetProperty) then
            begin
              LSb.AppendLine();
              LSb.AppendLine(LSqlGenerator.BeginAlterTable(LTableName));
              LSb.AppendLine(LSqlGenerator.AlterField(LPairField.Value.GetProperty));
              LSb.AppendLine(LSqlGenerator.EndAlterTable);
            end;
          end;
        end;
      end;
    end;

    // Add Foreign Key After Generated All Table
    for LPairTable in FTables do
    begin
      LSourceTableName := LPairTable.Value.TableName;

      for LPairField in LPairTable.Value.Fields do
      begin
        LRel := LPairField.Value.GetProperty.GetRelationType;

        if LRel = ioRTNone then
          Continue;

        if LRel in [ioRTHasOne, ioRTHasMany, ioRTBelongsTo] then
        begin
          LChildTypeName:=LPairField.Value.GetProperty.GetRelationChildTypeName;
          LChildTypeAlias:=LPairField.Value.GetProperty.GetRelationChildTypeAlias;
          LChildPropertyName:=LPairField.Value.GetProperty.GetRelationChildPropertyName;
          // Resolve the type and alias
          LResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(LChildTypeName, LChildTypeAlias, rmAll);
          // Loop for all classes in the sesolved type list
          for LResolvedTypeName in LResolvedTypeList do
          begin
            // Get the Context for the current ResolverTypeName (Child)
            LChildContext := TioContextFactory.Context(LResolvedTypeName);

            LSourceFieldName := LPairField.Value.GetProperty.GetName;
            LDestinationTableName := LChildContext.GetTable.TableName;

            // Search MasterTable ID Property
            if LRel in [ioRTBelongsTo] then
              LDestinationFieldName := LChildContext.GetProperties.GetIDProperty.GetName
            else
              LDestinationFieldName := LChildContext.GetProperties.GetPropertyByName(LChildPropertyName).GetName;

            LSb.AppendLine();
            LSb.AppendLine(LSqlGenerator.AddForeignKey(LSourceTableName, LSourceFieldName, LDestinationTableName, LDestinationFieldName));
          end;
        end;
      end;
    end;

    Result := LSb.ToString;

  finally
    LSb.Free;
  end;
end;

function TioDBBuilder.GetField(AFieldName: String; AIsKeyField: Boolean;
  AProperty: IioContextProperty; ASqlGenerator: IioDBBuilderSqlGenerator;
  AIsClassFromField: Boolean): IioDBBuilderField;
begin
  Result := TioDBBuilderField.Create(AFieldName, AIsKeyField, AProperty, ASqlGenerator, AIsClassFromField);
end;

function TioDBBuilder.GetTable(const ATableName: String;
  const AIsClassFromField: Boolean;
  const ASqlGenerator: IioDBBuilderSqlGenerator;
  const AMap: IioMap): IioDBBuilderTable;
begin
  Result := TioDBBuilderTable.Create(ATableName, AIsClassFromField, ASqlGenerator, AMap);
end;

procedure TioDBBuilder.LoadDBStructure;
var
  AContextSlot: TioMapSlot;
begin
  // Loop for all entities (model classes) of the application
  //  and load the TableStructure
  for AContextSlot in TioMapContainer.GetContainer.Values
    do Self.LoadTableStructure(AContextSlot.GetMap);
end;

procedure TioDBBuilder.LoadTableStructure(AMap: IioMap);
var
  AProperty: IioContextProperty;
  ATable: IioDBBuilderTable;
  AField: IioDBBuilderField;
  LIndex: ioIndex;
  ATableName: String;
  ARttiType: TRttiInstanceType;
begin
  // If the current table is not to be considered for the AutoCreateDatabase...
  if not AMap.GetTable.GetAutoCreateDB then
    Exit;
  // get the table name
  ATableName := AMap.GetTable.TableName;
  // Find or Create Table
  ATable := Self.FindOrCreateTable(AMap.GetTable.TableName, AMap.GetTable.IsClassFromField, AMap);
  // Loop for properties
  for AProperty in AMap.GetProperties do
  begin
    // For creation purpose a HasMany or HasOne relation property
    //  must not create the field
    if AProperty.IsSkipped
    or (AProperty.GetRelationType = ioRTHasMany)
    or (AProperty.GetRelationType = ioRTHasOne)
      then Continue;
    // If not already exixts create and add it to the list
    if ATable.FieldExists(AProperty.GetSqlFieldName) then Continue;
    AField := Self.GetField(AProperty.GetSqlFieldName
                                          ,(AProperty = AMap.GetProperties.GetIdProperty)
                                          ,AProperty
                                          ,FSqlGenerator
                                          ,False
                                          );
    ATable.Fields.Add(AField.FieldName, AField);
  end;
  // If ClassFromField is enabled then add the field
  // If not already exixts create and add it to the list
//  if ATable.IsClassFromField and (not ATable.FieldExists(IO_CLASSFROMFIELD_FIELDNAME)) then
//  begin
//    AField := Self.GetField(IO_CLASSFROMFIELD_FIELDNAME
//                                          ,False
//                                          ,nil
//                                          ,FSqlGenerator
//                                          ,True
//                                          );
//    ATable.Fields.Add(AField.FieldName, AField);
//    ATable.IsClassForm
//  end;
  // If some explicit index is present then add it to the list
  if AMap.GetTable.IndexListExists then
    for LIndex in AMap.GetTable.GetIndexList(False) do
      ATable.IndexList.Add(LIndex);
end;

{ TioDBBuilderField }

constructor TioDBBuilderField.Create(AFieldName: String; AIsKeyField: Boolean; AProperty:IioContextProperty; ASqlGenerator:IioDBBuilderSqlGenerator; AIsClassFromField:Boolean);
begin
  FSqlGenerator := ASqlGenerator;
  FFieldName := AFieldName;
  FIsKeyField := AIsKeyField;
  FProperty := AProperty;
  FDBFieldExist := False;
  FDBFieldSameType := False;
  FIsClassFromField := AIsClassFromField;
end;

function TioDBBuilderField.GetDBFieldExist: Boolean;
begin
  Result := FDBFieldExist;
end;

function TioDBBuilderField.GetDBFieldSameType: Boolean;
begin
  Result := FDBFieldSameType;
end;

function TioDBBuilderField.GetFieldName: String;
begin
  Result := FFieldName;
end;

function TioDBBuilderField.GetFieldType: String;
begin
  // TODO: Completare QUI
//  if Self.IsClassFromField
//    then Result := TioDBCreatorFactory.GetSqlGenerator.GetClassFromFieldColumnType
//    else Result := FProperty.GetFieldType;
  //
end;

function TioDBBuilderField.GetIsClassFromField: Boolean;
begin
  Result := FIsClassFromField;
end;

function TioDBBuilderField.GetIsKeyField: Boolean;
begin
  Result := FIsKeyField;
end;

function TioDBBuilderField.GetProperty: IioContextProperty;
begin
  Result := FProperty;
end;

procedure TioDBBuilderField.SetDBFieldExist(AValue: Boolean);
begin
  FDBFieldExist := AValue;
end;

procedure TioDBBuilderField.SetDBFieldSameType(AValue: Boolean);
begin
  FDBFieldSameType := AValue;
end;

{ TioDBBuilderTable }

constructor TioDBBuilderTable.Create(const ATableName: String; const AIsClassFromField:Boolean; const ASqlGenerator:IioDBBuilderSqlGenerator; const AMap:IioMap);
begin
  FSqlGenerator := ASqlGenerator;
  FTableName := ATableName;
  FIsClassFromField := AIsClassFromField;
  FFields := TioDBBuilderFieldList.Create;
  FMap := AMap;
  FIndexList := TioIndexList.Create(False);
end;

destructor TioDBBuilderTable.Destroy;
begin
  FFields.Free;
  FIndexList.Free;
  inherited;
end;

function TioDBBuilderTable.FieldExists(AFieldName: String): Boolean;
begin
  Result := FFields.ContainsKey(AFieldName);
end;

function TioDBBuilderTable.GetFields: TioDBBuilderFieldList;
begin
  Result := FFields;
end;

function TioDBBuilderTable.GetIndexList: TioIndexList;
begin
  Result := FIndexList;
end;

function TioDBBuilderTable.GetMap: IioMap;
begin
  Result := FMap;
end;

function TioDBBuilderTable.GetTableName: String;
begin
  Result := FTableName;
end;

function TioDBBuilderTable.IDField: IioDBBuilderField;
var
  AField: IioDBBuilderField;
begin
  Result := nil;
  for AField in Self.Fields.Values do
    if AField.IsKeyField then
    begin
      Result := AField;
      Exit;
    end;
end;

function TioDBBuilderTable.IsClassFromField: Boolean;
begin
  Result := FIsClassFromField;
end;

procedure TioDBBuilderTable.SetTableName(AValue: String);
begin
  FTableName := AValue;
end;

procedure TioDBBuilderTable.SetClassFromField(const AValue: Boolean);
begin
  FIsClassFromField := AValue;
end;


//function TioDBBuilderTable.TableState: TioDBBuilderTableState;
//var
//  AField: IioDBBuilderField;
//begin
//  Result := tsOk;
//  // Check if tsNewTable
//  if not FSqlGenerator.TableExists(Self) then
//  begin
//    Result := tsNew;
//    Exit;
//  end;
//  // Check if tsModified
//  for AField in Fields.Values do
//  begin
//    FSqlGenerator.LoadFieldsState(Self);
//    if (not AField.DBFieldExist) or (not AField.DBFieldSameType) then
//    begin
//      Result := tsModified;
//      Exit;
//    end;
//  end;
//end;



end.



