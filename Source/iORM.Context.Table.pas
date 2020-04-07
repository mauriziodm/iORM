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

  // Classe che incapsula le informazioni per l'eventuale GroubBY
  // almeno la parte fissa eventualmente dichiarata con gli attributes
  // nella dichiarazione della classe (ci potrebbe poi essere in futuro
  // anche una GroupBy non fissa e impostabile tramite TioWhere come
  // se fosse una condizione prima del ToList o TObject, Qquest'ultima
  // GroupBy avrebbe la precedenza su qquella fissa se specificata)
  TioGroupBy = class(TInterfacedObject, IioGroupBy)
  strict private
    FSqlText: String;
  public
    constructor Create(const ASqlText: String);
    function GetSql(const ASelfClassName, AConnectionDefName: String): String;
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
  TioJoins = class(TInterfacedObject, IioJoins)
  strict private
    FJoinList: TioJoinItemList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(AJoinItem: IioJoinItem);
    function GetSql(const AConnectionDefName, ASelfClassName: String): String;
  end;
  // ---------------------------------------------------------------------------
  // END: JOIN
  // ===========================================================================

  // Classe che incapsula le informazioni per la funzione ClassFromField
  TioClassFromField = class(TInterfacedObject, IioClassFromField)
  strict private
    FClassName: String;
    FQualifiedClassName: String;
    FAncestors: String;
    FSqlFieldName: String;
  public
    constructor Create(ASqlFieldName, AClassName, AQualifiedClassName, AAncestors: String);
    function GetFieldName: string;
    function GetSqlFieldName(const AConnectionDefName: String): string;
    function GetSqlParamName: String;
    function GetValue: String;
    function GetSqlValue(const AConnectionDefName: String): string;
    function GetClassName: String;
    function GetQualifiedClassName: String;
    function QualifiedClassNameFromClassInfoFieldValue(AValue: String): String;
  end;

  // Classe che incapsula le info sulla tabella
  TioContextTable = class(TioSqlItem, IioContextTable)
  strict private
    FMapMode: TioMapModeType;
    FClassFromField: IioClassFromField;
    FJoins: IioJoins;
    FGroupBy: IioGroupBy;
    FConnectionDefName: String;
    FKeyGenerator: String;
    FRttiType: TRttiInstanceType;
    FIndexList: TioIndexList;
    FAutoCreateDB: Boolean;
  public
    constructor Create(const ASqlText, AKeyGenerator: String; const AClassFromField: IioClassFromField; const AJoins: IioJoins;
      const AGroupBy: IioGroupBy; const AConnectionDefName: String; const AMapMode: TioMapModeType; const AAutoCreateDB: Boolean;
      const ARttiType: TRttiInstanceType); reintroduce; overload;
    destructor Destroy; override;
    function GetSql(const AConnectionDefName: String): String;
    function GetClassFromField: IioClassFromField;
    function IsClassFromField: Boolean;
    function TableName: String;
    function GetKeyGenerator: String;
    function GetJoin: IioJoins;
    function GetGroupBy: IioGroupBy;
    function GetConnectionDefName: String;
    function GetMapMode: TioMapModeType;
    function GetRttiType: TRttiInstanceType;
    function GetAutoCreateDB: Boolean;
    function GetClassName: String;
    // IndexList
    function IndexListExists: Boolean;
    function GetIndexList(AAutoCreateIfUnassigned: Boolean): TioIndexList;
    procedure SetIndexList(AIndexList: TioIndexList);
  end;

implementation

uses
  iORM.DB.Factory, System.SysUtils, iORM.Exceptions, iORM.SqlTranslator;

{ TioContextTable }

constructor TioContextTable.Create(const ASqlText, AKeyGenerator: String; const AClassFromField: IioClassFromField;
  const AJoins: IioJoins; const AGroupBy: IioGroupBy; const AConnectionDefName: String; const AMapMode: TioMapModeType;
  const AAutoCreateDB: Boolean; const ARttiType: TRttiInstanceType);
begin
  inherited Create(ASqlText);
  FKeyGenerator := AKeyGenerator;
  FClassFromField := AClassFromField;
  FJoins := AJoins;
  FGroupBy := AGroupBy;
  FConnectionDefName := AConnectionDefName;
  FMapMode := AMapMode;
  FRttiType := ARttiType;
  FIndexList := nil;
  FAutoCreateDB := AAutoCreateDB;
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
  if FConnectionDefName.IsEmpty then
    Result := TioDBFActory.ConnectionManager.GetDefaultConnectionName
  else
    Result := FConnectionDefName;
end;

function TioContextTable.GetGroupBy: IioGroupBy;
begin
  Result := FGroupBy;
end;

function TioContextTable.GetIndexList(AAutoCreateIfUnassigned: Boolean): TioIndexList;
begin
  if AAutoCreateIfUnassigned and (not Self.IndexListExists) then
    FIndexList := TioIndexList.Create(False);
  Result := FIndexList;
end;

function TioContextTable.GetJoin: IioJoins;
begin
  Result := FJoins;
end;

function TioContextTable.GetKeyGenerator: String;
begin
  Result := FKeyGenerator;
end;

function TioContextTable.GetMapMode: TioMapModeType;
begin
  Result := FMapMode;
end;

function TioContextTable.GetRttiType: TRttiInstanceType;
begin
  Result := FRttiType;
end;

function TioContextTable.GetSql(const AConnectionDefName: String): String;
begin
  Result := TioDBFActory.SqlDataConverter(AConnectionDefName).FieldNameToSqlFieldName(Result);
end;

function TioContextTable.IndexListExists: Boolean;
begin
  Result := Assigned(FIndexList);
end;

function TioContextTable.IsClassFromField: Boolean;
begin
  Result := Assigned(FClassFromField);
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

constructor TioClassFromField.Create(ASqlFieldName, AClassName, AQualifiedClassName, AAncestors: String);
begin
  FSqlFieldName := ASqlFieldName;
  FClassName := AClassName;
  FQualifiedClassName := AQualifiedClassName;
  FAncestors := AAncestors;
end;

function TioClassFromField.GetClassName: String;
begin
  Result := FClassName;
end;

function TioClassFromField.GetFieldName: string;
begin
  Result := FSqlFieldName;
end;

function TioClassFromField.GetQualifiedClassName: String;
begin
  Result := FQualifiedClassName;
end;

function TioClassFromField.GetSqlFieldName(const AConnectionDefName: String): string;
begin
  Result := TioDBFActory.SqlDataConverter(AConnectionDefName).FieldNameToSqlFieldName(FSqlFieldName);
end;

function TioClassFromField.GetSqlParamName: String;
begin
  Result := 'P_' + FSqlFieldName;
end;

function TioClassFromField.GetSqlValue(const AConnectionDefName: String): string;
begin
  Result := TioDBFActory.SqlDataConverter(AConnectionDefName).StringToSQL(Self.GetValue);
end;

function TioClassFromField.GetValue: String;
begin
  Result := Self.FQualifiedClassName + ';' + Self.FAncestors;
end;

function TioClassFromField.QualifiedClassNameFromClassInfoFieldValue(AValue: String): String;
begin
  Result := Copy(AValue, 0, Pos(';', AValue) - 1);
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

function TioJoins.GetSql(const AConnectionDefName, ASelfClassName: String): String;
var
  AJoinItem: IioJoinItem;
begin
  Result := '';
  for AJoinItem in FJoinList do
    Result := Result + #13 + TioSqlTranslator.Translate(AJoinItem.GetSql(AConnectionDefName), ASelfClassName, AConnectionDefName);
end;

{ TioGroupBy }

constructor TioGroupBy.Create(const ASqlText: String);
begin
  FSqlText := ASqlText;
end;

function TioGroupBy.GetSql(const ASelfClassName, AConnectionDefName: String): String;
begin
  Result := TioSqlTranslator.Translate(FSqlText, ASelfClassName, AConnectionDefName).Trim;
  if Result <> '' then
    Result := 'GROUP BY ' + Result;

end;

end.
