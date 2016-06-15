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



unit iORM.Where;

interface

uses
  System.Rtti,
  iORM.CommonTypes,
  iORM.Interfaces,
  iORM.SqlItems,
  iORM.Context.Properties.Interfaces, iORM.Context.Table.Interfaces,
  System.Classes, Data.Bind.ObjectScope, iORM.Where.SqlItems.Interfaces,
  iORM.Resolver.Interfaces, iORM.Containers.Interfaces, iORM.Where.Interfaces,
  System.Generics.Collections, iORM.Where.Destinations,
  iORM.Context.Map.Interfaces, FireDAC.Comp.Client, System.TypInfo;

type

  // Where conditions (standard version)
  TioWhere = class (TioSqlItem, IioWhere)
  strict
  private
  protected
    FTypeName, FTypeAlias: String;
    FTypeInfo: PTypeInfo;
    FDisableClassFromField: Boolean;
    FLazyLoad: Boolean;
    FOrderBy: IioSqlItemWhere;
    // Contiene le clausole where specificate fino ad ora
    FWhereItems: IWhereItems;
    // Contiene le eventuali clausole where di eventuali dettagli, la chiave è una stringa
    //  e contiene il nome della MasterPropertyName
    FDetailsContainer: IioWhereDetailsContainer;
    // -------------------------------------------
    // Details property
    function GetDetails: IioWhereDetailsContainer;
    // Items property
    function GetItems: IWhereItems;
  public
    constructor Create; overload;
    function GetWhereItems: IWhereItems;
    function GetSql(const AMap:IioMap; const AddWhere:Boolean=True): String;
    function GetSqlWithClassFromField(const AMap:IioMap; const AIsClassFromField:Boolean; const AClassFromField: IioClassFromField): String;
    function GetDisableClassFromField: Boolean;
    function GetOrderByInstance: IioSqlItemWhere;
    function GetOrderBySql(const AMap:IioMap): String;
    procedure SetOrderBySql(const AOrderByText:String);
    procedure SetType(const ATypeName, ATypeAlias: String; const ATypeInfo:PTypeInfo);
    function IsEmpty: Boolean;
    // ------ Generic destinationz
    function ToGenericList: TioWhereGenericListDestination;
    // ------ Destination methods
    function ToMemTable: TFDMemTable; overload;
    procedure ToMemTable(const AMemTable:TFDMemTable); overload;

    function _ToObjectInternalByClassOnly(const AObj:TObject=nil): TObject;
    function ToObject(const AObj:TObject=nil): TObject; virtual;

    procedure ToList(const AList:TObject); overload;
    function ToList(const AListRttiType:TRttiType; const AOwnsObjects:Boolean=True): TObject; overload;
    function ToList(const AInterfacedListTypeName:String; const AAlias:String=''; const AOwnsObjects:Boolean=True): TObject; overload;
    function ToList(const AListClassRef:TioClassRef; const AOwnsObjects:Boolean=True): TObject; overload;

    procedure Delete;

    function ToActiveListBindSourceAdapter(const AOwner:TComponent; const AAutoLoadData:Boolean=True; const AOwnsObject:Boolean=True): TBindSourceAdapter; overload;
    function ToActiveObjectBindSourceAdapter(const AOwner:TComponent; const AAutoLoadData:Boolean=True; const AOwnsObject:Boolean=True): TBindSourceAdapter; overload;
    function ToListBindSourceAdapter(AOwner:TComponent; AOwnsObject:Boolean=True): TBindSourceAdapter;
    function ToObjectBindSourceAdapter(AOwner:TComponent; AOwnsObject:Boolean=True): TBindSourceAdapter;
    // ------ Conditions
    function ByOID(const AOID:Integer): IioWhere;
    function Add(const ATextCondition:String): IioWhere; overload;
    function Add(const AWhereCond:IioWhere): IioWhere; overload;
    function AddDetail(const AMasterPropertyName, ATextCondition:String): IioWhere; overload;
    function AddDetail(const AMasterPropertyName: String; const AWhereCond:IioWhere): IioWhere; overload;
    function DisableClassFromField: IioWhere;
    function SetDetailsContainer(ADetailsContainer: IioWhereDetailsContainer): IioWhere;
    function Lazy(const ALazyEnabled:Boolean=True): IioWhere;
    // --------------------------------------------------------------
    // ------ Logic relations
    function _And: IioWhere; overload;
    function _Or: IioWhere; overload;
    function _Not: IioWhere; overload;
    function _OpenPar: IioWhere; overload;
    function _ClosePar: IioWhere; overload;
    // ------ Logic relations with TextCondition
    function _And(ATextCondition:String): IioWhere; overload;
    function _Or(ATextCondition:String): IioWhere; overload;
    function _Not(ATextCondition:String): IioWhere; overload;
    function _OpenPar(ATextCondition:String): IioWhere; overload;
    function _ClosePar(ATextCondition:String): IioWhere; overload;
    // ------ Logic relations with TioWere
    function _And(AWhereCond:IioWhere): IioWhere overload;
    // ------ Compare operators
    function _Equal: IioWhere;
    function _Greater: IioWhere;
    function _Lower: IioWhere;
    function _GreaterOrEqual: IioWhere;
    function _LowerOrEqual: IioWhere;
    function _NotEqual: IioWhere;
    function _Like: IioWhere;
    function _IsNull: IioWhere;
    function _IsNotNull: IioWhere;
    // ------ Compare operators with TValue
    function _EqualTo(AValue:TValue): IioWhere; overload;
    function _EqualTo(AValue:TDateTime): IioWhere; overload;
    function _EqualTo(AValue:Double): IioWhere; overload;
    function _EqualTo(AValue:Integer): IioWhere; overload;
    function _GreaterThan(AValue:TValue): IioWhere; overload;
    function _GreaterThan(AValue:TDateTime): IioWhere; overload;
    function _LowerThan(AValue:TValue): IioWhere; overload;
    function _LowerThan(AValue:TDateTime): IioWhere; overload;
    function _GreaterOrEqualThan(AValue:TValue): IioWhere; overload;
    function _GreaterOrEqualThan(AValue:TDateTime): IioWhere; overload;
    function _LowerOrEqualThan(AValue:TValue): IioWhere; overload;
    function _LowerOrEqualThan(AValue:TDateTime): IioWhere; overload;
    function _NotEqualTo(AValue:TValue): IioWhere; overload;
    function _NotEqualTo(AValue:TDateTime): IioWhere; overload;
    function _LikeTo(AValue:TValue): IioWhere; overload;
    function _LikeTo(AValue:TDateTime): IioWhere; overload;
    // ------
    function _Where: IioWhere; overload;
    function _Where(AWhere:IioWhere): IioWhere; overload;
    function _Where(ATextCondition:String): IioWhere; overload;
    function _Property(APropertyName:String): IioWhere;
    function _PropertyOID: IioWhere;
    function _PropertyEqualsTo(APropertyName:String; AValue:TValue): IioWhere; overload;
    function _PropertyEqualsTo(APropertyName:String; AValue:TDateTime): IioWhere; overload;
    function _PropertyOIDEqualsTo(AValue:TValue): IioWhere;
    function _Value(AValue:TValue): IioWhere; overload;
    function _Value(AValue:TDateTime): IioWhere; overload;
    function _Value(AValue:Integer): IioWhere; overload;
    function _Value(AValue:Double): IioWhere; overload;
    function _OrderBy(const ATextOrderBy:String): IioWhere; overload;
    function _OrderBy(const AOrderByInstance:IioSqlItemWhere): IioWhere; overload;
    procedure CreateIndex(ACommaSepFieldList:String; const AIndexOrientation:TioIndexOrientation=ioAscending; const AUnique:Boolean=False); overload;
    procedure CreateIndex(const AIndexName:String; ACommaSepFieldList:String; const AIndexOrientation:TioIndexOrientation=ioAscending; const AUnique:Boolean=False); overload;
    procedure DropIndex(const AIndexName:String);
    // ----- Properties -----
    property Details:IioWhereDetailsContainer read GetDetails;
    property Items: IWhereItems read GetItems;
  end;

  // Where conditions (generic version)
  TioWhere<T> = class (TioWhere, IioWhere<T>)
  public
    // ------ Destination methods
    function ToObject(const AObj:TObject=nil): T; overload;
    function ToList: TList<T>; overload;
//    function ToObjectList(const AOwnsObjects:Boolean=True): TObjectList<TObject>;
    function ToInterfacedList: IioList<T>; overload;
//    function ToInterfacedObjectList(const AOwnsObjects:Boolean=True): IioList<T>; overload;
    // ------ Conditions
    function ByOID(const AOID:Integer): IioWhere<T>;
    function Add(const ATextCondition:String): IioWhere<T>; overload;
    function Add(const AWhereCond:IioWhere): IioWhere<T>; overload;
    function AddDetail(const AMasterPropertyName, ATextCondition:String): IioWhere<T>; overload;
    function AddDetail(const AMasterPropertyName: String; const AWhereCond:IioWhere): IioWhere<T>; overload;
    function DisableClassFromField: IioWhere<T>;
    function SetDetailsContainer(ADetailsContainer: IioWhereDetailsContainer): IioWhere<T>;
    function Lazy(const ALazyEnabled:Boolean=True): IioWhere<T>;
    // ------ Logic relations
    function _And: IioWhere<T>; overload;
    function _Or: IioWhere<T>; overload;
    function _Not: IioWhere<T>; overload;
    function _OpenPar: IioWhere<T>; overload;
    function _ClosePar: IioWhere<T>; overload;
    // ------ Logic relations with TextCondition
    function _And(ATextCondition:String): IioWhere<T>; overload;
    function _Or(ATextCondition:String): IioWhere<T>; overload;
    function _Not(ATextCondition:String): IioWhere<T>; overload;
    function _OpenPar(ATextCondition:String): IioWhere<T>; overload;
    function _ClosePar(ATextCondition:String): IioWhere<T>; overload;
    // ------ Logic relations with TioWere
    function _And(AWhereCond:IioWhere): IioWhere<T>; overload;
    // ------ Compare operators
    function _Equal: IioWhere<T>;
    function _Greater: IioWhere<T>;
    function _Lower: IioWhere<T>;
    function _GreaterOrEqual: IioWhere<T>;
    function _LowerOrEqual: IioWhere<T>;
    function _NotEqual: IioWhere<T>;
    function _Like: IioWhere<T>;
    function _IsNull: IioWhere<T>;
    function _IsNotNull: IioWhere<T>;
    // ------ Compare operators with TValue
    function _EqualTo(AValue:TValue): IioWhere<T>; overload;
    function _EqualTo(AValue:TDateTime): IioWhere<T>; overload;
    function _EqualTo(AValue:Double): IioWhere<T>; overload;
    function _EqualTo(AValue:Integer): IioWhere<T>; overload;
    function _GreaterThan(AValue:TValue): IioWhere<T>; overload;
    function _GreaterThan(AValue:TDateTime): IioWhere<T>; overload;
    function _LowerThan(AValue:TValue): IioWhere<T>; overload;
    function _LowerThan(AValue:TDateTime): IioWhere<T>; overload;
    function _GreaterOrEqualThan(AValue:TValue): IioWhere<T>; overload;
    function _GreaterOrEqualThan(AValue:TDateTime): IioWhere<T>; overload;
    function _LowerOrEqualThan(AValue:TValue): IioWhere<T>; overload;
    function _LowerOrEqualThan(AValue:TDateTime): IioWhere<T>; overload;
    function _NotEqualTo(AValue:TValue): IioWhere<T>; overload;
    function _NotEqualTo(AValue:TDateTime): IioWhere<T>; overload;
    function _LikeTo(AValue:TValue): IioWhere<T>; overload;
    function _LikeTo(AValue:TDateTime): IioWhere<T>; overload;
    // ------
    function _Where: IioWhere<T>; overload;
    function _Where(AWhereCond:IioWhere): IioWhere<T>; overload;
    function _Where(ATextCondition:String): IioWhere<T>; overload;
    function _Property(APropertyName:String): IioWhere<T>;
    function _PropertyOID: IioWhere<T>;
    function _PropertyEqualsTo(APropertyName:String; AValue:TValue): IioWhere<T>; overload;
    function _PropertyEqualsTo(APropertyName:String; AValue:TDateTime): IioWhere<T>; overload;
    function _PropertyOIDEqualsTo(AValue:TValue): IioWhere<T>;
    function _Value(AValue:TValue): IioWhere<T>; overload;
    function _Value(AValue:TDateTime): IioWhere<T>; overload;
    function _Value(AValue:Double): IioWhere<T>; overload;
    function _Value(AValue:Integer): IioWhere<T>; overload;
    function _OrderBy(const ATextOrderBy:String): IioWhere<T>; overload;
    function _OrderBy(const AOrderByInstance:IioSqlItemWhere): IioWhere<T>; overload;
  end;


implementation

uses
  iORM.DB.Factory,
  iORM.Context.Factory, System.SysUtils,
  iORM.DuckTyped.Interfaces, iORM.DuckTyped.Factory,
  iORM.ObjectsForge.Factory,
  iORM.RttiContext.Factory, iORM,
  iORM.LiveBindings.ActiveListBindSourceAdapter, iORM.Where.SqlItems,
  iORM.DB.Interfaces, iORM.Resolver.Factory,
  iORM.Rtti.Utilities, iORM.Context.Interfaces, iORM.Containers.Factory,
  iORM.LiveBindings.InterfaceListBindSourceAdapter,
  iORM.LiveBindings.ActiveInterfaceListBindSourceAdapter,
  iORM.LiveBindings.InterfaceObjectBindSourceAdapter,
  iORM.LiveBindings.ActiveInterfaceObjectBindSourceAdapter,
  iORM.LiveBindings.ActiveObjectBindSourceAdapter, iORM.Where.Factory,
  iORM.Exceptions, FireDAC.Comp.DataSet, iORM.LazyLoad.Factory;

{ TioWhere }

function TioWhere.Add(const ATextCondition: String): IioWhere;
begin
  Result := Self;
  if ATextCondition.Trim = '' then Exit;
  Self.FWhereItems.Add(TioSqlItemsWhereText.Create(ATextCondition));
end;

function TioWhere._And: IioWhere;
begin
  Result := Self;
  if not IsEmpty then
    Self.FWhereItems.Add(TioDbFactory.LogicRelation._And);
end;

function TioWhere._And(ATextCondition: String): IioWhere;
begin
  Result := Self;
  if ATextCondition.Trim = '' then Exit;
  Self._And;
  Self.Add(ATextCondition)
end;

function TioWhere._ClosePar: IioWhere;
begin
  Result := Self;
  Self.FWhereItems.Add(TioDbFactory.LogicRelation._ClosePar);
end;

function TioWhere._ClosePar(ATextCondition: String): IioWhere;
begin
  Result := Self;
  Self._ClosePar;
  Self.Add(ATextCondition)
end;

function TioWhere._Equal: IioWhere;
begin
  Result := Self;
  Self.FWhereItems.Add(TioDbFactory.CompareOperator._Equal);
end;

function TioWhere._EqualTo(AValue: Double): IioWhere;
begin
  Result := Self._EqualTo(   TValue.From<Double>(AValue)   );
end;

function TioWhere._EqualTo(AValue: Integer): IioWhere;
begin
  Result := Self._EqualTo(   TValue.From<Integer>(AValue)   );
end;

function TioWhere._EqualTo(AValue: TDateTime): IioWhere;
begin
  Result := Self._EqualTo(   TValue.From<TDateTime>(AValue)   );
end;

function TioWhere._EqualTo(AValue: TValue): IioWhere;
begin
  Result := Self;
  Self._Equal;
  Self._Value(AValue);
end;

function TioWhere._Greater: IioWhere;
begin
  Result := Self;
  Self.FWhereItems.Add(TioDbFactory.CompareOperator._Greater);
end;

function TioWhere._GreaterOrEqual: IioWhere;
begin
  Result := Self;
  Self.FWhereItems.Add(TioDbFactory.CompareOperator._GreaterOrEqual);
end;

function TioWhere._GreaterOrEqualThan(AValue: TDateTime): IioWhere;
begin
  Result := Self._GreaterOrEqualThan(   TValue.From<TDateTime>(AValue)   );
end;

function TioWhere._GreaterOrEqualThan(AValue: TValue): IioWhere;
begin
  Result := Self;
  Self._GreaterOrEqual;
  Self._Value(AValue);
end;

function TioWhere._GreaterThan(AValue: TValue): IioWhere;
begin
  Result := Self;
  Self._Greater;
  Self._Value(AValue);
end;

function TioWhere._IsNotNull: IioWhere;
begin
  Result := Self;
  Self.FWhereItems.Add(TioDbFactory.CompareOperator._IsNotNull);
end;

function TioWhere._IsNull: IioWhere;
begin
  Result := Self;
  Self.FWhereItems.Add(TioDbFactory.CompareOperator._IsNull);
end;

function TioWhere._Like: IioWhere;
begin
  Result := Self;
  Self.FWhereItems.Add(TioDbFactory.CompareOperator._Like);
end;

function TioWhere._LikeTo(AValue: TDateTime): IioWhere;
begin
  Result := Self._LikeTo(   TValue.From<TDateTime>(AValue)   );
end;

function TioWhere._LikeTo(AValue: TValue): IioWhere;
begin
  Result := Self;
  Self._Like;
  Self._Value(AValue);
end;

function TioWhere._Lower: IioWhere;
begin
  Result := Self;
  Self.FWhereItems.Add(TioDbFactory.CompareOperator._Lower);
end;

function TioWhere._LowerOrEqual: IioWhere;
begin
  Result := Self;
  Self.FWhereItems.Add(TioDbFactory.CompareOperator._LowerOrEqual);
end;

function TioWhere._LowerOrEqualThan(AValue: TDateTime): IioWhere;
begin
  Result := Self._LowerOrEqualThan(   TValue.From<TDateTime>(AValue)   );
end;

function TioWhere._LowerOrEqualThan(AValue: TValue): IioWhere;
begin
  Result := Self;
  Self._LowerOrEqual;
  Self._Value(AValue);
end;

function TioWhere._LowerThan(AValue: TValue): IioWhere;
begin
  Result := Self;
  Self._Lower;
  Self._Value(AValue);
end;

function TioWhere._And(AWhereCond: IioWhere): IioWhere;
var
  AItem: IioSqlItem;
begin
  Result := Self;
  if (not Assigned(AWhereCond)) or (AWhereCond.IsEmpty) then
    Exit;
  Self._And;
  Self.Add(AWhereCond);
end;

function TioWhere.Add(const AWhereCond: IioWhere): IioWhere;
var
  AItem: IioSqlItem;
begin
  Result := Self;
  if Assigned(AWhereCond) then
    for AItem in AWhereCond.GetWhereItems do Self.FWhereItems.Add(AItem);
end;


function TioWhere.AddDetail(const AMasterPropertyName,
  ATextCondition: String): IioWhere;
begin
  Result := Self.AddDetail(AMasterPropertyName, TioWhereFactory.NewWhere.Add(ATextCondition));
end;

function TioWhere.AddDetail(const AMasterPropertyName: String;
  const AWhereCond: IioWhere): IioWhere;
begin
  Result := Self;
  FDetailsContainer.AddOrUpdate(AMasterPropertyName, AWhereCond);
end;

function TioWhere.ByOID(const AOID:Integer): IioWhere;
begin
  Result := Self;
  Self._PropertyOIDEqualsTo(AOID);
end;

constructor TioWhere.Create;
begin
  FDisableClassFromField := False;
  FLazyLoad      := False;
  FWhereItems := TioWhereFactory.NewWhereItems;
  FDetailsContainer := TioWhereFactory.NewDetailsContainer;
  FOrderBy := nil;
end;

procedure TioWhere.CreateIndex(ACommaSepFieldList: String;
  const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean);
begin
  Self.CreateIndex('', ACommaSepFieldList, AIndexOrientation, AUnique);
end;

procedure TioWhere.CreateIndex(const AIndexName: String;
  ACommaSepFieldList: String; const AIndexOrientation: TioIndexOrientation;
  const AUnique: Boolean);
var
  AResolvedTypeList: IioResolvedTypeList;
  AResolvedTypeName: String;
  AContext: IioContext;
  ATransactionCollection: IioTransactionCollection;
    // Nested
    procedure NestedCreateIndex;
    var
      AQuery: IioQuery;
    begin
      // Create & execute query
      AQuery := TioDbFactory.QueryEngine.GetQueryForCreateIndex(AContext, AIndexName, ACommaSepFieldList, AIndexOrientation, AUnique);
      AQuery.ExecSQL;
    end;
begin
  // Resolve the type and alias
  AResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(FTypeName, FTypeAlias, rmAll);
  // Get the transaction collection
  ATransactionCollection := TioDBFactory.TransactionCollection;
  try
    // Loop for all classes in the sesolved type list
    for AResolvedTypeName in AResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      AContext := TioContextFactory.Context(AResolvedTypeName, Self);
      // Start transaction
      ATransactionCollection.StartTransaction(AContext.GetConnectionDefName);
      // Load the current class data into the list
      NestedCreateIndex;
    end;
    // Commit ALL transactions
    ATransactionCollection.CommitAll;
  except
    // Rollback ALL transactions
    ATransactionCollection.RollbackAll;
    raise;
  end;
end;

procedure TioWhere.Delete;
var
  AResolvedTypeList: IioResolvedTypeList;
  AResolvedTypeName: String;
  AContext: IioContext;
  ATransactionCollection: IioTransactionCollection;
    // Nested
    procedure NestedDelete;
    var
      AQuery: IioQuery;
    begin
      // Create & execute query
      AQuery := TioDbFactory.QueryEngine.GetQueryDelete(AContext);
      AQuery.ExecSQL;
    end;
begin
  // Resolve the type and alias
  AResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(FTypeName, FTypeAlias, rmAll);
  // Get the transaction collection
  ATransactionCollection := TioDBFactory.TransactionCollection;
  try
    // Loop for all classes in the sesolved type list
    for AResolvedTypeName in AResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      AContext := TioContextFactory.Context(AResolvedTypeName, Self);
      // Start transaction
      ATransactionCollection.StartTransaction(AContext.GetConnectionDefName);
      // Load the current class data into the list
      NestedDelete;
    end;
    // Commit ALL transactions
    ATransactionCollection.CommitAll;
  except
    // Rollback ALL transactions
    ATransactionCollection.RollbackAll;
    raise;
  end;
end;

function TioWhere.DisableClassFromField: IioWhere;
begin
  Result := Self;
  FDisableClassFromField := True;
end;

procedure TioWhere.DropIndex(const AIndexName: String);
var
  AResolvedTypeList: IioResolvedTypeList;
  AResolvedTypeName: String;
  AContext: IioContext;
  ATransactionCollection: IioTransactionCollection;
    // Nested
    procedure NestedDropIndex;
    var
      AQuery: IioQuery;
    begin
      // Create & execute query
      AQuery := TioDbFactory.QueryEngine.GetQueryForDropIndex(AContext, AIndexName);
      AQuery.ExecSQL;
    end;
begin
  // Resolve the type and alias
  AResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(FTypeName, FTypeAlias, rmAll);
  // Get the transaction collection
  ATransactionCollection := TioDBFactory.TransactionCollection;
  try
    // Loop for all classes in the sesolved type list
    for AResolvedTypeName in AResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      AContext := TioContextFactory.Context(AResolvedTypeName, Self);
      // Start transaction
      ATransactionCollection.StartTransaction(AContext.GetConnectionDefName);
      // Load the current class data into the list
      NestedDropIndex;
    end;
    // Commit ALL transactions
    ATransactionCollection.CommitAll;
  except
    // Rollback ALL transactions
    ATransactionCollection.RollbackAll;
    raise;
  end;
end;

function TioWhere.GetDetails: IioWhereDetailsContainer;
begin
  Result := FDetailsContainer;
end;

function TioWhere.GetDisableClassFromField: Boolean;
begin
  Result := FDisableClassFromField;
end;

function TioWhere.GetItems: IWhereItems;
begin
  Result := FWhereItems;
end;

function TioWhere.GetOrderByInstance: IioSqlItemWhere;
begin
  Result := FOrderBy;
end;

function TioWhere.GetOrderBySql(const AMap:IioMap): String;
begin
  if Assigned(FOrderBy) then
    Result := FOrderBy.GetSql(AMap)
  else
    Result := '';
end;

function TioWhere.GetSql(const AMap:IioMap; const AddWhere:Boolean): String;
var
  CurrSqlItem: IioSqlItem;
  CurrSqlItemWhere: IioSqlItemWhere;
begin
  // NB: NO inherited
  Result := '';
  if FWhereItems.Count = 0 then Exit;
  if AddWhere then Result := 'WHERE ';
  // Add current SqlItem
  for CurrSqlItem in FWhereItems do
  begin
    if Supports(CurrSqlItem, IioSqlItemWhere, CurrSqlItemWhere) then
      Result := Result + CurrSqlItemWhere.GetSql(AMap)
    else
      Result := Result + CurrSqlItem.GetSql;
  end;
end;

function TioWhere.GetSqlWithClassFromField(const AMap:IioMap; const AIsClassFromField:Boolean; const AClassFromField: IioClassFromField): String;
begin
  Result := Self.GetSql(AMap);
  if AIsClassFromField then
  begin
    if Result = ''
      then Result := 'WHERE '
      else Result := Result + ' AND ';
//    Result := Result + AClassFromField.GetSqlFieldName + ' LIKE ' + TioDbFactory.SqlDataConverter.StringToSQL('%<'+AClassFromField.GetClassName+'>%');
    Result := Result + AClassFromField.GetSqlFieldName + ' LIKE :' + AClassFromField.GetSqlParamName;
  end;
end;

function TioWhere.GetWhereItems: IWhereItems;
begin
  Result := FWhereItems;
end;


function TioWhere.IsEmpty: Boolean;
begin
  Result := (FWhereItems.Count = 0);
end;

function TioWhere.Lazy(const ALazyEnabled: Boolean): IioWhere;
begin
  Result := Self;
  Self.FLazyLoad := ALazyEnabled;
end;

function TioWhere.SetDetailsContainer(
  ADetailsContainer: IioWhereDetailsContainer): IioWhere;
begin
  Result := Self;
  if not Assigned(ADetailsContainer) then
    raise EioException.Create(Self.ClassName + '.SetDetailsContainer: The ADetailsContainer parameter is not valid.');
  Self.FDetailsContainer := ADetailsContainer;
end;

procedure TioWhere.SetOrderBySql(const AOrderByText: String);
begin
  if AOrderByText.IsEmpty then
    FOrderBy := nil
  else
    FOrderBy := TioSqlItemsOrderBy.Create(AOrderByText);
end;

procedure TioWhere.SetType(const ATypeName, ATypeAlias: String; const ATypeInfo:PTypeInfo);
begin
  FTypeName := ATypeName;
  FTypeAlias := ATypeAlias;
  FTypeInfo := ATypeInfo;
end;

function TioWhere.ToActiveListBindSourceAdapter(const AOwner: TComponent; const AAutoLoadData, AOwnsObject: Boolean): TBindSourceAdapter;
var
  AResolvedTypeList: IioResolvedTypeList;
  AContext: IioContext;
begin
  // If the master property type is an interface...
  if TioRttiUtilities.IsAnInterfaceTypeName(FTypeName) then
  begin
    // Resolve the type and alias and get the context
    AResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(FTypeName, FTypeAlias, rmAll);
    AContext := TioContextFactory.Context(AResolvedTypeList[0], Self);
    // Create the BSA
    Result := TioActiveInterfaceListBindSourceAdapter.Create(
      FTypeName,
      FTypeAlias,
      Self,  // Where
      AOwner,
      TList<IInterface>.Create,
      AAutoLoadData)
  end
  // else if the master property type is a class...
  else
  begin
    // Get the context
    AContext := TioContextFactory.Context(FTypeName, Self);
    // Create the BSA
    Result := TioActiveListBindSourceAdapter.Create(
      AContext.GetClassRef,
      Self,
      AOwner,
      TObjectList<TObject>.Create(AOwnsObject),
//        TList<TObject>.Create,
      AAutoLoadData);
  end;
end;





function TioWhere.ToActiveObjectBindSourceAdapter(const AOwner: TComponent; const AAutoLoadData, AOwnsObject: Boolean): TBindSourceAdapter;
var
  AResolvedTypeList: IioResolvedTypeList;
  AContext: IioContext;
begin
  // If the master property type is an interface...
  if TioRttiUtilities.IsAnInterfaceTypeName(FTypeName) then
  begin
    // Resolve the type and alias and get the context
    AResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(FTypeName, FTypeAlias, rmAll);
    AContext := TioContextFactory.Context(AResolvedTypeList[0], Self);
    // Create the BSA
    Result := TioActiveInterfaceObjectBindSourceAdapter.Create(
      FTypeName,
      FTypeAlias,
      Self,  // Where
      AOwner,
      nil,   // AObject:TObject
      AAutoLoadData)  // AutoLoadData
  end
  // else if the master property type is a class...
  else
  begin
    // Get the context
    AContext := TioContextFactory.Context(FTypeName, Self);
    // Create the BSA
    Result := TioActiveObjectBindSourceAdapter.Create(
      AContext.GetClassRef,
      Self,  // Where
      AOwner,
      nil,   // AObject:TObject
      AAutoLoadData,  // AutoLoadData := True
      False);
  end;
end;

procedure TioWhere.ToList(const AList: TObject);
var
  AResolvedTypeList: IioResolvedTypeList;
  AResolvedTypeName: String;
  AContext: IioContext;
  ATransactionCollection: IioTransactionCollection;
  ADuckTypedList: IioDuckTypedList;
    // Nested
    procedure NestedLoadToList;
    var
      AQuery: IioQuery;
      AObj: TObject;
    begin
      // Create & open query
      AQuery := TioDbFactory.QueryEngine.GetQuerySelectForList(AContext);
      AQuery.Open;
      try
        // Loop
        while not AQuery.Eof do
        begin
          // Clean the DataObject (it contains the previous)
          AContext.DataObject := nil;
          // Create the object as TObject
          AObj := TioObjectMakerFactory.GetObjectMaker(AContext.IsClassFromField).MakeObject(AContext, AQuery);
          // Add current object to the list
          ADuckTypedList.Add(AObj);
          // Next
          AQuery.Next;
        end;
      finally
        // Close query
        AQuery.Close;
      end;
    end;
begin
  // Resolve the type and alias
  AResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(FTypeName, FTypeAlias, rmAll);
  // Wrap the list into a DuckTypedList
  ADuckTypedList := TioDuckTypedFactory.DuckTypedList(AList);
  // Get the transaction collection
  ATransactionCollection := TioDBFactory.TransactionCollection;
  try
    // Loop for all classes in the sesolved type list
    for AResolvedTypeName in AResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      AContext := TioContextFactory.Context(AResolvedTypeName, Self);
      // Start transaction
      ATransactionCollection.StartTransaction(AContext.GetConnectionDefName);
      // Load the current class data into the list
      NestedLoadToList;
    end;
    // Commit ALL transactions
    ATransactionCollection.CommitAll;
  except
    // Rollback ALL transactions
    ATransactionCollection.RollbackAll;
    raise;
  end;
end;





function TioWhere.ToList(const AInterfacedListTypeName, AAlias: String; const AOwnsObjects:Boolean): TObject;
begin
  Result := Self.ToList(
              io.di.Locate(AInterfacedListTypeName).Alias(AAlias).GetItem.RttiType,
              AOwnsObjects
            );
end;

function TioWhere.ToList(const AListRttiType: TRttiType; const AOwnsObjects:Boolean): TObject;
begin
  // Create the list
  Result := TioObjectMakerFactory.GetObjectMaker(False).CreateListByRttiType(AListRttiType, AOwnsObjects);
  // Fill the list
  Self.ToList(Result);
end;

function TioWhere.ToList(const AListClassRef: TioClassRef; const AOwnsObjects:Boolean=True): TObject;
begin
  Result := Self.ToList(
              TioRttiUtilities.ClassRefToRttiType(AListClassRef),
              AOwnsObjects
            );
end;

function TioWhere.ToListBindSourceAdapter(AOwner: TComponent; AOwnsObject: Boolean): TBindSourceAdapter;
var
  AContext: IioContext;
begin
  // If the master property type is an interface...
  if TioRttiUtilities.IsAnInterfaceTypeName(FTypeName) then
    Result := TInterfaceListBindSourceAdapter.Create(
      AOwner,
      Self.ToGenericList.OfType<TList<IInterface>>,
      FTypeAlias,
      FTypeName,
      AOwnsObject)
  // else if the master property type is a class...
  else
  begin
    AContext := TioContextFactory.Context(FTypeName);
    Result := TListBindSourceAdapter.Create(
      AOwner,
      Self.ToGenericList.OfType<TList<TObject>>,
      AContext.GetClassRef,
      AOwnsObject);
  end;
end;

function TioWhere.ToMemTable: TFDMemTable;
begin
  Result := TFDMemTable.Create(nil);
  Self.ToMemTable(Result);
end;

procedure TioWhere.ToMemTable(const AMemTable: TFDMemTable);
var
  AResolvedTypeList: IioResolvedTypeList;
  AResolvedTypeName: String;
  AContext: IioContext;
  ATransactionCollection: IioTransactionCollection;
    // Nested
    procedure NestedLoadToMemTable;
    var
      LQry: IioQuery;
    begin
      // Create & open query
      LQry := TioDbFactory.QueryEngine.GetQuerySelectForList(AContext);
      LQry.Open;
      try
        // Copy data to the MemoryTable
        //  NB: Per poter fare in modo che i dati rimangano anche con più passaggi
        //       successivi in base a quante classi implementano l'interfaccia che si sta
        //       caricando (se si tratta di un'interfaccia ovviamente) ho dovuto implementare due chiamate
        //       differenti a CopyDataSet perchè se mantenevo l'opzione 'coStructure' ogni volta azzerava
        //       i records e quindi la prima volta la eseguq con lìopzione sopra citata mentre le volte successive no.
        //       Per sapere se è il primo passaggio verifico se la MemTable.Active = True perchè ho notato che al primo
        //       passaggio la attiva automaticamente.
        if AMemTable.FieldCount > 0 then
        begin
          if not AMemTable.Active then
            AMemTable.Open;
          AMemTable.CopyDataSet(LQry.GetQuery, [coAppend])
        end
        else
          AMemTable.CopyDataSet(LQry.GetQuery, [coStructure, coAppend]);
      finally
        LQry.Close;
      end;
    end;
begin
  // Resolve the type and alias
  AResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(FTypeName, FTypeAlias, rmAll);
  // Get the transaction collection
  ATransactionCollection := TioDBFactory.TransactionCollection;
  try
    // Loop for all classes in the sesolved type list
    for AResolvedTypeName in AResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      AContext := TioContextFactory.Context(AResolvedTypeName, Self);
      // Start transaction
      ATransactionCollection.StartTransaction(AContext.GetConnectionDefName);
      // Load the current class data into the list
      NestedLoadToMemTable;
    end;
    // Commit ALL transactions
    ATransactionCollection.CommitAll;
  except
    // Rollback ALL transactions
    ATransactionCollection.RollbackAll;
    raise;
  end;
end;

function TioWhere.ToObject(const AObj:TObject): TObject;
var
  AResolvedTypeList: IioResolvedTypeList;
  AResolvedTypeName: String;
  AContext: IioContext;
  ATransactionCollection: IioTransactionCollection;
    // Nested
    function NestedLoadToObject: TObject;
    var
      AQuery: IioQuery;
    begin
      // Init
      Result := nil;
      // Create & open query
      AQuery := TioDbFactory.QueryEngine.GetQuerySelectForList(AContext);
      AQuery.Open;
      try
        // If a record is fuìound then load the object and return True
        if not AQuery.Eof then
          // Create the object as TObject
          Result := TioObjectMakerFactory.GetObjectMaker(AContext.IsClassFromField).MakeObject(AContext, AQuery);
      finally
        // Close query
        AQuery.Close;
      end;
    end;
begin
  // if it is a LazyLoad....
  if FLazyLoad then
    Exit(   TioLazyLoadFactory.LazyLoadObject(FTypeInfo, FTypeName, FTypeAlias, '', 0, Self) as TObject   );
  // Resolve the type and alias
  AResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(FTypeName, FTypeAlias, rmAll);
  // Get the transaction collection
  ATransactionCollection := TioDBFactory.TransactionCollection;
  try
    // Loop for all classes in the sesolved type list
    for AResolvedTypeName in AResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      AContext := TioContextFactory.Context(AResolvedTypeName, Self, AObj);
      // Start transaction
      ATransactionCollection.StartTransaction(AContext.GetConnectionDefName);
      // Load the current class object is founded
      Result := NestedLoadToObject;
      // If there is a result (an object) then exit;
      if Assigned(Result) then
        Break;
    end;
    // Commit ALL transactions
    ATransactionCollection.CommitAll;
  except
    // Rollback ALL transactions
    ATransactionCollection.RollbackAll;
    raise;
  end;
end;

function TioWhere.ToObjectBindSourceAdapter(AOwner: TComponent; AOwnsObject: Boolean): TBindSourceAdapter;
var
  AContext: IioContext;
begin
  // If the master property type is an interface...
  if TioRttiUtilities.IsAnInterfaceTypeName(FTypeName) then
    Result := TInterfaceObjectBindSourceAdapter.Create(
      AOwner,
      Self.ToObject,
      FTypeAlias,
      FTypeName)
  // else if the master property type is a class...
  else
  begin
    AContext := TioContextFactory.Context(FTypeName);
    Result := TObjectBindSourceAdapter.Create(
      AOwner,
      Self.ToObject,
      AContext.GetClassRef,
      AOwnsObject);
  end;
end;

function TioWhere._Not(ATextCondition: String): IioWhere;
begin
  Result := Self;
  if ATextCondition.Trim = '' then Exit;
  Self._Not;
  Self.Add(ATextCondition)
end;

function TioWhere._NotEqual: IioWhere;
begin
  Result := Self;
  Self.FWhereItems.Add(TioDbFactory.CompareOperator._NotEqual);
end;

function TioWhere._NotEqualTo(AValue: TDateTime): IioWhere;
begin
  Result := Self._NotEqualTo(   TValue.From<TDateTime>(AValue)   );
end;

function TioWhere._NotEqualTo(AValue: TValue): IioWhere;
begin
  Result := Self;
  Self._NotEqual;
  Self._Value(AValue);
end;

function TioWhere._Not: IioWhere;
begin
  Result := Self;
  Self.FWhereItems.Add(TioDbFactory.LogicRelation._Not);
end;

function TioWhere._OpenPar: IioWhere;
begin
  Result := Self;
  Self.FWhereItems.Add(TioDbFactory.LogicRelation._OpenPar);
end;

function TioWhere._Or: IioWhere;
begin
  Result := Self;
  if not IsEmpty then
    Self.FWhereItems.Add(TioDbFactory.LogicRelation._Or);
end;

function TioWhere._OpenPar(ATextCondition: String): IioWhere;
begin
  Result := Self;
  Self._OpenPar;
  Self.Add(ATextCondition)
end;

function TioWhere._Or(ATextCondition: String): IioWhere;
begin
  Result := Self;
  if ATextCondition.Trim = '' then Exit;
  Self._Or;
  Self.Add(ATextCondition)
end;

function TioWhere._OrderBy(const AOrderByInstance: IioSqlItemWhere): IioWhere;
begin
  Result := Self;
  FOrderBy := AOrderByInstance;
end;

function TioWhere._OrderBy(const ATextOrderBy: String): IioWhere;
begin
  Result := Self;
  Self.SetOrderBySql(ATextOrderBy);
end;

function TioWhere._Property(APropertyName: String): IioWhere;
begin
  Result := Self;
  Self.FWhereItems.Add(TioDbFactory.WhereItemProperty(APropertyName));
end;

function TioWhere._PropertyEqualsTo(APropertyName: String;
  AValue: TDateTime): IioWhere;
begin
  Result := Self._PropertyEqualsTo(APropertyName,   TValue.From<TDateTime>(AValue)   );
end;

function TioWhere._PropertyEqualsTo(APropertyName: String; AValue: TValue): IioWhere;
begin
  Result := Self;
  Self.FWhereItems.Add(TioDbFactory.WhereItemPropertyEqualsTo(APropertyName, AValue));
end;

function TioWhere._PropertyOID: IioWhere;
begin
  Result := Self;
  Self.FWhereItems.Add(TioDbFactory.WhereItemPropertyOID);
end;

function TioWhere._PropertyOIDEqualsTo(AValue: TValue): IioWhere;
begin
  Result := Self;
  Self.FWhereItems.Add(TioDbFactory.WhereItemPropertyOIDEqualsTo(AValue));
end;

function TioWhere._ToObjectInternalByClassOnly(const AObj:TObject=nil): TObject;
var
  AContext: IioContext;
  AQuery: IioQuery;
begin
  // Init
  Result := AObj;
  // Get the Context
  AContext := TioContextFactory.Context(FTypeName, Self, Result);
  // Create & open query
  AQuery := TioDbFactory.QueryEngine.GetQuerySelectForObject(AContext);
  AQuery.Open;
  try
    // Create the object as TObject
    if not AQuery.IsEmpty then
      Result := TioObjectMakerFactory.GetObjectMaker(AContext.IsClassFromField).MakeObject(AContext, AQuery);
  finally
    // Close query
    AQuery.Close;
  end;
end;

function TioWhere._Value(AValue: Integer): IioWhere;
begin
  Result := Self._Value(   TValue.From<Integer>(AValue)   );
end;

function TioWhere._Value(AValue: Double): IioWhere;
begin
  Result := Self._Value(   TValue.From<Double>(AValue)   );
end;

function TioWhere._Value(AValue: TDateTime): IioWhere;
begin
  Result := Self._Value(   TValue.From<TDateTime>(AValue)   );
end;

function TioWhere.ToGenericList: TioWhereGenericListDestination;
begin
  Result := TioWhereGenericListDestination.Create(Self);
end;

function TioWhere._Value(AValue: TValue): IioWhere;
begin
  Result := Self;
  Self.FWhereItems.Add(TioDbFactory.WhereItemTValue(AValue));
end;

function TioWhere._Where(AWhere:IioWhere): IioWhere;
begin
  // Clear all previous items
  Result := Self._Where;
  // Add the source items and details
  if not Assigned(AWhere) then
    Exit;
  Self.Add(AWhere);
  Self.FDetailsContainer := AWhere.Details;
  Self.FOrderBy := AWhere.GetOrderByInstance;
end;

function TioWhere._Where(ATextCondition: String): IioWhere;
begin
  // Clear all previous items
  Result := Self._Where;
  // Add the spcified condition
  if ATextCondition <> ''
    then Self.Add(ATextCondition);
end;

function TioWhere._Where: IioWhere;
begin
  Result := Self;
  // Clear Items
  Self.FWhereItems.Clear;
end;

{ TioWhere<T,TRESULT> }

function TioWhere<T>.Add(const ATextCondition: String): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self).Add(ATextCondition);
end;

function TioWhere<T>._And: IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._And;
end;

function TioWhere<T>._ClosePar: IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._ClosePar;
end;

function TioWhere<T>._Not: IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Not;
end;

function TioWhere<T>._OpenPar: IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._OpenPar;
end;

function TioWhere<T>._Or: IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Or;
end;

function TioWhere<T>.Add(const AWhereCond: IioWhere): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self).Add(AWhereCond);
end;

function TioWhere<T>.AddDetail(const AMasterPropertyName,
  ATextCondition: String): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self).AddDetail(AMasterPropertyName, ATextCondition);
end;

function TioWhere<T>.AddDetail(const AMasterPropertyName: String;
  const AWhereCond: IioWhere): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self).AddDetail(AMasterPropertyName, AWhereCond);
end;

function TioWhere<T>.ByOID(const AOID: Integer): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self).ByOID(AOID);
end;

function TioWhere<T>.DisableClassFromField: IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self).DisableClassFromField;
end;

function TioWhere<T>.Lazy(const ALazyEnabled: Boolean): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self).Lazy(ALazyEnabled);
end;

function TioWhere<T>.SetDetailsContainer(
  ADetailsContainer: IioWhereDetailsContainer): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self).SetDetailsContainer(ADetailsContainer);
end;

function TioWhere<T>.ToInterfacedList: IioList<T>;
begin
  Result := TioContainersFactory.GetInterfacedList<T>;
  Self.ToList(   TObject(Result)   );
end;

//function TioWhere<T>.ToInterfacedObjectList(const AOwnsObjects:Boolean): IioList<T>;
//begin
//  Result := TioContainersFactory.GetInterfacedObjectList<T>(AOwnsObjects);
//  Self.ToList(   TObject(Result)   );
//end;

function TioWhere<T>.ToList: TList<T>;
begin
  Result := TList<T>.Create;
  Self.ToList(Result);
end;

function TioWhere<T>.ToObject(const AObj:TObject): T;
begin
  Result := TioRttiUtilities.CastObjectToGeneric<T>(   TioWhere(Self).ToObject(AObj)   );
end;

//function TioWhere<T>.ToObjectList(const AOwnsObjects: Boolean): TObjectList<TObject>;
//begin
//  Result := TObjectList<T>.Create(AOwnsObjects);
//  Self.ToList(Result);
//end;

function TioWhere<T>._And(ATextCondition: String): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._And(ATextCondition);
end;

function TioWhere<T>._ClosePar(ATextCondition: String): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._ClosePar(ATextCondition);
end;

function TioWhere<T>._Equal: IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Equal;
end;

function TioWhere<T>._EqualTo(AValue: Double): IioWhere<T>;
begin
  Result := Self._EqualTo(   TValue.From<Double>(AValue)   );
end;

function TioWhere<T>._EqualTo(AValue: Integer): IioWhere<T>;
begin
  Result := Self._EqualTo(   TValue.From<Integer>(AValue)   );
end;

function TioWhere<T>._EqualTo(AValue: TDateTime): IioWhere<T>;
begin
  Result := Self._EqualTo(   TValue.From<TDateTime>(AValue)   );
end;

function TioWhere<T>._EqualTo(AValue: TValue): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._EqualTo(AValue);
end;

function TioWhere<T>._Greater: IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Greater;
end;

function TioWhere<T>._GreaterOrEqual: IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._GreaterOrEqual;
end;

function TioWhere<T>._GreaterOrEqualThan(AValue: TDateTime): IioWhere<T>;
begin
  Result := Self._GreaterOrEqualThan(   TValue.From<TDateTime>(AValue)   );
end;

function TioWhere<T>._GreaterOrEqualThan(AValue: TValue): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._GreaterOrEqualThan(AValue);
end;

function TioWhere<T>._GreaterThan(AValue: TValue): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._GreaterThan(AValue);
end;

function TioWhere<T>._IsNotNull: IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._IsNotNull;
end;

function TioWhere<T>._IsNull: IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._IsNull;
end;

function TioWhere<T>._Like: IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Like;
end;

function TioWhere<T>._LikeTo(AValue: TDateTime): IioWhere<T>;
begin
  Result := Self._LikeTo(   TValue.From<TDateTime>(AValue)   );
end;

function TioWhere<T>._LikeTo(AValue: TValue): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._LikeTo(AValue);
end;

function TioWhere<T>._Lower: IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Lower;
end;

function TioWhere<T>._LowerOrEqual: IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._LowerOrEqual;
end;

function TioWhere<T>._LowerOrEqualThan(AValue: TDateTime): IioWhere<T>;
begin
  Result := Self._LowerOrEqualThan(   TValue.From<TDateTime>(AValue)   );
end;

function TioWhere<T>._LowerOrEqualThan(AValue: TValue): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._LowerOrEqualThan(AValue);
end;

function TioWhere<T>._LowerThan(AValue: TValue): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._LowerThan(AValue);
end;

function TioWhere<T>._Not(ATextCondition: String): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Not(ATextCondition);
end;

function TioWhere<T>._NotEqual: IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._NotEqual;
end;

function TioWhere<T>._NotEqualTo(AValue: TDateTime): IioWhere<T>;
begin
  Result := Self._NotEqualTo(   TValue.From<TDateTime>(AValue)   );
end;

function TioWhere<T>._NotEqualTo(AValue: TValue): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._NotEqualTo(AValue);
end;

function TioWhere<T>._OpenPar(ATextCondition: String): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._OpenPar(ATextCondition);
end;

function TioWhere<T>._Or(ATextCondition: String): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Or(ATextCondition);
end;

function TioWhere<T>._OrderBy(
  const AOrderByInstance: IioSqlItemWhere): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._OrderBy(AOrderByInstance);
end;

function TioWhere<T>._OrderBy(const ATextOrderBy: String): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._OrderBy(ATextOrderBy);
end;

function TioWhere<T>._Property(APropertyName: String): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Property(APropertyName);
end;

function TioWhere<T>._PropertyEqualsTo(APropertyName: String;
  AValue: TDateTime): IioWhere<T>;
begin
  Result := Self._PropertyEqualsTo(APropertyName,   TValue.From<TDateTime>(AValue)   );
end;

function TioWhere<T>._PropertyEqualsTo(APropertyName: String; AValue: TValue): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._PropertyEqualsTo(APropertyName, AValue);
end;

function TioWhere<T>._PropertyOID: IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._PropertyOID;
end;

function TioWhere<T>._PropertyOIDEqualsTo(AValue: TValue): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._PropertyOIDEqualsTo(AValue);
end;

function TioWhere<T>._Value(AValue: TDateTime): IioWhere<T>;
begin
  Result := Self._Value(   TValue.From<TDateTime>(AValue)   );
end;

function TioWhere<T>._Value(AValue: TValue): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Value(AValue);
end;

function TioWhere<T>._Where(AWhereCond:IioWhere): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Where(AWhereCond);
end;

function TioWhere<T>._Where(ATextCondition: String): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Where(ATextCondition);
end;

function TioWhere<T>._Where: IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Where;
end;

function TioWhere<T>._And(AWhereCond: IioWhere): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._And(AWhereCond);
end;


function TioWhere._GreaterThan(AValue: TDateTime): IioWhere;
begin
  Result := Self._GreaterThan(   TValue.From<TDateTime>(AValue)   );
end;

function TioWhere._LowerThan(AValue: TDateTime): IioWhere;
begin
  Result := Self._LowerThan(   TValue.From<TDateTime>(AValue)   );
end;

function TioWhere<T>._GreaterThan(AValue: TDateTime): IioWhere<T>;
begin
  Result := Self._GreaterThan(   TValue.From<TDateTime>(AValue)   );
end;

function TioWhere<T>._LowerThan(AValue: TDateTime): IioWhere<T>;
begin
  Result := Self._LowerThan(   TValue.From<TDateTime>(AValue)   );
end;

function TioWhere<T>._Value(AValue: Double): IioWhere<T>;
begin
  Result := Self._Value(   TValue.From<Double>(AValue)   );
end;

function TioWhere<T>._Value(AValue: Integer): IioWhere<T>;
begin
  Result := Self._Value(   TValue.From<Integer>(AValue)   );
end;

end.





