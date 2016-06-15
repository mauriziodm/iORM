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



unit iORM.Where.Interfaces;

interface

uses
  iORM.Context.Properties.Interfaces, iORM.Context.Table.Interfaces,
  iORM.Where.SqlItems.Interfaces, System.Generics.Collections,
  iORM.Interfaces, iORM.Containers.Interfaces, System.Rtti,
  iORM.CommonTypes, iORM.Resolver.Interfaces, System.Classes,
  Data.Bind.ObjectScope, iORM.Where.Destinations,
  iORM.Context.Map.Interfaces, FireDAC.Comp.Client, System.TypInfo;

type

  IioWhere = interface;

  // WhereItems container
  IWhereItems = IioList<IioSqlItem>;

  // WhereDetails container
  TioWhereDetailsContainerInternalInstance = TDictionary<String, IioWhere>;
  IioWhereDetailsContainer = interface
    ['{0BB026DD-F087-4B57-9CB6-59D4F80A3792}']
    function Count: Integer;
    function Get(const AMasterPropertyName: string): IioWhere;
    procedure AddOrUpdate(const AMasterPropertyName: string; const AWhere: IioWhere);
    procedure Clear;
  end;

  // Where interface
  IioWhere = interface
    ['{CB0292C6-A7A8-4951-A867-D5A5F6D8F053}']
    function GetWhereItems: IWhereItems;
    function GetSql(const AMap:IioMap; const AddWhere:Boolean=True): String;
    function GetSqlWithClassFromField(const AMap:IioMap; const AIsClassFromField:Boolean; const AClassFromField: IioClassFromField): String;
    function GetOrderBySql(const AMap:IioMap): String;
    function GetOrderByInstance: IioSqlItemWhere;
    procedure SetOrderBySql(const AOrderByText:String);
    function GetDisableClassFromField: Boolean;
    procedure SetType(const ATypeName, ATypeAlias: String; const ATypeInfo:PTypeInfo);
    function IsEmpty: Boolean;
    // ------ Generic destinationz
    function ToGenericList: TioWhereGenericListDestination;
    // ------ Destination methods
    function ToMemTable: TFDMemTable; overload;
    procedure ToMemTable(const AMemTable:TFDMemTable); overload;

    function _ToObjectInternalByClassOnly(const AObj:TObject=nil): TObject;
    function ToObject(const AObj:TObject=nil): TObject;

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
    function ByOID(const constAOID:Integer): IioWhere;
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
    function _Where(AWhereCond:IioWhere): IioWhere; overload;
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
    // Details property
    function GetDetails: IioWhereDetailsContainer;
    property Details:IioWhereDetailsContainer read GetDetails;
    // Items property
    function GetItems: IWhereItems;
    property Items: IWhereItems read GetItems;
  end;

  // Where interface (generic version)
  IioWhere<T> = interface(IioWhere)
    ['{EB4137B9-D4F7-41EE-AD24-F3B12BA35CAC}']
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

end.
