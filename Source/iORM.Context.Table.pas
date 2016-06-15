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



unit iORM.Context.Table;

interface

uses
  iORM.Context.Interfaces,
  iORM.SqlItems, iORM.Context.Table.Interfaces, iORM.Attributes,
  iORM.CommonTypes, System.Generics.Collections, System.Rtti;

type

  // Classe che incapsula le informazioni per l'eventuale GroubBY
  //  almeno la parte fissa eventualmente dichiarata con gli attributes
  //  nella dichiarazione della classe (ci potrebbe poi essere in futuro
  //  anche una GroupBy non fissa e impostabile tramite TioWhere come
  //  se fosse una condizione prima del ToList o TObject, Qquest'ultima
  //  GroupBy avrebbe la precedenza su qquella fissa se specificata)
  TioGroupBy = class(TInterfacedObject, IioGroupBy)
  strict private
    FSqlText: String;
  public
    constructor Create(const ASqlText:String);
    function GetSql(const ASelfClassName: String): String;
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
    constructor Create(const AJoinType:TioJoinType; AJoinClassRef:TioClassRef; AJoinCondition:String='');
    function GetSql: String;
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
    procedure Add(AJoinItem:IioJoinItem);
    function GetSql(const ASelfClassName: String): String;
  end;
  // ---------------------------------------------------------------------------
  // END: JOIN
  // ===========================================================================


  // Classe che incapsula le informazioni per la funzione ClassFromField
  TioClassFromField = class (TInterfacedObject, IioClassFromField)
  strict private
    FClassName: String;
    FQualifiedClassName: String;
    FAncestors: String;
    FSqlFieldName: String;
  public
    constructor Create(ASqlFieldName, AClassName, AQualifiedClassName, AAncestors: String);
    function GetSqlFieldName: string;
    function GetSqlParamName: String;
    function GetValue: String;
    function GetSqlValue: string;
    function GetClassName: String;
    function GetQualifiedClassName: String;
    function QualifiedClassNameFromClassInfoFieldValue(AValue:String): String;
  end;

  // Classe che incapsula le info sulla tabella
  TioContextTable = class (TioSqlItem, IioContextTable)
  strict private
    FMapMode: TioMapModeType;
    FClassFromField: IioClassFromField;
    FJoins: IioJoins;
    FGroupBy: IioGroupBy;
    FConnectionDefName: String;
    FKeyGenerator: String;
    FRttiType: TRttiInstanceType;
    FIndexList: TioIndexList;
  public
    constructor Create(const ASqlText, AKeyGenerator:String; const AClassFromField:IioClassFromField;
    const AJoins:IioJoins; const AGroupBy:IioGroupBy; const AConnectionDefName:String;
    const AMapMode:TioMapModeType; const ARttiType:TRttiInstanceType); overload;
    destructor Destroy; override;
    function GetClassFromField: IioClassFromField;
    function IsClassFromField: Boolean;
    function TableName: String;
    function GetKeyGenerator: String;
    function GetJoin: IioJoins;
    function GetGroupBy: IioGroupBy;
    function GetConnectionDefName: String;
    function GetMapMode: TioMapModeType;
    function GetRttiType: TRttiInstanceType;
    // IndexList
    function IndexListExists: Boolean;
    function GetIndexList(AAutoCreateIfUnassigned:Boolean): TioIndexList;
    procedure SetIndexList(AIndexList:TioIndexList);
  end;

implementation

uses
  iORM.DB.Factory, System.SysUtils, iORM.Exceptions, iORM.SqlTranslator;

{ TioContextTable }

constructor TioContextTable.Create(const ASqlText, AKeyGenerator:String; const AClassFromField:IioClassFromField;
    const AJoins:IioJoins; const AGroupBy:IioGroupBy; const AConnectionDefName:String;
    const AMapMode:TioMapModeType; const ARttiType:TRttiInstanceType);
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
end;

destructor TioContextTable.Destroy;
begin
  if Self.IndexListExists then
    FIndexList.Free;
  inherited;
end;

function TioContextTable.GetClassFromField: IioClassFromField;
begin
  Result := FClassFromField;
end;

function TioContextTable.GetConnectionDefName: String;
begin
  Result := FConnectionDefName;
end;

function TioContextTable.GetGroupBy: IioGroupBy;
begin
  Result := FGroupBy;
end;

function TioContextTable.GetIndexList(AAutoCreateIfUnassigned:Boolean): TioIndexList;
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

function TioClassFromField.GetQualifiedClassName: String;
begin
  Result := FQualifiedClassName;
end;

function TioClassFromField.GetSqlFieldName: string;
begin
  Result := FSqlFieldName;
end;

function TioClassFromField.GetSqlParamName: String;
begin
  Result := 'P_' + Self.GetSqlFieldName;
end;

function TioClassFromField.GetSqlValue: string;
begin
  Result := TioDbFactory.SqlDataConverter.StringToSQL(Self.GetValue);
end;

function TioClassFromField.GetValue: String;
begin
  Result := Self.FQualifiedClassName + ';' + Self.FAncestors;
end;


function TioClassFromField.QualifiedClassNameFromClassInfoFieldValue(
  AValue: String): String;
begin
  Result := Copy(AValue,0,Pos(';',AValue)-1);
end;

{ TioJoin }

constructor TioJoinItem.Create(const AJoinType: TioJoinType;
  AJoinClassRef: TioClassRef; AJoinCondition: String);
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

function TioJoinItem.GetSql: String;
begin
  Result := TioDBFactory.SqlGenerator.GenerateSqlJoinSectionItem(Self);
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

function TioJoins.GetSql(const ASelfClassName: String): String;
var
  aJoinItem: IioJoinItem;
begin
  Result := '';
  for aJoinItem in FJoinList do
    Result := Result + #13 + TioSqlTranslator.Translate(aJoinItem.GetSql, ASelfClassName);
end;

{ TioGroupBy }

constructor TioGroupBy.Create(const ASqlText: String);
begin
  FSqlText := ASqlText;
end;

function TioGroupBy.GetSql(const ASelfClassName: String): String;
begin
  Result := TioSqlTranslator.Translate(FSqlText, ASelfClassName).Trim;
  if Result <> '' then Result := 'GROUP BY ' + Result;
  
end;

end.
