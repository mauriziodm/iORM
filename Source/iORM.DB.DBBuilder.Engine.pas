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
  TioDBBuilderFKDefinition = class(TInterfacedObject, IioDBBuilderFKDefinition)
  private
    FSourceTableName: string;
    FSourceFieldName: string;
    FDestinationTableName: string;
    FDestinationFieldName: string;
    FRelationType: TioRelationType;
    function GetDestinationFieldName: string;
    function GetDestinationTableName: string;
    function GetSourceFieldName: string;
    function GetSourceTableName: string;
    function GetRelationType: TioRelationType;
  public
    constructor Create(ASourceTableName: string; ASourceFieldName: string; ADestinationTableName: string; ADestinationFieldName: string; ARelationType: TioRelationType);
    property SourceTableName: string read GetSourceTableName;
    property SourceFieldName: string read GetSourceFieldName;
    property DestinationTableName: string read GetDestinationTableName;
    property DestinationFieldName: string read GetDestinationFieldName;
    property RelationType: TioRelationType read GetRelationType;
  end;

  TioDBBuilderField = class(TInterfacedObject, IioDBBuilderField)
  strict private
    FFieldName: String;
    FIsKeyField: Boolean;
    FIsSqlField: Boolean;
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
    // IsKeyField
    function GetIsKeyField: Boolean;
    // IsKeyField
    function GetIsSqlField: Boolean;
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
    constructor Create(AFieldName:String; AIsKeyField:Boolean; AProperty:IioContextProperty; ASqlGenerator:IioDBBuilderSqlGenerator; AIsClassFromField:Boolean; AIsSqlField: Boolean);
    property FieldName:String read GetFieldName;
    property FieldType:String read GetFieldType;
    property IsKeyField:Boolean read GetIsKeyField;
    property IsSqlField:Boolean read GetIsSqlField;
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
    FForeignKeyList: TioDBBuilderFKList;
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
    // FK List
    function GetForeignKeyList: TioDBBuilderFKList;
  public
    constructor Create(const ATableName:String; const AIsClassFromField:Boolean; const ASqlGenerator:IioDBBuilderSqlGenerator; const AMap:IioMap);
    destructor Destroy; override;
    function FieldExists(AFieldName:String): Boolean;
    function IDField: IioDBBuilderField;
    function GetMap: IioMap;
    property TableName:String read GetTableName write SetTableName;
    property Fields:TioDBBuilderFieldList read GetFields;
    property IndexList:TioIndexList read GetIndexList;
    property ForeignKeyList:TioDBBuilderFKList read GetForeignKeyList;
  end;

  TioDBBuilder = class(TInterfacedObject, IioDBBuilder)
  strict private
    FTables: TioDBBuilderTableList;
    FSqlGenerator: IioDBBuilderSqlGenerator;
    FCreateScriptOnly: Boolean;
    FCreateIndexes: Boolean;
    FCreateReferentialIntegrityConstraints: Boolean;
    function GetSourceTable(ATableName: String): IioDBBuilderTable;
    function RemoveLastComma(const AValue: string): string;
    function GetField(AFieldName:String; AIsKeyField:Boolean; AProperty:IioContextProperty; ASqlGenerator:IioDBBuilderSqlGenerator; AIsClassFromField:Boolean; AIsSqlField:Boolean): IioDBBuilderField;
    function GetTable(const ATableName: String; const AIsClassFromField:Boolean; const ASqlGenerator:IioDBBuilderSqlGenerator; const AMap:IioMap): IioDBBuilderTable;
    function FindOrCreateTable(const ATableName:String; const AIsClassFromField:Boolean; const AMap:IioMap): IioDBBuilderTable;
    procedure LoadTableStructure(AMap: IioMap);
    procedure LoadDBStructure;
    procedure LoadFKStructure(AMap: IioMap);
    procedure SetCreateIndexes(const Value: Boolean);
    procedure SetCreateReferentialIntegrityConstraints(const Value: Boolean);
    procedure SetCreateScriptOnly(const Value: Boolean);
    function GetCreateIndexes: Boolean;
    function GetCreateReferentialIntegrityConstraints: Boolean;
    function GetCreateScriptOnly: Boolean;
  public
    constructor Create;
    destructor Destroy; override;
    function GenerateDB(out OOutputScript: String; out OErrorMessage: String): Boolean;
    property CreateScriptOnly: Boolean read GetCreateScriptOnly write SetCreateScriptOnly;
    property CreateReferentialIntegrityConstraints: Boolean read GetCreateReferentialIntegrityConstraints write SetCreateReferentialIntegrityConstraints;
    property CreateIndexes: Boolean read GetCreateIndexes write SetCreateIndexes;
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
  iORM.Context.Interfaces, System.Rtti, iORM.CommonTypes, iORM.DB.Factory;

{ TioDBBuilder }

constructor TioDBBuilder.Create;
begin
  FTables := TioDBBuilderTableList.Create;
  FCreateScriptOnly := False;
  FCreateIndexes := True;
  FCreateReferentialIntegrityConstraints := True;
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

function TioDBBuilder.GenerateDB(out OOutputScript: String; out OErrorMessage: String): Boolean;
var
  LSb: TStringBuilder;
  LSqlGenerator: IioDBBuilderSqlGenerator;
  LDatabaseName: string;
  LPairTable: TPair<string,IioDBBuilderTable>;
  LPairField: TPair<string,IioDBBuilderField>;
  LTableName: string;
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
  LIndex: ioIndex;
  LContext: IioContext;
  LDbExists: Boolean;
  LWarnings: Boolean;
  LRemark: string;
  LAddIndexSql: string;
  LAddFKSql: string;
  LAddPrimaryKeySql: string;
  LDropAllForeignKeySql: string;
  LDropAllIndexSql: string;
  LAlterTableSql: string;
  LCreateTableSql: string;
  LFkInCreateSql: string;
  LAddGeneratorsSql: string;
begin
  try
    // Build DB structure analizing Model Rtti informations
    Self.LoadDBStructure;

    LSb := TStringBuilder.Create;

    try
      LSqlGenerator := TioDBBuilderFactory.NewSqlGenerator;
      LDatabaseName := TioDBFactory.ConnectionManager.GetConnectionDefByName(TioDBFactory.ConnectionManager.GetDefaultConnectionName).Params.Database;

      // Verification of Database Existence
      LDbExists := LSqlGenerator.DatabaseExists(LDatabaseName);

      if not LDbExists then
      begin
        LSqlGenerator.CreateDatabase(LDatabaseName);
      end;

      // Move into Current Database
      if FCreateScriptOnly then
      begin
        LSb.AppendLine();
        LSb.AppendLine(LSqlGenerator.UseDatabase(LDatabaseName));
      end;

      if LDbExists then
      begin
        LSb.AppendLine();

        if FCreateReferentialIntegrityConstraints then
        begin
          // Generate Sql x Drop All FK
          LDropAllForeignKeySql := LSqlGenerator.DropAllForeignKey(FTables);

          if not LDropAllForeignKeySql.IsEmpty then
            LSb.AppendLine(LDropAllForeignKeySql);

          // Drop all FK
          if not FCreateScriptOnly then
            LSqlGenerator.ExecuteSql(LDropAllForeignKeySql, True);
        end;

        if FCreateIndexes then
        begin
          // Generate Sql x Drop All Index
          LDropAllIndexSql := LSqlGenerator.DropAllIndex;

          if not LDropAllIndexSql.IsEmpty then
            LSb.AppendLine(LDropAllIndexSql);

          // Drop all Index
          if not FCreateScriptOnly then
            LSqlGenerator.ExecuteSql(LDropAllIndexSql, True);
        end;
      end;

      // Loop for all entities (model classes) of the application
      for LPairTable in FTables do
      begin
        LTableName := LPairTable.Value.TableName;

        // Check Table Existence
        if (not LDbExists) or (not LSqlGenerator.TableExists(LDatabaseName, LTableName)) then
        begin
          LSb.AppendLine();

          // Generate Sql x Create Table
          LCreateTableSql := LSqlGenerator.BeginCreateTable(LTableName);

          // Generate Sql x Fields
          for LPairField in LPairTable.Value.Fields do
          begin
            if LPairField.Value.IsSqlField then
              LCreateTableSql := LCreateTableSql + LSqlGenerator.CreateField(LPairField.Value.GetProperty);
          end;

          // Generate Sql x ClassInfo
          if LPairTable.Value.IsClassFromField then
            LCreateTableSql := LCreateTableSql + LSqlGenerator.CreateClassInfoField(LPairTable.Value);

          if FCreateReferentialIntegrityConstraints then
          begin
            // Generate Foreign Key in CREATE STATEMENT (use this feature only in the databases that provide it)
            // Otherwise implements AddForeignKey methods
            LFkInCreateSql := LSqlGenerator.AddForeignKeyInCreate(LPairTable.Value);

            // Remove Last Comma
            if LFkInCreateSql.IsEmpty then
              LCreateTableSql := RemoveLastComma(LCreateTableSql)
            else
              LCreateTableSql := LCreateTableSql + LFkInCreateSql;
          end;

          // Generate Sql x End Create Table
          LCreateTableSql := LCreateTableSql + LSqlGenerator.EndCreateTable;
          LSb.AppendLine(LCreateTableSql);

          // Create Table
          if not FCreateScriptOnly then
            LSqlGenerator.ExecuteSql(LCreateTableSql);

          // Generate Sql x Primary Key
          LAddPrimaryKeySql := LSqlGenerator.AddPrimaryKey(LTableName, LPairTable.Value.IDField.GetProperty);
          LSb.AppendLine(LAddPrimaryKeySql);

          // Create Primary Key
          if not FCreateScriptOnly then
            LSqlGenerator.ExecuteSql(LAddPrimaryKeySql);

          // Generate Sql x SEQUENCE/GENERATORS
          // TODO: Le sequenze vengono create solo se non esiste la tabella
          // successivamente si potrebbe pensare di eseguire sempre questo
          // pezzo di codice andando a verificare i metadati per capire
          // se la sequenza esiste o meno e crearla solo se non esiste
          for LPairField in LPairTable.Value.Fields do
          begin
            if LPairField.Value.IsKeyField  then
            begin
              LAddGeneratorsSql := LSqlGenerator.AddSequences(LTableName, LPairTable.Value.IDField.GetProperty);
              LSb.AppendLine(LAddGeneratorsSql);

              // Create Primary Key
              if not FCreateScriptOnly then
                LSqlGenerator.ExecuteSql(LAddGeneratorsSql);
            end;
          end;
        end
        else
        begin
          for LPairField in LPairTable.Value.Fields do
          begin
            if LPairField.Value.IsSqlField then
            begin
              if not LSqlGenerator.FieldExists(LDatabaseName, LPairTable.Value.TableName, LPairField.Value.GetProperty.GetName) then
              begin
                // Generate Sql x Alter Table
                LAlterTableSql := LSqlGenerator.BeginAlterTable('', LTableName)+' ';
                LAlterTableSql := LAlterTableSql + LSqlGenerator.AddField(LPairField.Value.GetProperty)+' ';
                LAlterTableSql := LAlterTableSql + LSqlGenerator.EndAlterTable(LPairField.Value.GetProperty.IsID);

                if not LAlterTableSql.IsEmpty then
                  LSb.AppendLine(LAlterTableSql);

                // Execute Alter Table
                if not FCreateScriptOnly then
                  LSqlGenerator.ExecuteSql(LAlterTableSql);
              end
              else
              begin
                LWarnings := False;

                if LSqlGenerator.FieldModified(LDatabaseName, LPairTable.Value.TableName, LPairField.Value.GetProperty, LWarnings) then
                begin
                  LRemark := LSqlGenerator.GetRemark(LWarnings);

                  // Generate Sql x Alter Table
                  LAlterTableSql := LSqlGenerator.BeginAlterTable(LRemark, LTableName)+' ';
                  LAlterTableSql := LAlterTableSql + LSqlGenerator.AlterField(LPairField.Value.GetProperty)+' ';
                  LAlterTableSql := LAlterTableSql + LSqlGenerator.EndAlterTable(LPairField.Value.GetProperty.IsID);

                  if not LAlterTableSql.IsEmpty then
                    LSb.AppendLine(LAlterTableSql);

                  // Execute Alter Table
                  if not FCreateScriptOnly and not LWarnings then
                    LSqlGenerator.ExecuteSql(LAlterTableSql);
                end;
              end;
            end;
          end;
        end;
      end;

      if CreateIndexes then
      begin
        // Add Indexes After Generated All Tables
        for LPairTable in FTables do
        begin
          for LIndex in LPairTable.Value.IndexList do
          begin
            LContext := TioContextFactory.Context(LPairTable.Value.GetMap.GetClassName);

            LSb.AppendLine();

            // Generate Sql x Index
            LAddIndexSql := LSqlGenerator.AddIndex(LContext, LIndex.IndexName, LIndex.CommaSepFieldList, LIndex.IndexOrientation, LIndex.Unique);

            if not LAddIndexSql.isEmpty then
              LSb.AppendLine(LAddIndexSql);

            // Create Index
            if not FCreateScriptOnly then
              LSqlGenerator.ExecuteSql(LAddIndexSql);

          end;
        end;
      end;

      if CreateReferentialIntegrityConstraints then
      begin
        // Add Foreign Key After Generated All Tables
        for LPairTable in FTables do
        begin
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

                // Search MasterTable ID Property
                if LRel in [ioRTBelongsTo] then
                begin
                  LSourceTableName := LPairTable.Value.TableName;
                  LSourceFieldName := LPairField.Value.GetProperty.GetName;
                  LDestinationTableName := LChildContext.GetTable.TableName;
                  LDestinationFieldName := LChildContext.GetProperties.GetIDProperty.GetName;
                end
                else
                begin
                  LSourceTableName := LChildContext.GetTable.TableName;
                  LSourceFieldName := LChildContext.GetProperties.GetPropertyByName(LChildPropertyName).GetSqlFieldName(True);
                  LDestinationTableName := LPairTable.Value.TableName;
                  LDestinationFieldName := LChildContext.GetProperties.GetIdProperty.GetName;
                end;

                LSb.AppendLine();

                // Create Sql x FK
                LAddFKSql := LSqlGenerator.AddForeignKey(LSourceTableName, LSourceFieldName, LDestinationTableName, LDestinationFieldName);

                if not LAddFKSql.IsEmpty then
                  LSb.AppendLine(LAddFKSql);

                // Create FK
                if not FCreateScriptOnly then
                  LSqlGenerator.ExecuteSql(LAddFKSql);

              end;
            end;
          end;
        end;
      end;

      Result := True;
      OErrorMessage := '';

    finally
      OOutputScript := LSb.ToString;
      LSb.Free;
    end;

  except
    on E: Exception do
    begin
      Result := False;
      OErrorMessage := E.Message;
//      OOutputScript := '';
    end;
  end;
end;

function TioDBBuilder.GetCreateIndexes: Boolean;
begin
  Result := FCreateIndexes;
end;

function TioDBBuilder.GetCreateReferentialIntegrityConstraints: Boolean;
begin
  Result := FCreateReferentialIntegrityConstraints;
end;

function TioDBBuilder.GetCreateScriptOnly: Boolean;
begin
  Result := FCreateScriptOnly;
end;

function TioDBBuilder.GetField(AFieldName:String; AIsKeyField:Boolean; AProperty:IioContextProperty; ASqlGenerator:IioDBBuilderSqlGenerator; AIsClassFromField:Boolean; AIsSqlField:Boolean): IioDBBuilderField;
begin
  Result := TioDBBuilderField.Create(AFieldName, AIsKeyField, AProperty, ASqlGenerator, AIsClassFromField, AIsSqlField);
end;

function TioDBBuilder.GetSourceTable(ATableName: String): IioDBBuilderTable;
begin
  Result := nil;
  // If table is already present return it
  if FTables.ContainsKey(ATableName) then
  begin
    Result := FTables.Items[ATableName];
  end;
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
  for AContextSlot in TioMapContainer.GetContainer.Values do
  begin
    Self.LoadTableStructure(AContextSlot.GetMap);
  end;

  for AContextSlot in TioMapContainer.GetContainer.Values do
  begin
    Self.LoadFKStructure(AContextSlot.GetMap);
  end;
end;

procedure TioDBBuilder.LoadFKStructure(AMap: IioMap);
var
  LPairTable: TPair<string,IioDBBuilderTable>;
  LChildTypeName: string;
  LChildTypeAlias: string;
  LChildPropertyName: string;
  LResolvedTypeList: IioList<string>;
  LResolvedTypeName: string;
  LChildContext: IioContext;
  LSourceTableName: string;
  LSourceFieldName: string;
  LDestinationTableName: string;
  LDestinationFieldName: string;
  LRel: TioRelationType;
  LFkName: string;
  LProperty: IioContextProperty;
  LSourceTable: IioDBBuilderTable;
begin
  for LPairTable in FTables do
  begin
    // Loop for properties
    for LProperty in LPairTable.Value.GetMap.GetProperties do
    begin
      LRel := LProperty.GetRelationType;

      if LRel = ioRTNone then
        Continue;

      // Add relation to list
      LChildTypeName:=LProperty.GetRelationChildTypeName;
      LChildTypeAlias:=LProperty.GetRelationChildTypeAlias;
      LChildPropertyName:=LProperty.GetRelationChildPropertyName;
      // Resolve the type and alias
      LResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(LChildTypeName, LChildTypeAlias, rmAll);
      // Loop for all classes in the sesolved type list
      for LResolvedTypeName in LResolvedTypeList do
      begin
        // Get the Context for the current ResolverTypeName (Child)
        LChildContext := TioContextFactory.Context(LResolvedTypeName);

        // Search MasterTable ID Property
        if LRel in [ioRTBelongsTo] then
        begin
          LSourceTableName := LPairTable.Value.TableName;
          LSourceFieldName := LProperty.GetName;
          LDestinationTableName := LChildContext.GetTable.TableName;
          LDestinationFieldName := LChildContext.GetProperties.GetIDProperty.GetName;
        end
        else
        begin
          LSourceTableName := LChildContext.GetTable.TableName;
          LSourceFieldName := LChildContext.GetProperties.GetPropertyByName(LChildPropertyName).GetSqlFieldName(True);
          LDestinationTableName := LPairTable.Value.TableName;
          LDestinationFieldName := LChildContext.GetProperties.GetIdProperty.GetName;
        end;

        // Create FK and add it to foreign key dictionary
        LFkName := LSourceFieldName+'_'+LDestinationTableName;

        if LPairTable.Value.TableName=LDestinationTableName then
        begin
          LSourceTable := GetSourceTable(LChildContext.GetTable.TableName);

          if Assigned(LSourceTable) then
          begin
            if not LSourceTable.ForeignKeyList.ContainsKey(LFkName) then
              LSourceTable.ForeignKeyList.Add(LFkName, TioDBBuilderFKDefinition.Create(LSourceTableName, LSourceFieldName, LDestinationTableName, LDestinationFieldName, LRel));
          end;
        end
        else
        begin
          if not LPairTable.Value.ForeignKeyList.ContainsKey(LFkName) then
            LPairTable.Value.ForeignKeyList.Add(LFkName, TioDBBuilderFKDefinition.Create(LSourceTableName, LSourceFieldName, LDestinationTableName, LDestinationFieldName, LRel));
        end;

      end;
    end;
  end;
end;

procedure TioDBBuilder.LoadTableStructure(AMap: IioMap);
var
  AProperty: IioContextProperty;
  ATable: IioDBBuilderTable;
  AField: IioDBBuilderField;
  LIndex: ioIndex;
  ATableName: String;
  ARttiType: TRttiInstanceType;
  LIsSqlField: Boolean;
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
    // Used to discriminate the fields to be used in DDL statements
    LIsSqlField := True;

    // For creation purpose a HasMany or HasOne relation property
    //  must not create the field
    if AProperty.IsSkipped
    or (AProperty.GetRelationType = ioRTHasMany)
    or (AProperty.GetRelationType = ioRTHasOne)
      then LIsSqlField := False;

    // If not already exixts create and add it to the list
    if ATable.FieldExists(AProperty.GetSqlFieldName) then Continue;

    AField := Self.GetField(AProperty.GetSqlFieldName
                                          ,(AProperty = AMap.GetProperties.GetIdProperty)
                                          ,AProperty
                                          ,FSqlGenerator
                                          ,False
                                          ,LIsSqlField
                                          );
    ATable.Fields.Add(AField.FieldName, AField);
  end;
  // If some explicit index is present then add it to the list
  if AMap.GetTable.IndexListExists then
    for LIndex in AMap.GetTable.GetIndexList(False) do
    begin
      if ATable.IndexList.IndexOf(LIndex)=-1 then
        ATable.IndexList.Add(LIndex);
    end;
end;

function TioDBBuilder.RemoveLastComma(const AValue: string): string;
begin
  if AValue.EndsWith(',') then
    Result := AValue.Substring(0, AValue.Length-1);
end;

procedure TioDBBuilder.SetCreateIndexes(const Value: Boolean);
begin
  FCreateIndexes := Value;
end;

procedure TioDBBuilder.SetCreateReferentialIntegrityConstraints(
  const Value: Boolean);
begin
  FCreateReferentialIntegrityConstraints := Value;
end;

procedure TioDBBuilder.SetCreateScriptOnly(const Value: Boolean);
begin
  FCreateScriptOnly := Value;
end;

{ TioDBBuilderField }

constructor TioDBBuilderField.Create(AFieldName:String; AIsKeyField:Boolean; AProperty:IioContextProperty; ASqlGenerator:IioDBBuilderSqlGenerator; AIsClassFromField:Boolean; AIsSqlField: Boolean);
begin
  FSqlGenerator := ASqlGenerator;
  FFieldName := AFieldName;
  FIsKeyField := AIsKeyField;
  FIsSqlField := AIsSqlField;
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
end;

function TioDBBuilderField.GetIsClassFromField: Boolean;
begin
  Result := FIsClassFromField;
end;

function TioDBBuilderField.GetIsKeyField: Boolean;
begin
  Result := FIsKeyField;
end;

function TioDBBuilderField.GetIsSqlField: Boolean;
begin
  Result := FIsSqlField;
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
  FForeignKeyList := TioDBBuilderFKList.Create();
end;

destructor TioDBBuilderTable.Destroy;
begin
  FFields.Free;
  FIndexList.Free;
  FForeignKeyList.Free;
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

function TioDBBuilderTable.GetForeignKeyList: TioDBBuilderFKList;
begin
  Result := FForeignKeyList;
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



{ TioDBBuilderFKDefinition }

constructor TioDBBuilderFKDefinition.Create(ASourceTableName: string; ASourceFieldName: string; ADestinationTableName: string; ADestinationFieldName: string; ARelationType: TioRelationType);
begin
  FSourceTableName := ASourceTableName;
  FSourceFieldName := ASourceFieldName;
  FDestinationTableName := ADestinationTableName;
  FDestinationFieldName := ADestinationFieldName;
  FRelationType := ARelationType;
end;

function TioDBBuilderFKDefinition.GetDestinationFieldName: string;
begin
  Result := FDestinationFieldName;
end;

function TioDBBuilderFKDefinition.GetDestinationTableName: string;
begin
  Result := FDestinationTableName;
end;

function TioDBBuilderFKDefinition.GetRelationType: TioRelationType;
begin
  Result := FRelationType;
end;

function TioDBBuilderFKDefinition.GetSourceFieldName: string;
begin
  Result := FSourceFieldName;
end;

function TioDBBuilderFKDefinition.GetSourceTableName: string;
begin
  Result := FSourceTableName;
end;

end.



