{ *************************************************************************** }
{ }
{ iORM - (interfaced ORM) }
{ }
{ Copyright (C) 2015-2016 Maurizio Del Magno }
{ }
{ mauriziodm@levantesw.it }
{ mauriziodelmagno@gmail.com }
{ https://github.com/mauriziodm/iORM.git }
{ }
{ }
{ *************************************************************************** }
{ }
{ This file is part of iORM (Interfaced Object Relational Mapper). }
{ }
{ Licensed under the GNU Lesser General Public License, Version 3; }
{ you may not use this file except in compliance with the License. }
{ }
{ iORM is free software: you can redistribute it and/or modify }
{ it under the terms of the GNU Lesser General Public License as published }
{ by the Free Software Foundation, either version 3 of the License, or }
{ (at your option) any later version. }
{ }
{ iORM is distributed in the hope that it will be useful, }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the }
{ GNU Lesser General Public License for more details. }
{ }
{ You should have received a copy of the GNU Lesser General Public License }
{ along with iORM.  If not, see <http://www.gnu.org/licenses/>. }
{ }
{ *************************************************************************** }

unit iORM.Context.Table;

interface

uses
  iORM.Context.Interfaces,
  iORM.SqlItems, iORM.Context.Table.Interfaces, iORM.Attributes,
  iORM.CommonTypes, System.Generics.Collections, System.Rtti;

type

  TioContextTable = class;

  // Base class for all ContextTable companions
  TioBaseTableCompanion = class(TInterfacedObject)
  strict private
    FTable: TioContextTable; // This field is of class type to avoid circular reference with the table (memory leak prevention)
  strict protected
    function Table: TioContextTable;
  public
    procedure SetTable(const ATable: IioContextTable); virtual;
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

  // Classe che incapsula le informazioni per la funzione ClassFromField
  TioClassFromField = class(TioBaseTableCompanion, IioClassFromField)
  strict private
    FAncestors: String;
    FSqlFieldName: String;
  public
    constructor Create(ASqlFieldName: String);
    procedure SetTable(const ATable: IioContextTable); override;
    function GetFieldName: string;
    function GetSqlFieldName: string;
    function GetSqlParamName: String;
    function GetValue: String;
    function GetSqlValue: string;
    function GetClassName: String;  // NB: I metodi ci sono anche nella parte implementation (commentati)
    function GetQualifiedClassName: String;  // NB: I metodi ci sono anche nella parte implementation (commentati)
    function QualifiedClassNameFromClassInfoFieldValue(AValue: String): String;
  end;

  // Classe che incapsula le info sulla tabella
  TioContextTable = class(TioSqlItem, IioContextTable)
  strict private
    FMapMode: TioMapModeType;
    FClassFromField: IioClassFromField;
    FJoins: IioJoins;
    FGroupBy: IioGroupBy;
    FConnectionDefName_DoNotCallDirectly: String;
    FKeyGenerator: String;
    FRttiType: TRttiInstanceType;
    FIndexList: TioIndexList;
    FAutoCreateDB: Boolean;
  public
    constructor Create(const ASqlText, AKeyGenerator: String; const AClassFromField: IioClassFromField; const AJoins: IioJoins;
      const AGroupBy: IioGroupBy; const AConnectionDefName: String; const AMapMode: TioMapModeType; const AAutoCreateDB: Boolean;
      const ARttiType: TRttiInstanceType); reintroduce; overload;
    destructor Destroy; override;
    function GetSql: String; override;
    function GetClassFromField: IioClassFromField;
    function IsClassFromField: Boolean;
    function TableName: String;
    function GetKeyGenerator: String;
    function GetJoin: IioJoins;
    function GetGroupBy: IioGroupBy;
    function GetConnectionDefName: String;
    function IsForThisConnection(AConnectionDefNameToCheck: String): Boolean;
    function GetMapMode: TioMapModeType;
    function GetRttiType: TRttiInstanceType;
    function GetAutoCreateDB: Boolean;
    function GetClassName: String;
    function GetQualifiedClassName: String;
    // IndexList
    function IndexListExists: Boolean;
    function GetIndexList(AAutoCreateIfUnassigned: Boolean): TioIndexList;
    procedure SetIndexList(AIndexList: TioIndexList);
  end;

implementation

uses
  iORM.DB.Factory, System.SysUtils, iORM.Exceptions, iORM.SqlTranslator, System.StrUtils;

{ TioContextTable }

constructor TioContextTable.Create(const ASqlText, AKeyGenerator: String; const AClassFromField: IioClassFromField;
  const AJoins: IioJoins; const AGroupBy: IioGroupBy; const AConnectionDefName: String; const AMapMode: TioMapModeType;
  const AAutoCreateDB: Boolean; const ARttiType: TRttiInstanceType);
begin
  inherited Create(ASqlText);
  FKeyGenerator := AKeyGenerator;
  FConnectionDefName_DoNotCallDirectly := AConnectionDefName;
  FMapMode := AMapMode;
  FRttiType := ARttiType;
  FIndexList := nil;
  FAutoCreateDB := AAutoCreateDB;
  // Set ClassFromField
  FClassFromField := AClassFromField;
  if Assigned(FClassFromField) then
    FClassFromField.SetTable(Self);
  // Set Joins
  FJoins := AJoins;
  FJoins.SetTable(Self);
  // SetGroupBy
  FGroupBy := AGroupBy;
  if Assigned(FGroupBy) then
    FGroupBy.SetTable(Self);
end;

destructor TioContextTable.Destroy;
begin
  if Self.IndexListExists then
    FIndexList.Free;
  inherited;
end;

function TioContextTable.GetAutoCreateDB: Boolean;
begin
  Result := FAutoCreateDB;
end;

function TioContextTable.GetClassFromField: IioClassFromField;
begin
  Result := FClassFromField;
end;

function TioContextTable.GetClassName: String;
begin
  Result := FRttiType.Name;
end;

function TioContextTable.GetConnectionDefName: String;
begin
  Result := TioDBFActory.ConnectionManager.GetCurrentConnectionNameIfEmpty(FConnectionDefName_DoNotCallDirectly);
end;

function TioContextTable.GetGroupBy: IioGroupBy;
begin
  Result := FGroupBy;
end;

function TioContextTable.GetIndexList(AAutoCreateIfUnassigned: Boolean): TioIndexList;
begin
  if AAutoCreateIfUnassigned and (not Self.IndexListExists) then
    FIndexList := TioIndexList.Create;
  Result := FIndexList;
end;

function TioContextTable.GetJoin: IioJoins;
begin
  Result := FJoins;
end;

function TioContextTable.GetKeyGenerator: String;
begin
  Result := IfThen(FKeyGenerator.IsEmpty, TableName, FKeyGenerator);
end;

function TioContextTable.GetMapMode: TioMapModeType;
begin
  Result := FMapMode;
end;

function TioContextTable.GetQualifiedClassName: String;
begin
  Result := FRttiType.QualifiedName;
end;

function TioContextTable.GetRttiType: TRttiInstanceType;
begin
  Result := FRttiType;
end;

function TioContextTable.GetSql: String;
begin
  Result := inherited;
  Result := TioDBFActory.SqlDataConverter(GetConnectionDefName).FieldNameToSqlFieldName(Result);
end;

function TioContextTable.IndexListExists: Boolean;
begin
  Result := Assigned(FIndexList);
end;

function TioContextTable.IsClassFromField: Boolean;
begin
  Result := Assigned(FClassFromField);
end;

function TioContextTable.IsForThisConnection(AConnectionDefNameToCheck: String): Boolean;
var
  LCurrentConnectionDefName: String;
begin
  // Defaultize the connection def name to check (default connection name if empty)
  AConnectionDefNameToCheck := TioDBFActory.ConnectionManager.GetCurrentConnectionNameIfEmpty(AConnectionDefNameToCheck);
  // Extract the curret connection def of the context table (ask it to the table itself obviously)
  LCurrentConnectionDefName := GetConnectionDefName;
  // The table is for this connection if the current connection name of the table: is empty (no connection name is
  //  specified for this table so this mean it is for all connections), or it's a default connection, or it's
  //  specifically setted for the connection name received to check (AConnectionDefNameToCheck).
  Result := LCurrentConnectionDefName.IsEmpty or (LCurrentConnectionDefName = IO_CONNECTIONDEF_DEFAULTNAME) or
    (LCurrentConnectionDefName = AConnectionDefNameToCheck);
end;

procedure TioContextTable.SetIndexList(AIndexList: TioIndexList);
begin
  FIndexList := AIndexList;
end;

function TioContextTable.TableName: String;
begin
  Result := Self.FSqlText;
end;

{ TioClassFromField }

constructor TioClassFromField.Create(ASqlFieldName: String);
begin
  FSqlFieldName := ASqlFieldName;
  FAncestors := '';
end;

function TioClassFromField.GetClassName: String;
begin
  Result := Table.GetClassName;
end;

function TioClassFromField.GetFieldName: string;
begin
  Result := FSqlFieldName;
end;

function TioClassFromField.GetQualifiedClassName: String;
begin
  Result := Table.GetQualifiedClassName;
end;

function TioClassFromField.GetSqlFieldName: string;
begin
  Result := TioDBFActory.SqlDataConverter(Table.GetConnectionDefName).FieldNameToSqlFieldName(FSqlFieldName);
end;

function TioClassFromField.GetSqlParamName: String;
begin
  Result := 'P_' + FSqlFieldName;
end;

function TioClassFromField.GetSqlValue: string;
begin
  Result := TioDBFActory.SqlDataConverter(Table.GetConnectionDefName).StringToSQL(Self.GetValue);
end;

function TioClassFromField.GetValue: String;
begin
  Result := Table.GetQualifiedClassName + ';' + Self.FAncestors;
end;

function TioClassFromField.QualifiedClassNameFromClassInfoFieldValue(AValue: String): String;
begin
  Result := Copy(AValue, 0, Pos(';', AValue) - 1);
end;

procedure TioClassFromField.SetTable(const ATable: IioContextTable);
var
  LRttiType: TRttiType;
begin
  inherited;
  LRttiType := Table.GetRttiType;
  // Loop for all ancestors
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
    Result := Result + #13 + TioSqlTranslator.Translate(aJoinItem.GetSql(Self.Table.GetConnectionDefName), Table.GetClassName);
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

procedure TioBaseTableCompanion.SetTable(const ATable: IioContextTable);
begin
  FTable := ATable as TioContextTable;
end;

function TioBaseTableCompanion.Table: TioContextTable;
begin
  Result := FTable;
end;

end.
