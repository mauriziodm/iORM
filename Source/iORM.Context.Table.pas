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
unit iORM.Context.Table;

interface

uses
  iORM.Context.Interfaces,
  iORM.SqlItems, iORM.Context.Table.Interfaces, iORM.Attributes,
  iORM.CommonTypes, System.Generics.Collections, System.Rtti;

type

  TioTable = class;

  // Base class for all ContextTable companions
  TioBaseTableCompanion = class(TInterfacedObject)
  strict private
    FTable: TioTable; // This field is of class type to avoid circular reference with the table (memory leak prevention)
  strict protected
    function Table: TioTable;
  public
    procedure SetTable(const ATable: IioTable); virtual;
  end;

  // Classe che incapsula le informazioni per l'eventuale GroubBY
  // almeno la parte fissa eventualmente dichiarata con gli attributes
  // nella dichiarazione della classe (ci potrebbe poi essere in futuro
  // anche una GroupBy non fissa e impostabile tramite TioWhere come
  // se fosse una condizione prima del ToList o TObject, Qquest'ultima
  // GroupBy avrebbe la precedenza su qquella fissa se specificata)
  TioGroupBy = class(TioBaseTableCompanion, IioGroupBy)
  strict private
    FSqlText: String;
  public
    constructor Create(const ASqlText: String);
    function GetSql: String;
  end;

  // ===========================================================================
  // START: JOIN
  // ---------------------------------------------------------------------------
  // Classe che incapsula le informazioni per gli eventuali JOIN
  TioJoinItem = class(TInterfacedObject, IioJoinItem)
  strict private
    FJoinCondition: String;
    FJoinType: TioJoinType;
    FJoinClassRef: TioClassRef;
  public
    constructor Create(const AJoinType: TioJoinType; AJoinClassRef: TioClassRef; AJoinCondition: String = '');
    function GetSql(const AConnectionDefName: String): String;
    function GetJoinClassRef: TioClassRef;
    function GetJoinCondition: String;
    function GetJoinType: TioJoinType;
  end;

  TioJoinItemList = TList<IioJoinItem>;

  // Classe che incapsula una lista di JoinItems
  TioJoins = class(TioBaseTableCompanion, IioJoins)
  strict private
    FJoinList: TioJoinItemList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(AJoinItem: IioJoinItem);
    function GetSql: String;
  end;
  // ---------------------------------------------------------------------------
  // END: JOIN
  // ===========================================================================

  // Classe che incapsula le informazioni per la funzione TrueClass
  TioTrueClass = class(TioBaseTableCompanion, IioTrueClass)
  strict private
    FAncestors: String;
    FSqlFieldName: String;
    FMode: TioTrueClassMode;
    // Mode property
    procedure SetMode(const AValue: TioTrueClassMode);
    function GetMode: TioTrueClassMode;
  public
    constructor Create(const ATrueClassMode: TioTrueClassMode; const ASqlFieldName: String);
    procedure SetTable(const ATable: IioTable); override;
    function GetFieldName: string;
    function GetSqlFieldName: string;
    function GetSqlParamName: String;
    function GetValue: String;
    function GetSqlValue: string;
    function GetClassName: String; // NB: I metodi ci sono anche nella parte implementation (commentati)
    function GetQualifiedClassName: String; // NB: I metodi ci sono anche nella parte implementation (commentati)
    function QualifiedClassNameFromClassInfoFieldValue(const AValue: String): String;
    function ClassNameFromClassInfoFieldValue(const AValue: String): String;
    property Mode: TioTrueClassMode read GetMode write SetMode;
  end;

  // Classe che incapsula le info sulla tabella
  TioTable = class(TioSqlItem, IioTable)
  strict private
    FConnectionDefName_DoNotCallDirectly: String;
    FContainsSomeIioListProperty: Boolean;
    FEtmTimeSlotClass: TioEtmTimeSlotRef;
    FEtmTraceOnlyOnConnectionName: String;
    FEtmPropToPropList: TEtmPropToPropList;
    FGroupBy: IioGroupBy;
    FIndexList: TioIndexList;
    FJoins: IioJoins;
    FKeyGenerator: String;
    FMapMode: TioMapModeType;
    FRttiType: TRttiInstanceType;
    FTrueClass: IioTrueClass;
    // Conflict strategies
    FDeleteConflictStrategy: TClass; // TClass instead of TioCustomConflictStrategyRef to avoid circular reference
    FDeleteConflictStrategy_OnConflictSetStateAs: TioPersistenceConflictState;
    FInsertConflictStrategy: TClass; // TClass instead of TioCustomConflictStrategyRef to avoid circular reference
    FInsertConflictStrategy_OnConflictSetStateAs: TioPersistenceConflictState;
    FUpdateConflictStrategy: TClass; // TClass instead of TioCustomConflictStrategyRef to avoid circular reference
    FUpdateConflictStrategy_OnConflictSetStateAs: TioPersistenceConflictState;
    // EtmTimeSlotClass
    procedure SetEtmTimeSlotClass(const AEtmTimeSlotClass: TioEtmTimeSlotRef);
    function GetEtmTimeSlotClass: TioEtmTimeSlotRef;
    // EtmTraceOnlyOnConnectionName
    procedure SetEtmTraceOnlyOnConnectionName(const AConnectionName: String);
    function GetEtmTraceOnlyOnConnectionName: String;
  public
    constructor Create(const ASqlText, AKeyGenerator: String; const ATrueClass: IioTrueClass; const AJoins: IioJoins; const AGroupBy: IioGroupBy;
      const AConnectionDefName: String; const AMapMode: TioMapModeType; const ARttiType: TRttiInstanceType); reintroduce; overload;
    destructor Destroy; override;
    // This method create the TrueClassVirtualMap.Table object duplicating something of itself
    function DuplicateForTrueClassMap: IioTable;
    function GetClassName: String;
    function GetConnectionDefName: String;
    function GetGroupBy: IioGroupBy;
    function GetJoin: IioJoins;
    function GetKeyGenerator: String;
    function GetMapMode: TioMapModeType;
    function GetQualifiedClassName: String;
    function GetRttiType: TRttiInstanceType;
    function GetSql: String; override;
    function GetTrueClass: IioTrueClass;
    function IsForThisConnection(AConnectionDefNameToCheck: String): Boolean;
    function IsNotPersistedEntity: Boolean;
    function IsTrueClass: Boolean;
    function TableName: String;
    // Conflict strategies (TClass instead of TioCustomConflictStrategyRef to avoid circular reference)
    procedure SetDeleteConflictStrategy(const AConflictStrategy: TClass);
    procedure SetInsertConflictStrategy(const AConflictStrategy: TClass);
    procedure SetUpdateConflictStrategy(const AConflictStrategy: TClass);
    procedure SetDeleteConflictStrategy_OnConflictSetStateAs(const Value: TioPersistenceConflictState);
    procedure SetInsertConflictStrategy_OnConflictSetStateAs(const Value: TioPersistenceConflictState);
    procedure SetUpdateConflictStrategy_OnConflictSetStateAs(const Value: TioPersistenceConflictState);
    function GetDeleteConflictStrategy: TClass;
    function GetInsertConflictStrategy: TClass;
    function GetUpdateConflictStrategy: TClass;
    function GetDeleteConflictStrategy_OnConflictSetStateAs: TioPersistenceConflictState;
    function GetInsertConflictStrategy_OnConflictSetStateAs: TioPersistenceConflictState;
    function GetUpdateConflictStrategy_OnConflictSetStateAs: TioPersistenceConflictState;
    // IndexList
    function IndexListExists: Boolean;
    function GetIndexList(AAutoCreateIfUnassigned: Boolean): TioIndexList;
    procedure SetIndexList(AIndexList: TioIndexList);
    // ETM prop to prop list
    function EtmPropToPropListExists: Boolean;
    function GetEtmPropToPropList(AAutoCreateIfUnassigned: Boolean): TEtmPropToPropList;
    procedure SetEtmPropToPropList(AEtmPropToPropList: TEtmPropToPropList);
  end;

implementation

uses
  iORM.DB.Factory, System.SysUtils, iORM.Exceptions, iORM.SqlTranslator, System.StrUtils,
  iORM.ConflictStrategy.SameVersionWin;

{ TioContextTable }

constructor TioTable.Create(const ASqlText, AKeyGenerator: String; const ATrueClass: IioTrueClass; const AJoins: IioJoins; const AGroupBy: IioGroupBy;
      const AConnectionDefName: String; const AMapMode: TioMapModeType; const ARttiType: TRttiInstanceType);
begin
  inherited Create(ASqlText);
  FKeyGenerator := AKeyGenerator;
  FConnectionDefName_DoNotCallDirectly := AConnectionDefName;
  FMapMode := AMapMode;
  FRttiType := ARttiType;
  FIndexList := nil;
  FContainsSomeIioListProperty := False;
  // Set TrueClass
  FTrueClass := ATrueClass;
  if Assigned(FTrueClass) then
    FTrueClass.SetTable(Self);
  // Set Joins
  FJoins := AJoins;
  FJoins.SetTable(Self);
  // SetGroupBy
  FGroupBy := AGroupBy;
  if Assigned(FGroupBy) then
    FGroupBy.SetTable(Self);
  // Conflict strategies
  FDeleteConflictStrategy := TioSameVersionWin;
  FInsertConflictStrategy := TioSameVersionWin;
  FUpdateConflictStrategy := TioSameVersionWin;
  FDeleteConflictStrategy_OnConflictSetStateAs := csResolved;
  FInsertConflictStrategy_OnConflictSetStateAs := csResolved;
  FUpdateConflictStrategy_OnConflictSetStateAs := csResolved;
  // ETM
  FEtmTimeSlotClass := nil;
  FEtmTraceOnlyOnConnectionName := String.Empty;
  FEtmPropToPropList := nil;
end;

destructor TioTable.Destroy;
begin
  if Assigned(FIndexList) then
    FIndexList.Free;
  if Assigned(FEtmPropToPropList) then
    FEtmPropToPropList.Free;
  inherited;
end;

function TioTable.DuplicateForTrueClassMap: IioTable;
begin
  Result := TioTable.Create(FSqlText, FKeyGenerator, FTrueClass, FJoins, FGroupBy, FConnectionDefName_DoNotCallDirectly, FMapMode, FRttiType);
end;

function TioTable.GetEtmPropToPropList(AAutoCreateIfUnassigned: Boolean): TEtmPropToPropList;
begin
  if AAutoCreateIfUnassigned and not Assigned(FEtmPropToPropList) then
    FEtmPropToPropList := TEtmPropToPropList.Create;
  Result := FEtmPropToPropList;
end;

function TioTable.EtmPropToPropListExists: Boolean;
begin
  Result := Assigned(FEtmPropToPropList);
end;

function TioTable.IsNotPersistedEntity: Boolean;
begin
  Result := (FSqlText = NOT_PERSISTED_ENTITY_TABLE_NAME);
end;

function TioTable.GetTrueClass: IioTrueClass;
begin
  Result := FTrueClass;
end;

function TioTable.GetClassName: String;
begin
  Result := FRttiType.Name;
end;

function TioTable.GetDeleteConflictStrategy: TClass;
begin
  Result := FDeleteConflictStrategy;
end;

function TioTable.GetDeleteConflictStrategy_OnConflictSetStateAs: TioPersistenceConflictState;
begin
  Result := FDeleteConflictStrategy_OnConflictSetStateAs;
end;

function TioTable.GetUpdateConflictStrategy: TClass;
begin
  Result := FUpdateConflictStrategy;
end;

function TioTable.GetUpdateConflictStrategy_OnConflictSetStateAs: TioPersistenceConflictState;
begin
  Result := FUpdateConflictStrategy_OnConflictSetStateAs;
end;

function TioTable.GetConnectionDefName: String;
begin
  Result := TioDBFActory.ConnectionManager.GetCurrentConnectionNameIfEmpty(FConnectionDefName_DoNotCallDirectly);
end;

function TioTable.GetEtmTimeSlotClass: TioEtmTimeSlotRef;
begin
  Result := FEtmTimeSlotClass;
end;

function TioTable.GetEtmTraceOnlyOnConnectionName: String;
begin
  Result := FEtmTraceOnlyOnConnectionName;
end;

function TioTable.GetGroupBy: IioGroupBy;
begin
  Result := FGroupBy;
end;

function TioTable.GetIndexList(AAutoCreateIfUnassigned: Boolean): TioIndexList;
begin
  if AAutoCreateIfUnassigned and not Assigned(FIndexList) then
    FIndexList := TioIndexList.Create;
  Result := FIndexList;
end;

function TioTable.GetInsertConflictStrategy: TClass;
begin
  Result := FInsertConflictStrategy;
end;

function TioTable.GetInsertConflictStrategy_OnConflictSetStateAs: TioPersistenceConflictState;
begin
  Result := FInsertConflictStrategy_OnConflictSetStateAs;
end;

function TioTable.GetJoin: IioJoins;
begin
  Result := FJoins;
end;

function TioTable.GetKeyGenerator: String;
begin
  Result := IfThen(FKeyGenerator.IsEmpty, TableName, FKeyGenerator);
end;

function TioTable.GetMapMode: TioMapModeType;
begin
  Result := FMapMode;
end;

function TioTable.GetQualifiedClassName: String;
begin
  Result := FRttiType.QualifiedName;
end;

function TioTable.GetRttiType: TRttiInstanceType;
begin
  Result := FRttiType;
end;

function TioTable.GetSql: String;
begin
  Result := inherited;
  Result := TioDBFActory.SqlDataConverter(GetConnectionDefName).FieldNameToSqlFieldName(Result);
end;

function TioTable.IndexListExists: Boolean;
begin
  Result := Assigned(FIndexList);
end;

function TioTable.IsTrueClass: Boolean;
begin
  Result := FTrueClass.Mode > tcDisabled;
end;

function TioTable.IsForThisConnection(AConnectionDefNameToCheck: String): Boolean;
var
  LCurrentConnectionDefName: String;
begin
  // Defaultize the connection def name to check (default connection name if empty)
  AConnectionDefNameToCheck := TioDBFActory.ConnectionManager.GetCurrentConnectionNameIfEmpty(AConnectionDefNameToCheck);
  // Extract the curret connection def of the context table (ask it to the table itself obviously)
  LCurrentConnectionDefName := GetConnectionDefName;
  // The table is for this connection if the current connection name of the table: is empty (no connection name is
  // specified for this table so this mean it is for all connections), or it's a default connection, or it's
  // specifically setted for the connection name received to check (AConnectionDefNameToCheck).
  Result := LCurrentConnectionDefName.IsEmpty or (LCurrentConnectionDefName = IO_CONNECTIONDEF_DEFAULTNAME) or
    (LCurrentConnectionDefName = AConnectionDefNameToCheck);
end;

procedure TioTable.SetEtmTimeSlotClass(const AEtmTimeSlotClass: TioEtmTimeSlotRef);
begin
  FEtmTimeSlotClass := AEtmTimeSlotClass;
end;

procedure TioTable.SetEtmTraceOnlyOnConnectionName(const AConnectionName: String);
begin
  FEtmTraceOnlyOnConnectionName := AConnectionName;
end;

procedure TioTable.SetIndexList(AIndexList: TioIndexList);
begin
  FIndexList := AIndexList;
end;

procedure TioTable.SetInsertConflictStrategy(const AConflictStrategy: TClass);
begin
  FInsertConflictStrategy := AConflictStrategy;
end;

procedure TioTable.SetInsertConflictStrategy_OnConflictSetStateAs(const Value: TioPersistenceConflictState);
begin
  FInsertConflictStrategy_OnConflictSetStateAs := Value;
end;

procedure TioTable.SetEtmPropToPropList(AEtmPropToPropList: TEtmPropToPropList);
begin
  FEtmPropToPropList := AEtmPropToPropList;
end;

procedure TioTable.SetDeleteConflictStrategy(const AConflictStrategy: TClass);
begin
  FDeleteConflictStrategy := AConflictStrategy;
end;

procedure TioTable.SetDeleteConflictStrategy_OnConflictSetStateAs(const Value: TioPersistenceConflictState);
begin
  FDeleteConflictStrategy_OnConflictSetStateAs := Value;
end;

procedure TioTable.SetUpdateConflictStrategy(const AConflictStrategy: TClass);
begin
  FUpdateConflictStrategy := AConflictStrategy;
end;

procedure TioTable.SetUpdateConflictStrategy_OnConflictSetStateAs(const Value: TioPersistenceConflictState);
begin
  FUpdateConflictStrategy_OnConflictSetStateAs := Value;
end;

function TioTable.TableName: String;
begin
  Result := FSqlText;
end;

{ TioTrueClass }

function TioTrueClass.ClassNameFromClassInfoFieldValue(const AValue: String): String;
var
  LLastDelimiterPos: Integer;
begin
  Result := QualifiedClassNameFromClassInfoFieldValue(AValue);
  LLastDelimiterPos := LastDelimiter('.', Result);
  Result := Copy(Result, LLastDelimiterPos + 1, 999);
end;

constructor TioTrueClass.Create(const ATrueClassMode: TioTrueClassMode; const ASqlFieldName: String);
begin
  FMode := ATrueClassMode;
  FSqlFieldName := ASqlFieldName;
  FAncestors := '';
end;

function TioTrueClass.GetClassName: String;
begin
  Result := Table.GetClassName;
end;

function TioTrueClass.GetFieldName: string;
begin
  Result := FSqlFieldName;
end;

function TioTrueClass.GetQualifiedClassName: String;
begin
  Result := Table.GetQualifiedClassName;
end;

function TioTrueClass.GetSqlFieldName: string;
begin
  Result := TioDBFActory.SqlDataConverter(Table.GetConnectionDefName).FieldNameToSqlFieldName(FSqlFieldName);
end;

function TioTrueClass.GetSqlParamName: String;
begin
  Result := 'P_' + FSqlFieldName;
end;

function TioTrueClass.GetSqlValue: string;
begin
  Result := TioDBFActory.SqlDataConverter(Table.GetConnectionDefName).StringToSQL(Self.GetValue);
end;

function TioTrueClass.GetMode: TioTrueClassMode;
begin
  Result := FMode;
end;

function TioTrueClass.GetValue: String;
begin
  Result := Table.GetQualifiedClassName + ';' + FAncestors;
end;

function TioTrueClass.QualifiedClassNameFromClassInfoFieldValue(const AValue: String): String;
begin
  Result := Copy(AValue, 0, Pos(';', AValue) - 1);
end;

procedure TioTrueClass.SetMode(const AValue: TioTrueClassMode);
begin
  FMode := AValue;
end;

procedure TioTrueClass.SetTable(const ATable: IioTable);
var
  LRttiType: TRttiType;
begin
  inherited;
  LRttiType := Table.GetRttiType;
  // Build ancestor list
  if FAncestors.IsEmpty then // To avoid duplicates
    repeat
    begin
      FAncestors := FAncestors + '<' + LRttiType.Name + '>';
      LRttiType := LRttiType.BaseType;
    end;
    until not Assigned(LRttiType);
end;

{ TioJoin }

constructor TioJoinItem.Create(const AJoinType: TioJoinType; AJoinClassRef: TioClassRef; AJoinCondition: String);
begin
  inherited Create;
  FJoinType := AJoinType;
  FJoinClassRef := AJoinClassRef;
  FJoinCondition := AJoinCondition;
end;

function TioJoinItem.GetJoinClassRef: TioClassRef;
begin
  Result := Self.FJoinClassRef;
end;

function TioJoinItem.GetJoinCondition: String;
begin
  Result := Self.FJoinCondition;
end;

function TioJoinItem.GetJoinType: TioJoinType;
begin
  Result := Self.FJoinType;
end;

function TioJoinItem.GetSql(const AConnectionDefName: String): String;
begin
  Result := TioDBFActory.SqlGenerator(AConnectionDefName).GenerateSqlJoinSectionItem(Self);
end;

{ TioJoins }

procedure TioJoins.Add(AJoinItem: IioJoinItem);
begin
  FJoinList.Add(AJoinItem);
end;

constructor TioJoins.Create;
begin
  FJoinList := TioJoinItemList.Create;
end;

destructor TioJoins.Destroy;
begin
  FJoinList.Free;
  inherited;
end;

function TioJoins.GetSql: String;
var
  AJoinItem: IioJoinItem;
begin
  Result := '';
  for AJoinItem in FJoinList do
    Result := Result + #13 + TioSqlTranslator.Translate(AJoinItem.GetSql(Self.Table.GetConnectionDefName), Table.GetClassName);
end;

{ TioGroupBy }

constructor TioGroupBy.Create(const ASqlText: String);
begin
  FSqlText := ASqlText;
end;

function TioGroupBy.GetSql: String;
begin
  Result := TioSqlTranslator.Translate(FSqlText, Table.GetClassName).Trim;
  if Result <> '' then
    Result := 'GROUP BY ' + Result;
end;

{ TioBaseTableCompanion }

procedure TioBaseTableCompanion.SetTable(const ATable: IioTable);
begin
  FTable := ATable as TioTable;
end;

function TioBaseTableCompanion.Table: TioTable;
begin
  Result := FTable;
end;

end.
