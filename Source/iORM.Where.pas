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
  strict protected
    FTypeName, FTypeAlias: String;
    FTypeInfo: PTypeInfo;
    FDisableClassFromField: Boolean;
    FLazyLoad: Boolean;
    FOrderBy: IioSqlItemWhere;
    FConnectionName: String;
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
    // TypeName
    function GetTypeName: String;
    procedure SetTypeName(const Value: String);
    // TypeAlias
    function GetTypeAlias: String;
    procedure SetTypeAlias(const Value: String);
    // TypeInfo
    function GetTypeInfo: PTypeInfo;
    procedure SetTypeInfo(const Value: PTypeInfo);
  public
    constructor Create; overload;
    function GetWhereItems: IWhereItems;
    function GetSql(const AMap:IioMap; const AddWhere:Boolean=True): String;
    function GetSqlWithClassFromField(const AMap:IioMap; const AIsClassFromField:Boolean; const AClassFromField: IioClassFromField): String;
    function GetDisableClassFromField: Boolean;
    function GetOrderByInstance: IioSqlItemWhere;
    function GetOrderBySql(const AMap:IioMap): String;
    procedure SetOrderBySql(const AOrderByText:String);
    function WhereConditionExists: Boolean;
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
    function IsLazy: Boolean;
    function ConnectionName(const AConnectionName:String): IioWhere;
    function GetConnectionName: String;
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
    function _GreaterThan(AValue:Double): IioWhere; overload;
    function _GreaterThan(AValue:Integer): IioWhere; overload;
    function _LowerThan(AValue:TValue): IioWhere; overload;
    function _LowerThan(AValue:TDateTime): IioWhere; overload;
    function _LowerThan(AValue:Double): IioWhere; overload;
    function _LowerThan(AValue:Integer): IioWhere; overload;
    function _GreaterOrEqualThan(AValue:TValue): IioWhere; overload;
    function _GreaterOrEqualThan(AValue:TDateTime): IioWhere; overload;
    function _GreaterOrEqualThan(AValue:Double): IioWhere; overload;
    function _GreaterOrEqualThan(AValue:Integer): IioWhere; overload;
    function _LowerOrEqualThan(AValue:TValue): IioWhere; overload;
    function _LowerOrEqualThan(AValue:TDateTime): IioWhere; overload;
    function _LowerOrEqualThan(AValue:Double): IioWhere; overload;
    function _LowerOrEqualThan(AValue:Integer): IioWhere; overload;
    function _NotEqualTo(AValue:TValue): IioWhere; overload;
    function _NotEqualTo(AValue:TDateTime): IioWhere; overload;
    function _NotEqualTo(AValue:Double): IioWhere; overload;
    function _NotEqualTo(AValue:Integer): IioWhere; overload;
    function _LikeTo(AValue:TValue): IioWhere; overload;
    function _LikeTo(AValue:TDateTime): IioWhere; overload;
    function _LikeTo(AValue:Double): IioWhere; overload;
    function _LikeTo(AValue:Integer): IioWhere; overload;
    // ------
    function _Where: IioWhere; overload;
    function _Where(AWhere:IioWhere): IioWhere; overload;
    function _Where(ATextCondition:String): IioWhere; overload;
    function _Property(APropertyName:String): IioWhere;
    function _PropertyOID: IioWhere;

    function _PropertyEqualsTo(APropertyName:String; AValue:TValue): IioWhere; overload;
    function _PropertyEqualsTo(APropertyName:String; AValue:TDateTime): IioWhere; overload;
    function _PropertyEqualsTo(APropertyName:String; AValue:Double): IioWhere; overload;
    function _PropertyEqualsTo(APropertyName:String; AValue:Integer): IioWhere; overload;

    function _PropertyIsNull(APropertyName:String): IioWhere;
    function _PropertyIsNotNull(APropertyName:String): IioWhere;

    function _PropertyOIDEqualsTo(AValue:Integer): IioWhere;

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
    property TypeName: String read GetTypeName write SetTypeName;
    property TypeAlias: String read GetTypeAlias write SetTypeAlias;
    property TypeInfo: PTypeInfo read GetTypeInfo write SetTypeInfo;
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
    function ConnectionName(const AConnectionName:String): IioWhere<T>;
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
    function _GreaterThan(AValue:Double): IioWhere<T>; overload;
    function _GreaterThan(AValue:Integer): IioWhere<T>; overload;
    function _LowerThan(AValue:TValue): IioWhere<T>; overload;
    function _LowerThan(AValue:TDateTime): IioWhere<T>; overload;
    function _LowerThan(AValue:Double): IioWhere<T>; overload;
    function _LowerThan(AValue:Integer): IioWhere<T>; overload;
    function _GreaterOrEqualThan(AValue:TValue): IioWhere<T>; overload;
    function _GreaterOrEqualThan(AValue:TDateTime): IioWhere<T>; overload;
    function _GreaterOrEqualThan(AValue:Double): IioWhere<T>; overload;
    function _GreaterOrEqualThan(AValue:Integer): IioWhere<T>; overload;
    function _LowerOrEqualThan(AValue:TValue): IioWhere<T>; overload;
    function _LowerOrEqualThan(AValue:TDateTime): IioWhere<T>; overload;
    function _LowerOrEqualThan(AValue:Double): IioWhere<T>; overload;
    function _LowerOrEqualThan(AValue:Integer): IioWhere<T>; overload;
    function _NotEqualTo(AValue:TValue): IioWhere<T>; overload;
    function _NotEqualTo(AValue:TDateTime): IioWhere<T>; overload;
    function _NotEqualTo(AValue:Double): IioWhere<T>; overload;
    function _NotEqualTo(AValue:Integer): IioWhere<T>; overload;
    function _LikeTo(AValue:TValue): IioWhere<T>; overload;
    function _LikeTo(AValue:TDateTime): IioWhere<T>; overload;
    function _LikeTo(AValue:Double): IioWhere<T>; overload;
    function _LikeTo(AValue:Integer): IioWhere<T>; overload;
    // ------
    function _Where: IioWhere<T>; overload;
    function _Where(AWhereCond:IioWhere): IioWhere<T>; overload;
    function _Where(ATextCondition:String): IioWhere<T>; overload;
    function _Property(APropertyName:String): IioWhere<T>;
    function _PropertyOID: IioWhere<T>;

    function _PropertyEqualsTo(APropertyName:String; AValue:TValue): IioWhere<T>; overload;
    function _PropertyEqualsTo(APropertyName:String; AValue:TDateTime): IioWhere<T>; overload;
    function _PropertyEqualsTo(APropertyName:String; AValue:Double): IioWhere<T>; overload;
    function _PropertyEqualsTo(APropertyName:String; AValue:Integer): IioWhere<T>; overload;

    function _PropertyIsNull(APropertyName:String): IioWhere<T>;
    function _PropertyIsNotNull(APropertyName:String): IioWhere<T>;

    function _PropertyOIDEqualsTo(AValue:Integer): IioWhere<T>;

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
  iORM.Exceptions, FireDAC.Comp.DataSet, iORM.LazyLoad.Factory,
  iORM.Strategy.Factory;

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
  if not WhereConditionExists then
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

function TioWhere._GreaterOrEqualThan(AValue: Integer): IioWhere;
begin
  Result := Self._GreaterOrEqualThan(   TValue.From<Integer>(AValue)   );
end;

function TioWhere._GreaterOrEqualThan(AValue: Double): IioWhere;
begin
  Result := Self._GreaterOrEqualThan(   TValue.From<Double>(AValue)   );
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

function TioWhere._LowerOrEqualThan(AValue: Double): IioWhere;
begin
  Result := Self._LowerOrEqualThan(   TValue.From<Double>(AValue)   );
end;

function TioWhere._LowerOrEqualThan(AValue: Integer): IioWhere;
begin
  Result := Self._LowerOrEqualThan(   TValue.From<Integer>(AValue)   );
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
begin
  Result := Self;
  if (not Assigned(AWhereCond)) or (AWhereCond.WhereConditionExists) then
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

function TioWhere.ConnectionName(const AConnectionName: String): IioWhere;
begin
  Result := Self;
  Self.FConnectionName := AConnectionName;
  // Set the connection name in the deails where container even (for details propagation)
  Self.Details.SetConnectionName(AConnectionName);
end;

constructor TioWhere.Create;
begin
  FDisableClassFromField := False;
  FLazyLoad      := False;
  FWhereItems := TioWhereFactory.NewWhereItems;
  FDetailsContainer := TioWhereFactory.NewDetailsContainer;
  FOrderBy := nil;
  FConnectionName := '';
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
begin
  TioStrategyFactory.GetStrategy(FConnectionName).Delete(Self);
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

function TioWhere.GetConnectionName: String;
begin
  Result := FConnectionName;
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

function TioWhere.GetTypeAlias: String;
begin
  Result := FTypeAlias;
end;

function TioWhere.GetTypeInfo: PTypeInfo;
begin
  Result := FTypeInfo;
end;

function TioWhere.GetTypeName: String;
begin
  Result := FTypeName;
end;

function TioWhere.GetWhereItems: IWhereItems;
begin
  Result := FWhereItems;
end;


function TioWhere.WhereConditionExists: Boolean;
begin
  Result := (FWhereItems.Count = 0);
end;

function TioWhere.IsLazy: Boolean;
begin
  Result := FLazyLoad;
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

procedure TioWhere.SetTypeAlias(const Value: String);
begin
  FTypeAlias := Value;
end;

procedure TioWhere.SetTypeInfo(const Value: PTypeInfo);
begin
  FTypeInfo := Value;
end;

procedure TioWhere.SetTypeName(const Value: String);
begin
  FTypeName := Value;
end;

function TioWhere.ToActiveListBindSourceAdapter(const AOwner: TComponent; const AAutoLoadData, AOwnsObject: Boolean): TBindSourceAdapter;
var
  AContext: IioContext;
begin
  // If the master property type is an interface...
  if TioRttiUtilities.IsAnInterfaceTypeName(FTypeName) then
  begin
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
      AAutoLoadData);
  end;
end;





function TioWhere.ToActiveObjectBindSourceAdapter(const AOwner: TComponent; const AAutoLoadData, AOwnsObject: Boolean): TBindSourceAdapter;
var
  AContext: IioContext;
begin
  // If the master property type is an interface...
  if TioRttiUtilities.IsAnInterfaceTypeName(FTypeName) then
  begin
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
begin
  TioStrategyFactory.GetStrategy(FConnectionName).LoadList(Self, AList);
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
begin
  TioStrategyFactory.GetStrategy(FConnectionName).LoadDataSet(Self, AMemTable);
end;

function TioWhere.ToObject(const AObj:TObject): TObject;
begin
  // if it is a LazyLoad....
  if Self.IsLazy then
    Result := TioLazyLoadFactory.LazyLoadObject(Self.TypeInfo, Self.TypeName, Self.TypeAlias, '', 0, Self) as TObject
  // else...
  else
    Result := TioStrategyFactory.GetStrategy(FConnectionName).LoadObject(Self, AObj);
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
  if not WhereConditionExists then
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
  AValue: Double): IioWhere;
begin
  Result := Self._PropertyEqualsTo(APropertyName,   TValue.From<Double>(AValue)   );
end;

function TioWhere._PropertyEqualsTo(APropertyName: String;
  AValue: Integer): IioWhere;
begin
  Result := Self._PropertyEqualsTo(APropertyName,   TValue.From<Integer>(AValue)   );
end;

function TioWhere._PropertyIsNotNull(APropertyName: String): IioWhere;
begin
  Result := Self;
  Self._Property(APropertyName);
  Self._IsNotNull;
end;

function TioWhere._PropertyIsNull(APropertyName: String): IioWhere;
begin
  Result := Self;
  Self._Property(APropertyName);
  Self._IsNull;
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

function TioWhere._PropertyOIDEqualsTo(AValue: Integer): IioWhere;
begin
  Result := Self;
  Self.FWhereItems.Add(TioDbFactory.WhereItemPropertyOIDEqualsTo(   TValue.From<Integer>(AValue)   ));
end;

function TioWhere._ToObjectInternalByClassOnly(const AObj:TObject=nil): TObject;
begin
  Result := TioStrategyFactory.GetStrategy(FConnectionName).LoadObjectByClassOnly(Self, AObj);
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
  Self.FConnectionName := AWhere.GetConnectionName;
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

function TioWhere<T>.ConnectionName(const AConnectionName: String): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self).ConnectionName(AConnectionName);
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

function TioWhere<T>._LikeTo(AValue: Integer): IioWhere<T>;
begin
  Result := Self._LikeTo(   TValue.From<Integer>(AValue)   );
end;

function TioWhere<T>._LikeTo(AValue: Double): IioWhere<T>;
begin
  Result := Self._LikeTo(   TValue.From<Double>(AValue)   );
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

function TioWhere<T>._NotEqualTo(AValue: Integer): IioWhere<T>;
begin
  Result := Self._NotEqualTo(   TValue.From<Integer>(AValue)   );
end;

function TioWhere<T>._NotEqualTo(AValue: Double): IioWhere<T>;
begin
  Result := Self._NotEqualTo(   TValue.From<Double>(AValue)   );
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

function TioWhere<T>._PropertyOIDEqualsTo(AValue: Integer): IioWhere<T>;
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

function TioWhere._GreaterThan(AValue: Integer): IioWhere;
begin
  Result := Self._GreaterThan(   TValue.From<Integer>(AValue)   );
end;

function TioWhere._GreaterThan(AValue: Double): IioWhere;
begin
  Result := Self._GreaterThan(   TValue.From<Double>(AValue)   );
end;

function TioWhere._LikeTo(AValue: Integer): IioWhere;
begin
  Result := Self._LikeTo(   TValue.From<Integer>(AValue)   );
end;

function TioWhere._LikeTo(AValue: Double): IioWhere;
begin
  Result := Self._LikeTo(   TValue.From<Double>(AValue)   );
end;

function TioWhere._LowerThan(AValue: Double): IioWhere;
begin
  Result := Self._LowerThan(   TValue.From<Double>(AValue)   );
end;

function TioWhere._LowerThan(AValue: Integer): IioWhere;
begin
  Result := Self._LowerThan(   TValue.From<Integer>(AValue)   );
end;

function TioWhere._NotEqualTo(AValue: Integer): IioWhere;
begin
  Result := Self._NotEqualTo(   TValue.From<Integer>(AValue)   );
end;

function TioWhere._NotEqualTo(AValue: Double): IioWhere;
begin
  Result := Self._NotEqualTo(   TValue.From<Double>(AValue)   );
end;

function TioWhere<T>._GreaterOrEqualThan(AValue: Integer): IioWhere<T>;
begin
  Result := Self._GreaterOrEqualThan(   TValue.From<Integer>(AValue)   );
end;

function TioWhere<T>._GreaterOrEqualThan(AValue: Double): IioWhere<T>;
begin
  Result := Self._GreaterOrEqualThan(   TValue.From<Double>(AValue)   );
end;

function TioWhere<T>._GreaterThan(AValue: Integer): IioWhere<T>;
begin
  Result := Self._GreaterThan(   TValue.From<Integer>(AValue)   );
end;

function TioWhere<T>._GreaterThan(AValue: Double): IioWhere<T>;
begin
  Result := Self._GreaterThan(   TValue.From<Double>(AValue)   );
end;

function TioWhere<T>._LowerOrEqualThan(AValue: Double): IioWhere<T>;
begin
  Result := Self._LowerOrEqualThan(   TValue.From<Double>(AValue)   );
end;

function TioWhere<T>._LowerOrEqualThan(AValue: Integer): IioWhere<T>;
begin
  Result := Self._LowerOrEqualThan(   TValue.From<Integer>(AValue)   );
end;

function TioWhere<T>._LowerThan(AValue: Double): IioWhere<T>;
begin
  Result := Self._LowerThan(   TValue.From<Double>(AValue)   );
end;

function TioWhere<T>._LowerThan(AValue: Integer): IioWhere<T>;
begin
  Result := Self._LowerThan(   TValue.From<Integer>(AValue)   );
end;

function TioWhere<T>._PropertyEqualsTo(APropertyName: String;
  AValue: Double): IioWhere<T>;
begin
  Result := Self._PropertyEqualsTo(APropertyName,   TValue.From<Double>(AValue)   );
end;

function TioWhere<T>._PropertyEqualsTo(APropertyName: String;
  AValue: Integer): IioWhere<T>;
begin
  Result := Self._PropertyEqualsTo(APropertyName,   TValue.From<Integer>(AValue)   );
end;

function TioWhere<T>._PropertyIsNotNull(APropertyName: String): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._PropertyIsNotNull(APropertyName);
end;

function TioWhere<T>._PropertyIsNull(APropertyName: String): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._PropertyIsNull(APropertyName);
end;

end.









