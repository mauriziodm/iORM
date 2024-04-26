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
unit iORM.Where;

interface

uses
  System.Rtti,
  iORM.CommonTypes,
  iORM.Interfaces,
  iORM.SqlItems,
  iORM.Context.Properties.Interfaces, iORM.Context.Table.Interfaces,
  System.Classes, iORM.Where.SqlItems.Interfaces,
  iORM.Resolver.Interfaces, iORM.Where.Interfaces,
  System.Generics.Collections, iORM.Where.Destinations,
  iORM.Context.Map.Interfaces, FireDAC.Comp.Client, System.TypInfo,
  iORM.Utilities, iORM.LiveBindings.CommonBSAPaging,
  iORM.Context.Interfaces, iORM.StdActions.Interfaces,
  iORM.LiveBindings.Interfaces, DJSON.Attributes;

type

  // Where conditions (standard version)
  TioWhere = class(TioSqlItem, IioWhere, IioWhereInternal)
  strict protected
    FTypeName, FTypeAlias: String;
    FIntent: TioPersistenceIntentType;
    FTypeInfo: PTypeInfo;
    FDisableStrictlyTrueClass: Boolean;
    FLazyLoad: Boolean;
    FLazyProps: String;
    FLimitRows, FLimitOffset: Integer;
    FOrderBy: IioSqlItemWhere;
    FClearListBefore: Boolean;
    FCacheable: Boolean;
    // Contiene le clausole where specificate fino ad ora
    FWhereItems: TWhereItems;
    // Contiene le eventuali clausole where di eventuali dettagli, la chiave è una stringa
    // e contiene il nome della MasterPropertyName
    FDetailsContainer: IioWhereDetailsContainer;
    // Riferimento al BSACommonPageManager che potrebbe essere usato per la gestione
    // del paging da parte del CommonBSAPersistence passando per l'ActiveBindSourceAdapter
    // M.M. 12/06/21
    // Aggiunto attributo per non serializzare l'oggetto TioCommonBSAPageManager
    // Mauri 30/04/22 aggiunto campo FPagingObjExists per risolvere un problema con HttpConnection
    //        (dopo la deserializzazione lato server era in uno stato non ben definito)
    FPagingObj: TioCommonBSAPageManager;
    FPagingObjExists: Boolean;
    // ETM related fields
    //  NB: Dall'esterno viene impostato solo il campo "FETMfor" (BindSource) che però poi mi dava dei problemi con
    //       la connessione http perchè non poteva essere serializzato in modo corretto visto che è un BindSource
    //       che però serve a ricavare la classe e l'ID dell'oggetto corrente del BindSource puntato appunto da
    //       "FETMFor" per ricavare la sua classe e il suo ID e poi impostare la condizione where (come testo) per filtrare
    //       i TimeSlots dell'ETM.
    //       Quindi per non andare a rifare tutto il discorso dell'ETM qui sull'oggetto where ho deciso di aggiungere
    //       anche il campo "FETMFor_Sql", questo verrà valorizzato dal metodo "FillETM_Sql" prima
    //       di essere usato per la creazione della query e, nel caso di una connessione http, prima della serializzazione
    //       (nella HttpPersistenceStrategy) in modo che sia poi serializzato normalmente (è una stringa).
    [djSkip]
    FETMfor: IioBindSource;
    FETMFor_Sql: String;
    procedure ClearETM_Sql; inline;
    procedure FillETM_Sql;  inline;

    procedure _Show(const ADataObject: TObject; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String; const AForceTypeNameUse: Boolean); overload;
    procedure _Show(const ADataObject: IInterface; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String; const AForceTypeNameUse: Boolean); overload;

    procedure _AddCriteria(const APropertyName: String; const ACompareOp: TioCompareOp; AValue: TValue); overload;
    procedure _AddCriteria(const APropertyName: String; const ACompareOp: TioCompareOp); overload;
    procedure _AddCriteria(const ALogicOp: TioLogicOp; const APropertyName: String; const ACompareOp: TioCompareOp); overload;
    procedure _AddCriteria(const ALogicOp: TioLogicOp; const APropertyName: String; const ACompareOp: TioCompareOp; AValue: TValue); overload;
    procedure _AddCriteria(const AText: String); overload;
    procedure _AddCriteria(const AWhere: IioWhere); overload;
    procedure _AddCriteria(const ALogicOp: TioLogicOp; const AWhere: IioWhere); overload;
    // -------------------------------------------
    // Details property
    function GetDetails: IioWhereDetailsContainer;
    // Items property
    function GetItems: TWhereItems;
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
    constructor Create; reintroduce; overload;
    destructor Destroy; override;
    procedure Clear(const AClearWhereDetails: Boolean = True);
    function GetClearListBefore: Boolean;
    function GetWhereItems: TWhereItems;
    function GetSql(const AMap: IioMap; const AddWhere: Boolean = True): String; reintroduce;
    function GetSqlWithTrueClass(const AMap: IioMap; const AIsTrueClass: Boolean; const ATrueClass: IioTrueClass): String;
    function GetDisableStrictlyTrueClass: Boolean;
    function GetOrderByInstance: IioSqlItemWhere;
    function GetOrderBySql(const AMap: IioMap): String;
    function GetLimitRows: Integer;
    function GetLimitOffset: Integer;
    function GetPagingObj: TObject; // TObject to avoid circular reference
    procedure SetPagingObj(const APagingObj: TObject); // TObject to avoid circular reference
    procedure SetETMfor(const AETMfor: IInterface); // IInterface to avoid circular reference
    function GetETMfor: IInterface; // IInterface to avoid circular reference
    procedure SetOrderBySql(const AOrderByText: String);
    function WhereConditionExists: Boolean;
    // ------ Generic destinationz
    function ToGenericList: TioWhereGenericListDestination;
    // ------ Destination methods
    function ToMemTable: TFDMemTable; overload;
    procedure ToMemTable(const AMemTable: TFDMemTable); overload;

    function ToLazyObject(const AObj: TObject = nil): TObject; overload;
    function ToLazyObject(const AIntf: IInterface): TObject; overload;

    function _ToObjectInternalByClassOnly(const AIntent: TioPersistenceIntentType; const AObj: TObject = nil): TObject;
    function ToObject(const AObj: TObject = nil): TObject; overload;
    function ToObject(const AIntf: IInterface): TObject; overload;

    procedure ToList(const AList: TObject); overload;
    function ToList(const AListRttiType: TRttiType; const AOwnsObjects: Boolean = True): TObject; overload;
    function ToList(const AInterfacedListTypeName: String; const AAlias: String = ''; const AOwnsObjects: Boolean = True): TObject; overload;
    function ToList(const AListClassRef: TioClassRef; const AOwnsObjects: Boolean = True): TObject; overload;
    function ClearListBefore(const AClearListBefore: Boolean = True): IioWhere;

    function Count: Integer;
    function Exists: Boolean;
    function IsEmpty: Boolean;
    function NotExists: Boolean;

    procedure Delete;

    procedure Show(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''; const AForceTypeNameUse: Boolean = False); virtual;
    procedure ShowList(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); virtual;
    procedure ShowEach(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''; const AForceTypeNameUse: Boolean = False); virtual;

    // ------ Conditions
    function ByID(const AID: Integer): IioWhere;
    function Add(const ATextCondition: String): IioWhere; overload;
    function Add(const AWhereCond: IioWhere): IioWhere; overload;
    function AddDetail(const AMasterPropertyName, ATextCondition: String): IioWhere; overload;
    function AddDetail(const AMasterPropertyName: String; const AWhereCond: IioWhere): IioWhere; overload;
    function DisableStrictlyTrueClass: IioWhere;
    function SetDetailsContainer(ADetailsContainer: IioWhereDetailsContainer): IioWhere;
    function Lazy(const ALazyEnabled: Boolean = True): IioWhere;
    function LazyProps(const ALazyProps: String): IioWhere;
    function IsLazyProp(const AClassName: String; const AProperty: IioProperty): Boolean;
    function _Limit(const ARows: Integer; const AOffset: Integer = 0): IioWhere;
    function LimitExists: Boolean;
    function Cacheable: IioWhere;
    function IsCacheable: Boolean;
    function Intent(const AIntent: TioPersistenceIntentType): IioWhere;
    // --------------------------------------------------------------
    // ------ Logic relations
    function _And: IioWhere; overload;
    function _Or: IioWhere; overload;
    function _Not: IioWhere; overload;
    function _OpenPar: IioWhere; overload;
    function _ClosePar: IioWhere; overload;
    // ------ Logic relations with TextCondition
    function _And(ATextCondition: String): IioWhere; overload;
    function _Or(ATextCondition: String): IioWhere; overload;
    function _Not(ATextCondition: String): IioWhere; overload;
    // ------ Logic relations with TioWere
    function _And(AWhereCond: IioWhere): IioWhere overload;
    // ------ Compare operators
    function _Equal: IioWhere;
    function _NotEqual: IioWhere;
    function _Greater: IioWhere;
    function _Lower: IioWhere;
    function _GreaterOrEqual: IioWhere;
    function _LowerOrEqual: IioWhere;
    function _Like: IioWhere;
    function _NotLike: IioWhere;
    function _IsNull: IioWhere;
    function _IsNotNull: IioWhere;
    // ------ Compare operators with TValue
    function _EqualTo(AValue: TValue): IioWhere; overload;
    function _EqualTo(AValue: TDateTime): IioWhere; overload;
    function _EqualTo(AValue: Double): IioWhere; overload;
    function _EqualTo(AValue: Integer): IioWhere; overload;
    function _NotEqualTo(AValue: TValue): IioWhere; overload;
    function _NotEqualTo(AValue: TDateTime): IioWhere; overload;
    function _NotEqualTo(AValue: Double): IioWhere; overload;
    function _NotEqualTo(AValue: Integer): IioWhere; overload;
    function _GreaterThan(AValue: TValue): IioWhere; overload;
    function _GreaterThan(AValue: TDateTime): IioWhere; overload;
    function _GreaterThan(AValue: Double): IioWhere; overload;
    function _GreaterThan(AValue: Integer): IioWhere; overload;
    function _LowerThan(AValue: TValue): IioWhere; overload;
    function _LowerThan(AValue: TDateTime): IioWhere; overload;
    function _LowerThan(AValue: Double): IioWhere; overload;
    function _LowerThan(AValue: Integer): IioWhere; overload;
    function _GreaterOrEqualThan(AValue: TValue): IioWhere; overload;
    function _GreaterOrEqualThan(AValue: TDateTime): IioWhere; overload;
    function _GreaterOrEqualThan(AValue: Double): IioWhere; overload;
    function _GreaterOrEqualThan(AValue: Integer): IioWhere; overload;
    function _LowerOrEqualThan(AValue: TValue): IioWhere; overload;
    function _LowerOrEqualThan(AValue: TDateTime): IioWhere; overload;
    function _LowerOrEqualThan(AValue: Double): IioWhere; overload;
    function _LowerOrEqualThan(AValue: Integer): IioWhere; overload;
    function _LikeTo(AValue: TValue): IioWhere; overload;
    function _LikeTo(AValue: TDateTime): IioWhere; overload;
    function _LikeTo(AValue: Double): IioWhere; overload;
    function _LikeTo(AValue: Integer): IioWhere; overload;
    function _NotLikeTo(AValue: TValue): IioWhere; overload;
    function _NotLikeTo(AValue: TDateTime): IioWhere; overload;
    function _NotLikeTo(AValue: Double): IioWhere; overload;
    function _NotLikeTo(AValue: Integer): IioWhere; overload;
    // ------ New criteria
    function _And(const APropertyName: String; const ACompareOp: TioCompareOp): IioWhere; overload;
    function _And(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: Variant): IioWhere; overload;
    function _And(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: TObject): IioWhere; overload;
    function _And(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: IInterface): IioWhere; overload;
    function _Or(const APropertyName: String; const ACompareOp: TioCompareOp): IioWhere; overload;
    function _Or(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: Variant): IioWhere; overload;
    function _Or(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: TObject): IioWhere; overload;
    function _Or(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: IInterface): IioWhere; overload;
    function _Not(const APropertyName: String; const ACompareOp: TioCompareOp): IioWhere; overload;
    function _Not(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: Variant): IioWhere; overload;
    function _Not(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: TObject): IioWhere; overload;
    function _Not(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: IInterface): IioWhere; overload;
    // ------
    function _Where: IioWhere; overload;
    function _Where(AWhere: IioWhere): IioWhere; overload;
    function _Where(ATextCondition: String): IioWhere; overload;
    function _Where(const APropertyName: String; const ACompareOp: TioCompareOp): IioWhere; overload;
    function _Where(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: Variant): IioWhere; overload;
    function _Where(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: TObject): IioWhere; overload;
    function _Where(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: IInterface): IioWhere; overload;
    function _Property(APropertyName: String): IioWhere;
    function _PropertyOID: IioWhere;
    function _PropertyEqualsTo(APropertyName: String; AValue: TValue): IioWhere; overload;
    function _PropertyEqualsTo(APropertyName: String; AValue: TDateTime): IioWhere; overload;
    function _PropertyEqualsTo(APropertyName: String; AValue: Double): IioWhere; overload;
    function _PropertyEqualsTo(APropertyName: String; AValue: Integer): IioWhere; overload;
    function _PropertyIsNull(APropertyName: String): IioWhere;
    function _PropertyIsNotNull(APropertyName: String): IioWhere;
    function _PropertyOIDEqualsTo(AValue: Integer): IioWhere;
    function _Value(AValue: TValue): IioWhere; overload;
    function _Value(AValue: TDateTime): IioWhere; overload;
    function _Value(AValue: Integer): IioWhere; overload;
    function _Value(AValue: Double): IioWhere; overload;
    function _Value(AValue: TObject): IioWhere; overload;
    function _Value(AValue: IInterface): IioWhere; overload;
    function _OrderBy(const ATextOrderBy: String): IioWhere; overload;
    function _OrderBy(const AOrderByInstance: IioSqlItemWhere): IioWhere; overload;
    procedure CreateIndex(ACommaSepFieldList: String; const AIndexOrientation: TioIndexOrientation = ioAscending; const AUnique: Boolean = False); overload;
    procedure CreateIndex(const AIndexName: String; ACommaSepFieldList: String; const AIndexOrientation: TioIndexOrientation = ioAscending;
      const AUnique: Boolean = False); overload;
    procedure DropIndex(const AIndexName: String);
    // ----- Properties -----
    property Details: IioWhereDetailsContainer read GetDetails;
    property Items: TWhereItems read GetItems;
    property TypeAlias: String read GetTypeAlias write SetTypeAlias;
    property TypeInfo: PTypeInfo read GetTypeInfo write SetTypeInfo;
    property TypeName: String read GetTypeName write SetTypeName;
  end;

  // Where conditions (generic version)
  TioWhere<T> = class(TioWhere, IioWhere<T>)
  public
    // ------ Destination methods
    function ToLazyObject(const AObj: TObject = nil): T; reintroduce; overload;
    function ToObject(const AObj: TObject = nil): T; reintroduce; overload;
    function ToList: TList<T>; overload;
    function ClearListBefore(const AClearListBefore: Boolean = True): IioWhere<T>;

    // procedure Show(const AVVMAlias:String=''; const AForceTypeNameUse:Boolean=False); override;

    // ------ Conditions
    function ByID(const AID: Integer): IioWhere<T>;
    function Add(const ATextCondition: String): IioWhere<T>; overload;
    function Add(const AWhereCond: IioWhere): IioWhere<T>; overload;
    function AddDetail(const AMasterPropertyName, ATextCondition: String): IioWhere<T>; overload;
    function AddDetail(const AMasterPropertyName: String; const AWhereCond: IioWhere): IioWhere<T>; overload;
    function DisableStrictlyTrueClass: IioWhere<T>;
    function SetDetailsContainer(ADetailsContainer: IioWhereDetailsContainer): IioWhere<T>;
    function Lazy(const ALazyEnabled: Boolean = True): IioWhere<T>;
    function LazyProps(const ALazyProps: String): IioWhere<T>;
    function _Limit(const ARows: Integer; const AOffset: Integer = 0): IioWhere<T>;
    function Cacheable: IioWhere<T>;
    function Intent(const AIntent: TioPersistenceIntentType): IioWhere<T>;
    // ------ Logic relations
    function _And: IioWhere<T>; overload;
    function _Or: IioWhere<T>; overload;
    function _Not: IioWhere<T>; overload;
    function _OpenPar: IioWhere<T>; overload;
    function _ClosePar: IioWhere<T>; overload;
    // ------ Logic relations with TextCondition
    function _And(ATextCondition: String): IioWhere<T>; overload;
    function _Or(ATextCondition: String): IioWhere<T>; overload;
    function _Not(ATextCondition: String): IioWhere<T>; overload;
    // ------ Logic relations with TioWere
    function _And(AWhereCond: IioWhere): IioWhere<T>; overload;
    // ------ Compare operators
    function _Equal: IioWhere<T>;
    function _NotEqual: IioWhere<T>;
    function _Greater: IioWhere<T>;
    function _Lower: IioWhere<T>;
    function _GreaterOrEqual: IioWhere<T>;
    function _LowerOrEqual: IioWhere<T>;
    function _Like: IioWhere<T>;
    function _NotLike: IioWhere<T>;
    function _IsNull: IioWhere<T>;
    function _IsNotNull: IioWhere<T>;
    // ------ Compare operators with TValue
    function _EqualTo(AValue: TValue): IioWhere<T>; overload;
    function _EqualTo(AValue: TDateTime): IioWhere<T>; overload;
    function _EqualTo(AValue: Double): IioWhere<T>; overload;
    function _EqualTo(AValue: Integer): IioWhere<T>; overload;
    function _NotEqualTo(AValue: TValue): IioWhere<T>; overload;
    function _NotEqualTo(AValue: TDateTime): IioWhere<T>; overload;
    function _NotEqualTo(AValue: Double): IioWhere<T>; overload;
    function _NotEqualTo(AValue: Integer): IioWhere<T>; overload;
    function _GreaterThan(AValue: TValue): IioWhere<T>; overload;
    function _GreaterThan(AValue: TDateTime): IioWhere<T>; overload;
    function _GreaterThan(AValue: Double): IioWhere<T>; overload;
    function _GreaterThan(AValue: Integer): IioWhere<T>; overload;
    function _LowerThan(AValue: TValue): IioWhere<T>; overload;
    function _LowerThan(AValue: TDateTime): IioWhere<T>; overload;
    function _LowerThan(AValue: Double): IioWhere<T>; overload;
    function _LowerThan(AValue: Integer): IioWhere<T>; overload;
    function _GreaterOrEqualThan(AValue: TValue): IioWhere<T>; overload;
    function _GreaterOrEqualThan(AValue: TDateTime): IioWhere<T>; overload;
    function _GreaterOrEqualThan(AValue: Double): IioWhere<T>; overload;
    function _GreaterOrEqualThan(AValue: Integer): IioWhere<T>; overload;
    function _LowerOrEqualThan(AValue: TValue): IioWhere<T>; overload;
    function _LowerOrEqualThan(AValue: TDateTime): IioWhere<T>; overload;
    function _LowerOrEqualThan(AValue: Double): IioWhere<T>; overload;
    function _LowerOrEqualThan(AValue: Integer): IioWhere<T>; overload;
    function _LikeTo(AValue: TValue): IioWhere<T>; overload;
    function _LikeTo(AValue: TDateTime): IioWhere<T>; overload;
    function _LikeTo(AValue: Double): IioWhere<T>; overload;
    function _LikeTo(AValue: Integer): IioWhere<T>; overload;
    function _NotLikeTo(AValue: TValue): IioWhere<T>; overload;
    function _NotLikeTo(AValue: TDateTime): IioWhere<T>; overload;
    function _NotLikeTo(AValue: Double): IioWhere<T>; overload;
    function _NotLikeTo(AValue: Integer): IioWhere<T>; overload;
    // ------ New criteria
    function _And(const APropertyName: String; const ACompareOp: TioCompareOp): IioWhere<T>; overload;
    function _And(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: Variant): IioWhere<T>; overload;
    function _And(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: TObject): IioWhere<T>; overload;
    function _And(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: IInterface): IioWhere<T>; overload;
    function _Or(const APropertyName: String; const ACompareOp: TioCompareOp): IioWhere<T>; overload;
    function _Or(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: Variant): IioWhere<T>; overload;
    function _Or(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: TObject): IioWhere<T>; overload;
    function _Or(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: IInterface): IioWhere<T>; overload;
    function _Not(const APropertyName: String; const ACompareOp: TioCompareOp): IioWhere<T>; overload;
    function _Not(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: Variant): IioWhere<T>; overload;
    function _Not(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: TObject): IioWhere<T>; overload;
    function _Not(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: IInterface): IioWhere<T>; overload;
    // ------
    function _Where: IioWhere<T>; overload;
    function _Where(AWhereCond: IioWhere): IioWhere<T>; overload;
    function _Where(ATextCondition: String): IioWhere<T>; overload;
    function _Where(const APropertyName: String; const ACompareOp: TioCompareOp): IioWhere<T>; overload;
    function _Where(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: Variant): IioWhere<T>; overload;
    function _Where(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: TObject): IioWhere<T>; overload;
    function _Where(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: IInterface): IioWhere<T>; overload;
    function _Property(APropertyName: String): IioWhere<T>;
    function _PropertyOID: IioWhere<T>;
    function _PropertyEqualsTo(APropertyName: String; AValue: TValue): IioWhere<T>; overload;
    function _PropertyEqualsTo(APropertyName: String; AValue: TDateTime): IioWhere<T>; overload;
    function _PropertyEqualsTo(APropertyName: String; AValue: Double): IioWhere<T>; overload;
    function _PropertyEqualsTo(APropertyName: String; AValue: Integer): IioWhere<T>; overload;
    function _PropertyIsNull(APropertyName: String): IioWhere<T>;
    function _PropertyIsNotNull(APropertyName: String): IioWhere<T>;
    function _PropertyOIDEqualsTo(AValue: Integer): IioWhere<T>;
    function _Value(AValue: TValue): IioWhere<T>; overload;
    function _Value(AValue: TDateTime): IioWhere<T>; overload;
    function _Value(AValue: Double): IioWhere<T>; overload;
    function _Value(AValue: Integer): IioWhere<T>; overload;
    function _Value(AValue: TObject): IioWhere<T>; overload;
    function _Value(AValue: IInterface): IioWhere<T>; overload;
    function _OrderBy(const ATextOrderBy: String): IioWhere<T>; overload;
    function _OrderBy(const AOrderByInstance: IioSqlItemWhere): IioWhere<T>; overload;
  end;

implementation

uses
  iORM.DB.Factory, iORM.Context.Factory, System.SysUtils, iORM.DuckTyped.Interfaces, iORM.DuckTyped.Factory, iORM.ObjectsForge.Factory,
  iORM.RttiContext.Factory, iORM, iORM.Where.SqlItems, iORM.DB.Interfaces, iORM.Resolver.Factory,
  iORM.Where.Factory, iORM.Exceptions, FireDAC.Comp.DataSet, iORM.LazyLoad.Factory, iORM.PersistenceStrategy.Factory,
  iORM.MVVM.Interfaces, iORM.Abstraction, iORM.Context.Container, System.StrUtils,
  iORM.ObjectsForge.Interfaces, iORM.ETM.Engine;

{ TioWhere }

function TioWhere.Add(const ATextCondition: String): IioWhere;
begin
  Result := Self;
  if ATextCondition.Trim = '' then
    Exit;
  Self.FWhereItems.Add(TioSqlItemsWhereText.Create(ATextCondition));
end;

function TioWhere._And: IioWhere;
begin
  Result := Self;
  if WhereConditionExists then
    Self.FWhereItems.Add(TioDbFactory.LogicRelation._And);
end;

function TioWhere._And(ATextCondition: String): IioWhere;
begin
  Result := Self;
  if ATextCondition.Trim = '' then
    Exit;
  Self._And;
  Self.Add(ATextCondition)
end;

function TioWhere._ClosePar: IioWhere;
begin
  Result := Self;
  Self.FWhereItems.Add(TioDbFactory.LogicRelation._ClosePar);
end;

procedure TioWhere._AddCriteria(const APropertyName: String; const ACompareOp: TioCompareOp);
begin
  _AddCriteria(APropertyName, ACompareOp, TValue.Empty);
end;

procedure TioWhere._AddCriteria(const APropertyName: String; const ACompareOp: TioCompareOp; AValue: TValue);
begin
  FWhereItems.Add(TioDBFactory.WhereItemCriteria(APropertyName, ACompareOp, AValue));
end;

procedure TioWhere._AddCriteria(const ALogicOp: TioLogicOp; const APropertyName: String; const ACompareOp: TioCompareOp; AValue: TValue);
begin
  if WhereConditionExists then
    FWhereItems.Add(TioDbFactory.LogicRelation.LogicOpToLogicRelation(ALogicOp));
  _AddCriteria(APropertyName, ACompareOp, AValue);
end;

procedure TioWhere._AddCriteria(const ALogicOp: TioLogicOp; const APropertyName: String; const ACompareOp: TioCompareOp);
begin
  if WhereConditionExists then
    FWhereItems.Add(TioDbFactory.LogicRelation.LogicOpToLogicRelation(ALogicOp));
  _AddCriteria(APropertyName, ACompareOp);
end;

function TioWhere._And(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: Variant): IioWhere;
begin
  Result := Self;
  _AddCriteria(loAnd, APropertyName, ACompareOp, TValue.FromVariant(AValue));
end;

function TioWhere._And(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: TObject): IioWhere;
begin
  Result := Self;
  _AddCriteria(loAnd, APropertyName, ACompareOp, TValue.From<TObject>(AValue));
end;

procedure TioWhere._AddCriteria(const AWhere: IioWhere);
var
  AItem: IioSqlItem;
begin
  if Assigned(AWhere) then
    for AItem in AWhere.GetWhereItems do
      FWhereItems.Add(AItem);
end;

procedure TioWhere._AddCriteria(const ALogicOp: TioLogicOp; const AWhere: IioWhere);
begin
  if Assigned(AWhere) and AWhere.WhereConditionExists then
  begin
    if Self.WhereConditionExists then
      FWhereItems.Add(TioDbFactory.LogicRelation.LogicOpToLogicRelation(ALogicOp));
    _OpenPar;
    _AddCriteria(AWhere);
    _ClosePar;
  end;
end;

procedure TioWhere._AddCriteria(const AText: String);
begin
  if not AText.IsEmpty then
    FWhereItems.Add(TioSqlItemsWhereText.Create(AText));
end;

function TioWhere._And(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: IInterface): IioWhere;
begin
  Result := Self;
  _AddCriteria(loAnd, APropertyName, ACompareOp, TValue.From<IInterface>(AValue));
end;

function TioWhere._And(const APropertyName: String; const ACompareOp: TioCompareOp): IioWhere;
begin
  Result := Self;
  _AddCriteria(loAnd, APropertyName, ACompareOp);
end;

function TioWhere._Equal: IioWhere;
begin
  Result := Self;
  Self.FWhereItems.Add(TioDbFactory.CompareOperator._Equal);
end;

function TioWhere._EqualTo(AValue: Double): IioWhere;
begin
  Result := Self._EqualTo(TValue.From<Double>(AValue));
end;

function TioWhere._EqualTo(AValue: Integer): IioWhere;
begin
  Result := Self._EqualTo(TValue.From<Integer>(AValue));
end;

function TioWhere._EqualTo(AValue: TDateTime): IioWhere;
begin
  Result := Self._EqualTo(TValue.From<TDateTime>(AValue));
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
  Result := Self._GreaterOrEqualThan(TValue.From<Integer>(AValue));
end;

function TioWhere._GreaterOrEqualThan(AValue: Double): IioWhere;
begin
  Result := Self._GreaterOrEqualThan(TValue.From<Double>(AValue));
end;

function TioWhere._GreaterOrEqualThan(AValue: TDateTime): IioWhere;
begin
  Result := Self._GreaterOrEqualThan(TValue.From<TDateTime>(AValue));
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
  Result := Self._LikeTo(TValue.From<TDateTime>(AValue));
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
  Result := Self._LowerOrEqualThan(TValue.From<Double>(AValue));
end;

function TioWhere._LowerOrEqualThan(AValue: Integer): IioWhere;
begin
  Result := Self._LowerOrEqualThan(TValue.From<Integer>(AValue));
end;

function TioWhere._LowerOrEqualThan(AValue: TDateTime): IioWhere;
begin
  Result := Self._LowerOrEqualThan(TValue.From<TDateTime>(AValue));
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
  if (not Assigned(AWhereCond)) or (not AWhereCond.WhereConditionExists) then
    Exit;
  Self._And;
  Self.Add(AWhereCond);
end;

function TioWhere.AddDetail(const AMasterPropertyName, ATextCondition: String): IioWhere;
begin
  Result := Self.AddDetail(AMasterPropertyName, TioWhereFactory.NewWhere.Add(ATextCondition));
end;

function TioWhere.AddDetail(const AMasterPropertyName: String; const AWhereCond: IioWhere): IioWhere;
begin
  Result := Self;
  FDetailsContainer.AddOrUpdate(AMasterPropertyName, AWhereCond);
end;

function TioWhere.ByID(const AID: Integer): IioWhere;
begin
  Result := Self;
  Self._PropertyOIDEqualsTo(AID);
end;

function TioWhere.Cacheable: IioWhere;
begin
  Result := Self;
  FCacheable := True;
end;

procedure TioWhere.Clear(const AClearWhereDetails: Boolean = True);
begin
  FWhereItems.Clear;
  if AClearWhereDetails then
    FDetailsContainer.Clear;
  ClearETM_Sql;
end;

procedure TioWhere.ClearETM_Sql;
begin
  FETMFor_Sql := IO_STRING_NULL_VALUE;
end;

procedure TioWhere.FillETM_Sql;
begin
  if Assigned(FETMfor) and FETMfor.IsActive and Assigned(FETMfor.Current) then
    FETMFor_Sql := TioEtmEngine._InternalBuildWhereTextFor(FETMfor.Current);
end;

function TioWhere.ClearListBefore(const AClearListBefore: Boolean = True): IioWhere;
begin
  Result := Self;
  FClearListBefore := AClearListBefore;
end;

constructor TioWhere.Create;
begin
  TioApplication.CheckIfAbstractionLayerComponentExists;
  FIntent := itRegular;
  FDisableStrictlyTrueClass := False;
  FLazyLoad := False;
  FLazyProps := '';
  FWhereItems := TioWhereFactory.NewWhereItems;
  FDetailsContainer := TioWhereFactory.NewDetailsContainer;
  FOrderBy := nil;
  FLimitRows := 0;
  FLimitOffset := 0;
  FPagingObj := nil;
  FPagingObjExists := False;
  FClearListBefore := False;
  FCacheable := False;
  FETMfor := nil;
  ClearETM_Sql;
end;

procedure TioWhere.CreateIndex(ACommaSepFieldList: String; const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean);
begin
  Self.CreateIndex('', ACommaSepFieldList, AIndexOrientation, AUnique);
end;

procedure TioWhere.CreateIndex(const AIndexName: String; ACommaSepFieldList: String; const AIndexOrientation: TioIndexOrientation; const AUnique: Boolean);
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
    AQuery := TioDbFactory.QueryEngine.GetQueryCreateIndex(AContext, AIndexName, ACommaSepFieldList, AIndexOrientation, AUnique);
    AQuery.ExecSQL;
  end;

begin
  // Resolve the type and alias
  AResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(FTypeName, FTypeAlias, rmAllDistinctByConnectionAndTable);
  // Get the transaction collection
  ATransactionCollection := TioDbFactory.TransactionCollection;
  try
    // Loop for all classes in the sesolved type list
    for AResolvedTypeName in AResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      AContext := TioContextFactory.Context(itRegular, AResolvedTypeName, Self, nil, nil, '', '', BL_DEFAULT);
      // Start transaction
      ATransactionCollection.StartTransaction(AContext.GetTable.GetConnectionDefName);
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
  TioPersistenceStrategyFactory.GetStrategy('').Delete(Self);
end;

destructor TioWhere.Destroy;
begin
  FWhereItems.Free;
  inherited;
end;

function TioWhere.DisableStrictlyTrueClass: IioWhere;
begin
  Result := Self;
  FDisableStrictlyTrueClass := True;
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
    AQuery := TioDbFactory.QueryEngine.GetQueryDropIndex(AContext, AIndexName);
    AQuery.ExecSQL;
  end;

begin
  // Resolve the type and alias
  AResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(FTypeName, FTypeAlias, rmAllDistinctByConnectionAndTable);
  // Get the transaction collection
  ATransactionCollection := TioDbFactory.TransactionCollection;
  try
    // Loop for all classes in the sesolved type list
    for AResolvedTypeName in AResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      AContext := TioContextFactory.Context(itRegular, AResolvedTypeName, Self, nil, nil, '', '', BL_DEFAULT);
      // Start transaction
      ATransactionCollection.StartTransaction(AContext.GetTable.GetConnectionDefName);
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

function TioWhere.Exists: Boolean;
begin
  Result := Count > 0;
end;

function TioWhere.Count: Integer;
begin
  Result := TioPersistenceStrategyFactory.GetStrategy('').Count(Self);
end;

function TioWhere.GetClearListBefore: Boolean;
begin
  Result := FClearListBefore;
end;

function TioWhere.GetDetails: IioWhereDetailsContainer;
begin
  Result := FDetailsContainer;
end;

function TioWhere.GetDisableStrictlyTrueClass: Boolean;
begin
  Result := FDisableStrictlyTrueClass;
end;

function TioWhere.GetETMfor: IInterface;
begin
  result := FETMfor;
end;

function TioWhere.GetItems: TWhereItems;
begin
  Result := FWhereItems;
end;

function TioWhere.GetLimitOffset: Integer;
begin
  Result := FLimitOffset;
  // Eventuali parametri limit e offset specificati manualmente hanno la precedenza
  // se però non ci sono e un PagingObj (TioCommonBSAPageManager) è assegnato e
  // attivo allora chiede a lui
  if FPagingObjExists and (Result = 0) and (FPagingObj <> nil) and FPagingObj.Enabled then
    Result := FPagingObj.GetSqlLimitOffset;
end;

function TioWhere.GetLimitRows: Integer;
begin
  Result := FLimitRows;
  // Eventuali parametri limit e offset specificati manualmente hanno la precedenza
  // se però non ci sono e un PagingObj (TioCommonBSAPageManager) è assegnato e
  // attivo allora chiede a lui
  if FPagingObjExists and (Result = 0) and (FPagingObj <> nil) and FPagingObj.Enabled then
    Result := FPagingObj.GetSqlLimit;
end;

function TioWhere.GetOrderByInstance: IioSqlItemWhere;
begin
  Result := FOrderBy;
end;

function TioWhere.GetOrderBySql(const AMap: IioMap): String;
begin
  if Assigned(FOrderBy) then
    Result := FOrderBy.GetSql(AMap)
  else
    Result := '';
end;

function TioWhere.GetPagingObj: TObject;
begin
  Result := FPagingObj;
end;

function TioWhere.GetSql(const AMap: IioMap; const AddWhere: Boolean): String;
var
  CurrSqlItem: IioSqlItem;
  CurrSqlItemWhere: IioSqlItemWhere;
begin
  // NB: NO inherited
  Result := '';
  if (FWhereItems.Count = 0) and (FETMFor_Sql = IO_STRING_NULL_VALUE) then
    Exit;
  if AddWhere then
    Result := 'WHERE ';
  // ETMfor: NB: le due righe qui sotto erano il vecchio codice che dava problemi con la connessione http (vedi commento in dichiarazione variabili)
//  if Assigned(FETMfor) and FETMfor.IsActive and Assigned(FETMfor.Current) then
//    Result := Result + TioEtmEngine._InternalBuildWhereTextFor(FETMfor.Current);
  if FETMFor_Sql <> IO_STRING_NULL_VALUE then
    Result := Result + FETMFor_Sql;
  // Add current SqlItem
  for CurrSqlItem in FWhereItems do
  begin
    if Supports(CurrSqlItem, IioSqlItemWhere, CurrSqlItemWhere) then
      Result := Result + CurrSqlItemWhere.GetSql(AMap)
    else
      Result := Result + CurrSqlItem.GetSql;
  end;
end;

function TioWhere.GetSqlWithTrueClass(const AMap: IioMap; const AIsTrueClass: Boolean; const ATrueClass: IioTrueClass): String;
begin
  Result := Self.GetSql(AMap);
  if AIsTrueClass then
  begin
    if Result = '' then
      Result := 'WHERE '
    else
      Result := Result + ' AND ';
    // Result := Result + ATrueClass.GetSqlFieldName + ' LIKE ' + TioDbFactory.SqlDataConverter.StringToSQL('%<'+ATrueClass.GetClassName+'>%');
    Result := Result + ATrueClass.GetSqlFieldName + ' LIKE :' + ATrueClass.GetSqlParamName;
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

function TioWhere.GetWhereItems: TWhereItems;
begin
  Result := FWhereItems;
end;

function TioWhere.WhereConditionExists: Boolean;
begin
  Result := (FWhereItems.Count > 0);
end;

procedure TioWhere.SetPagingObj(const APagingObj: TObject);
begin
  FPagingObj := APagingObj as TioCommonBSAPageManager;
  FPagingObjExists := Assigned(FPagingObj);
end;

function TioWhere.Intent(const AIntent: TioPersistenceIntentType): IioWhere;
begin
  Result := Self;
  FIntent := AIntent;
end;

function TioWhere.IsCacheable: Boolean;
begin
  Result := FCacheable;
end;

function TioWhere.IsEmpty: Boolean;
begin
  Result := FWhereItems.Count = 0;
end;

function TioWhere.IsLazyProp(const AClassName: String; const AProperty: IioProperty): Boolean;
begin
  Result := (FLazyLoad and AProperty.GetRelationLazyLoad) or ContainsText(FLazyProps, ';' + AProperty.GetName + ';') or
    ContainsText(FLazyProps, ';' + AClassName + '.' + AProperty.GetName + ';');
end;

function TioWhere.Lazy(const ALazyEnabled: Boolean): IioWhere;
begin
  Result := Self;
  Self.FLazyLoad := ALazyEnabled;
end;

function TioWhere.LazyProps(const ALazyProps: String): IioWhere;
begin
  Result := Self;
  // Removes all spaces and makes sure there is a semicolon at the beginning and end as well
  FLazyProps := ';' + ReplaceStr(ALazyProps, ' ', '') + ';';
end;

function TioWhere._Limit(const ARows: Integer; const AOffset: Integer = 0): IioWhere;
begin
  Result := Self;
  FLimitRows := ARows;
  FLimitOffset := AOffset;
end;

function TioWhere.LimitExists: Boolean;
begin
  Result := GetLimitRows > 0;
end;

function TioWhere.NotExists: Boolean;
begin
  Result := Count = 0;
end;

function TioWhere.SetDetailsContainer(ADetailsContainer: IioWhereDetailsContainer): IioWhere;
begin
  Result := Self;
  if not Assigned(ADetailsContainer) then
    raise EioGenericException.Create(Self.ClassName + '.SetDetailsContainer: The ADetailsContainer parameter is not valid.');
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

procedure TioWhere.Show(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String; const AForceTypeNameUse: Boolean);
var
  LIntfInstance: IInterface;
  LClassInstance: TObject;
begin
  LClassInstance := Self.ToObject;
  if TioUtilities.IsAnInterfaceTypeName(TypeName) then
  begin
    Supports(LClassInstance, IInterface, LIntfInstance);
    _Show(LIntfInstance, AParentCloseQueryAction, AVVMAlias, AForceTypeNameUse);
  end
  else
    _Show(LClassInstance, AParentCloseQueryAction, AVVMAlias, AForceTypeNameUse);
end;

procedure TioWhere.ShowEach(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String; const AForceTypeNameUse: Boolean);
var
  LClassList: TList<TObject>;
  LClassInstance: TObject;
  LIntfList: TList<IInterface>;
  LIntfInstance: IInterface;
begin
  if TioUtilities.IsAnInterfaceTypeName(TypeName) then
  begin
    LIntfList := Self.ToGenericList.OfType<TList<IInterface>>;
    try
      for LIntfInstance in LIntfList do
        _Show(LIntfInstance, AParentCloseQueryAction, AVVMAlias, AForceTypeNameUse);
    finally
      LIntfList.Free;
    end;
  end
  else
  begin
    LClassList := Self.ToGenericList.OfType<TList<TObject>>;
    try
      for LClassInstance in LClassList do
        _Show(LClassInstance, AParentCloseQueryAction, AVVMAlias, AForceTypeNameUse);
    finally
      LClassList.Free;
    end;
  end;
end;

procedure TioWhere.ShowList(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String);
var
  LList: TObject;
begin
  if TioUtilities.IsAnInterfaceTypeName(TypeName) then
    LList := Self.ToList(TList<IInterface>)
  else
    LList := Self.ToList(TList<TObject>);
  io.di.LocateViewVMFor(TypeName, AParentCloseQueryAction, AVVMAlias).SetBindSource(LList).Show;
end;

procedure TioWhere.ToList(const AList: TObject);
begin
  if not Assigned(AList) then
    raise EioGenericException.Create(ClassName, 'ToList', '"AList" parameter not assigned');
  if FClearListBefore then
    TioUtilities.ClearList(AList);
  TioPersistenceStrategyFactory.GetStrategy('').LoadList(Self, AList, FIntent);
end;

function TioWhere.ToList(const AInterfacedListTypeName, AAlias: String; const AOwnsObjects: Boolean): TObject;
begin
  Result := Self.ToList(io.di.Locate(AInterfacedListTypeName).Alias(AAlias).GetItem.RttiType, AOwnsObjects);
end;

function TioWhere.ToList(const AListRttiType: TRttiType; const AOwnsObjects: Boolean): TObject;
begin
  // Create the list
  Result := TioObjectMakerIntf.CreateListByRttiType(AListRttiType, AOwnsObjects);
  // Fill the list
  Self.ToList(Result);
end;

function TioWhere.ToList(const AListClassRef: TioClassRef; const AOwnsObjects: Boolean = True): TObject;
begin
  Result := Self.ToList(TioUtilities.ClassRefToRttiType(AListClassRef), AOwnsObjects);
end;

function TioWhere.ToMemTable: TFDMemTable;
begin
  Result := TFDMemTable.Create(nil);
  Self.ToMemTable(Result);
end;

procedure TioWhere.ToMemTable(const AMemTable: TFDMemTable);
begin
  TioPersistenceStrategyFactory.GetStrategy('').LoadDataSet(Self, AMemTable);
end;

function TioWhere.ToObject(const AObj: TObject): TObject;
begin
  Result := TioPersistenceStrategyFactory.GetStrategy('').LoadObject(Self, AObj, FIntent);
end;

function TioWhere.ToObject(const AIntf: IInterface): TObject;
begin
  Result := ToObject(AIntf as TObject);
end;

function TioWhere._Not(ATextCondition: String): IioWhere;
begin
  Result := Self;
  if ATextCondition.Trim = '' then
    Exit;
  Self._Not;
  Self.Add(ATextCondition)
end;

function TioWhere._Not(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: IInterface): IioWhere;
begin
  Result := Self;
  _AddCriteria(loNot, APropertyName, ACompareOp, TValue.From<IInterface>(AValue));
end;

function TioWhere._Not(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: TObject): IioWhere;
begin
  Result := Self;
  _AddCriteria(loNot, APropertyName, ACompareOp, TValue.From<TObject>(AValue));
end;

function TioWhere._Not(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: Variant): IioWhere;
begin
  Result := Self;
  _AddCriteria(loNot, APropertyName, ACompareOp, TValue.FromVariant(AValue));
end;

function TioWhere._Not(const APropertyName: String; const ACompareOp: TioCompareOp): IioWhere;
begin
  Result := Self;
  _AddCriteria(loNot, APropertyName, ACompareOp);
end;

function TioWhere._NotEqual: IioWhere;
begin
  Result := Self;
  Self.FWhereItems.Add(TioDbFactory.CompareOperator._NotEqual);
end;

function TioWhere._NotEqualTo(AValue: TDateTime): IioWhere;
begin
  Result := Self._NotEqualTo(TValue.From<TDateTime>(AValue));
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
  if WhereConditionExists then
    Self.FWhereItems.Add(TioDbFactory.LogicRelation._Or);
end;

function TioWhere._Or(ATextCondition: String): IioWhere;
begin
  Result := Self;
  if ATextCondition.Trim = '' then
    Exit;
  Self._Or;
  Self.Add(ATextCondition)
end;

function TioWhere._Or(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: IInterface): IioWhere;
begin
  Result := Self;
  _AddCriteria(loOr, APropertyName, ACompareOp, TValue.From<IInterface>(AValue));
end;

function TioWhere._Or(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: TObject): IioWhere;
begin
  Result := Self;
  _AddCriteria(loOr, APropertyName, ACompareOp, TValue.From<TObject>(AValue));
end;

function TioWhere._Or(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: Variant): IioWhere;
begin
  Result := Self;
  _AddCriteria(loOr, APropertyName, ACompareOp, TValue.FromVariant(AValue));
end;

function TioWhere._Or(const APropertyName: String; const ACompareOp: TioCompareOp): IioWhere;
begin
  Result := Self;
  _AddCriteria(loOr, APropertyName, ACompareOp);
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

function TioWhere._PropertyEqualsTo(APropertyName: String; AValue: Double): IioWhere;
begin
  Result := Self._PropertyEqualsTo(APropertyName, TValue.From<Double>(AValue));
end;

function TioWhere._PropertyEqualsTo(APropertyName: String; AValue: Integer): IioWhere;
begin
  Result := Self._PropertyEqualsTo(APropertyName, TValue.From<Integer>(AValue));
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

function TioWhere._PropertyEqualsTo(APropertyName: String; AValue: TDateTime): IioWhere;
begin
  Result := Self._PropertyEqualsTo(APropertyName, TValue.From<TDateTime>(AValue));
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
  Self.FWhereItems.Add(TioDbFactory.WhereItemPropertyOIDEqualsTo(TValue.From<Integer>(AValue)));
end;

procedure TioWhere._Show(const ADataObject: TObject; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String; const AForceTypeNameUse: Boolean);
begin
  if not Assigned(ADataObject) then
    raise EioGenericException.Create(Self.ClassName, '_Show', 'ADataObject non assigned.');
  // If specific View/ViewModel were found for the instance then use them...
  // NB: But only if AForceTypeNameUse = False
  if io.di.LocateViewFor(ADataObject, AVVMAlias).Exist // NB: Lasciare le due condizioni separate
    and io.di.LocateVMFor(ADataObject, AParentCloseQueryAction, AVVMAlias).Exist // NB: Lasciare le due condizioni separate
    and not AForceTypeNameUse then
    io.di.LocateViewVMFor(ADataObject, AParentCloseQueryAction, AVVMAlias).SetBindSource(ADataObject).Show
  else
    // Try also to look for a View/ViewModel for the TypeName (if the previous search was not successful)
    if (not TypeName.IsEmpty) and io.di.LocateViewFor(TypeName, AVVMAlias).Exist // NB: Lasciare le due condizioni separate
      and io.di.LocateVMFor(TypeName, AParentCloseQueryAction, AVVMAlias).Exist // NB: Lasciare le due condizioni separate
    then
      io.di.LocateViewVMFor(TypeName, AParentCloseQueryAction, AVVMAlias).SetBindSource(ADataObject).Show
    else
      raise EioGenericException.Create(Self.ClassName, '_Show',
        Format('No View/ViewModel were found for this instance (Object class = "%s"; TypeName = "%s"; AVVMAlias = "%s")',
        [ADataObject.ClassName, TypeName, AVVMAlias]));
end;

procedure TioWhere.SetETMfor(const AETMfor: IInterface);  // IInterface to avoid circular reference
begin
  if AETMfor <> nil then
  begin
    if not Supports(AETMfor, IioBindSource, FETMfor) then
      raise EioEtmException.Create(ClassName, '_SetETMfor', 'The object received into the "AETMfor" parameter does not implement the interface "IioBindSource".');
  end
  else
    FETMfor := nil;
end;

procedure TioWhere._Show(const ADataObject: IInterface; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String; const AForceTypeNameUse: Boolean);
begin
  if not Assigned(ADataObject) then
    raise EioGenericException.Create(Self.ClassName, '_Show', 'ADataObject non assigned.');
  // If specific View/ViewModel were found for the instance then use them...
  // NB: But only if AForceTypeNameUse = False
  if io.di.LocateViewFor(ADataObject, AVVMAlias).Exist // NB: Lasciare le due condizioni separate
    and io.di.LocateVMFor(ADataObject, AParentCloseQueryAction, AVVMAlias).Exist // NB: Lasciare le due condizioni separate
    and not AForceTypeNameUse then
    io.di.LocateViewVMFor(ADataObject, AParentCloseQueryAction, AVVMAlias).SetBindSource(ADataObject).Show
  else
    // Try also to look for a View/ViewModel for the TypeName (if the previous search was not successful)
    if (not TypeName.IsEmpty) and io.di.LocateViewFor(TypeName, AVVMAlias).Exist // NB: Lasciare le due condizioni separate
      and io.di.LocateVMFor(TypeName, AParentCloseQueryAction, AVVMAlias).Exist // NB: Lasciare le due condizioni separate
    then
      io.di.LocateViewVMFor(TypeName, AParentCloseQueryAction, AVVMAlias).SetBindSource(ADataObject).Show
    else
      raise EioGenericException.Create(Self.ClassName, '_Show',
        Format('No View/ViewModel were found for this instance (Object class = "%s"; TypeName = "%s"; AVVMAlias = "%s")',
        [(ADataObject as TObject).ClassName, TypeName, AVVMAlias]));
end;

function TioWhere.ToLazyObject(const AObj: TObject): TObject;
begin
  Result := TioLazyLoadFactory.LazyLoadObject(Self.TypeInfo, Self.TypeName, Self.TypeAlias, '', 0, Self) as TObject;
end;

function TioWhere.ToLazyObject(const AIntf: IInterface): TObject;
begin
  Result := ToLazyObject(AIntf as TObject);
end;

function TioWhere._ToObjectInternalByClassOnly(const AIntent: TioPersistenceIntentType; const AObj: TObject = nil): TObject;
begin
  Result := TioPersistenceStrategyFactory.GetStrategy('').LoadObjectByClassOnly(Self, AObj, AIntent);
end;

function TioWhere._Value(AValue: IInterface): IioWhere;
var
  LID: Integer;
begin
  LID := TioUtilities.ExtractOID(AValue);
  Result := Self._Value(TValue.From<Integer>(LID));
end;

function TioWhere._Value(AValue: Integer): IioWhere;
begin
  Result := Self._Value(TValue.From<Integer>(AValue));
end;

function TioWhere._Value(AValue: Double): IioWhere;
begin
  Result := Self._Value(TValue.From<Double>(AValue));
end;

function TioWhere._Value(AValue: TDateTime): IioWhere;
begin
  Result := Self._Value(TValue.From<TDateTime>(AValue));
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

function TioWhere._Where(AWhere: IioWhere): IioWhere;
begin
  // Clear all previous items
  Result := _Where;
  // Add the source items and details
  if not Assigned(AWhere) then
    Exit;
  Add(AWhere);
end;

function TioWhere.Add(const AWhereCond: IioWhere): IioWhere;
var
  AItem: IioSqlItem;
begin
  Result := Self;
  if not Assigned(AWhereCond) then
    Exit;
  for AItem in AWhereCond.GetWhereItems do
    Self.FWhereItems.Add(AItem);
  SetPagingObj(AWhereCond.GetPagingObj);
  SetETMfor(AWhereCond.GetETMfor);
  FDetailsContainer := AWhereCond.Details;
  FOrderBy := AWhereCond.GetOrderByInstance;
end;

function TioWhere._Where(ATextCondition: String): IioWhere;
begin
  // Clear all previous items
  Result := Self._Where;
  // Add the spcified condition
  if ATextCondition <> '' then
    Self.Add(ATextCondition);
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

function TioWhere<T>.AddDetail(const AMasterPropertyName, ATextCondition: String): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self).AddDetail(AMasterPropertyName, ATextCondition);
end;

function TioWhere<T>.AddDetail(const AMasterPropertyName: String; const AWhereCond: IioWhere): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self).AddDetail(AMasterPropertyName, AWhereCond);
end;

function TioWhere<T>.ByID(const AID: Integer): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self).ByID(AID);
end;

function TioWhere<T>.Cacheable: IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self).Cacheable;
end;

function TioWhere<T>.ClearListBefore(const AClearListBefore: Boolean): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self).ClearListBefore(AClearListBefore);
end;

function TioWhere<T>.DisableStrictlyTrueClass: IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self).DisableStrictlyTrueClass;
end;

function TioWhere<T>.Intent(const AIntent: TioPersistenceIntentType): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self).Intent(AIntent);
end;

function TioWhere<T>.Lazy(const ALazyEnabled: Boolean): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self).Lazy(ALazyEnabled);
end;

function TioWhere<T>.LazyProps(const ALazyProps: String): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self).LazyProps(ALazyProps);
end;

function TioWhere<T>._Limit(const ARows, AOffset: Integer): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Limit(ARows, AOffset);
end;

function TioWhere<T>.SetDetailsContainer(ADetailsContainer: IioWhereDetailsContainer): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self).SetDetailsContainer(ADetailsContainer);
end;

function TioWhere<T>.ToLazyObject(const AObj: TObject): T;
begin
  Result := TioUtilities.CastObjectToGeneric<T>(TioWhere(Self).ToLazyObject(AObj));
end;

function TioWhere<T>.ToList: TList<T>;
begin
  Result := TList<T>.Create;
  Self.ToList(Result);
end;

function TioWhere<T>.ToObject(const AObj: TObject): T;
begin
  Result := TioUtilities.CastObjectToGeneric<T>(TioWhere(Self).ToObject(AObj));
end;

function TioWhere<T>._And(ATextCondition: String): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._And(ATextCondition);
end;

function TioWhere<T>._And(const APropertyName: String; const ACompareOp: TioCompareOp): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._And(APropertyName, ACompareOp);
end;

function TioWhere<T>._And(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: Variant): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._And(APropertyName, ACompareOp, AValue);
end;

function TioWhere<T>._And(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: TObject): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._And(APropertyName, ACompareOp, AValue);
end;

function TioWhere<T>._And(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: IInterface): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._And(APropertyName, ACompareOp, AValue);
end;

function TioWhere<T>._Equal: IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Equal;
end;

function TioWhere<T>._EqualTo(AValue: Double): IioWhere<T>;
begin
  Result := Self._EqualTo(TValue.From<Double>(AValue));
end;

function TioWhere<T>._EqualTo(AValue: Integer): IioWhere<T>;
begin
  Result := Self._EqualTo(TValue.From<Integer>(AValue));
end;

function TioWhere<T>._EqualTo(AValue: TDateTime): IioWhere<T>;
begin
  Result := Self._EqualTo(TValue.From<TDateTime>(AValue));
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
  Result := Self._GreaterOrEqualThan(TValue.From<TDateTime>(AValue));
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
  Result := Self._LikeTo(TValue.From<Integer>(AValue));
end;

function TioWhere<T>._LikeTo(AValue: Double): IioWhere<T>;
begin
  Result := Self._LikeTo(TValue.From<Double>(AValue));
end;

function TioWhere<T>._LikeTo(AValue: TDateTime): IioWhere<T>;
begin
  Result := Self._LikeTo(TValue.From<TDateTime>(AValue));
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
  Result := Self._LowerOrEqualThan(TValue.From<TDateTime>(AValue));
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
  Result := Self._NotEqualTo(TValue.From<Integer>(AValue));
end;

function TioWhere<T>._NotLike: IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._NotLike;
end;

function TioWhere<T>._NotLikeTo(AValue: TValue): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._NotLikeTo(AValue);
end;

function TioWhere<T>._NotLikeTo(AValue: TDateTime): IioWhere<T>;
begin
  Result := Self._NotLikeTo(TValue.From<TDateTime>(AValue));
end;

function TioWhere<T>._NotLikeTo(AValue: Double): IioWhere<T>;
begin
  Result := Self._NotLikeTo(TValue.From<Double>(AValue));
end;

function TioWhere<T>._NotLikeTo(AValue: Integer): IioWhere<T>;
begin
  Result := Self._NotLikeTo(TValue.From<Integer>(AValue));
end;

function TioWhere<T>._NotEqualTo(AValue: Double): IioWhere<T>;
begin
  Result := Self._NotEqualTo(TValue.From<Double>(AValue));
end;

function TioWhere<T>._NotEqualTo(AValue: TDateTime): IioWhere<T>;
begin
  Result := Self._NotEqualTo(TValue.From<TDateTime>(AValue));
end;

function TioWhere<T>._NotEqualTo(AValue: TValue): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._NotEqualTo(AValue);
end;

function TioWhere<T>._Or(ATextCondition: String): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Or(ATextCondition);
end;

function TioWhere<T>._Or(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: IInterface): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Or(APropertyName, ACompareOp, AValue);
end;

function TioWhere<T>._Or(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: TObject): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Or(APropertyName, ACompareOp, AValue);
end;

function TioWhere<T>._Or(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: Variant): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Or(APropertyName, ACompareOp, AValue);
end;

function TioWhere<T>._Or(const APropertyName: String; const ACompareOp: TioCompareOp): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Or(APropertyName, ACompareOp);
end;

function TioWhere<T>._OrderBy(const AOrderByInstance: IioSqlItemWhere): IioWhere<T>;
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

function TioWhere<T>._PropertyEqualsTo(APropertyName: String; AValue: TDateTime): IioWhere<T>;
begin
  Result := Self._PropertyEqualsTo(APropertyName, TValue.From<TDateTime>(AValue));
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
  Result := Self._Value(TValue.From<TDateTime>(AValue));
end;

function TioWhere<T>._Value(AValue: TValue): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Value(AValue);
end;

function TioWhere<T>._Where(AWhereCond: IioWhere): IioWhere<T>;
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
  Result := Self._GreaterThan(TValue.From<TDateTime>(AValue));
end;

function TioWhere._LowerThan(AValue: TDateTime): IioWhere;
begin
  Result := Self._LowerThan(TValue.From<TDateTime>(AValue));
end;

function TioWhere<T>._GreaterThan(AValue: TDateTime): IioWhere<T>;
begin
  Result := Self._GreaterThan(TValue.From<TDateTime>(AValue));
end;

function TioWhere<T>._LowerThan(AValue: TDateTime): IioWhere<T>;
begin
  Result := Self._LowerThan(TValue.From<TDateTime>(AValue));
end;

function TioWhere<T>._Value(AValue: Double): IioWhere<T>;
begin
  Result := Self._Value(TValue.From<Double>(AValue));
end;

function TioWhere<T>._Value(AValue: Integer): IioWhere<T>;
begin
  Result := Self._Value(TValue.From<Integer>(AValue));
end;

function TioWhere._GreaterThan(AValue: Integer): IioWhere;
begin
  Result := Self._GreaterThan(TValue.From<Integer>(AValue));
end;

function TioWhere._GreaterThan(AValue: Double): IioWhere;
begin
  Result := Self._GreaterThan(TValue.From<Double>(AValue));
end;

function TioWhere._LikeTo(AValue: Integer): IioWhere;
begin
  Result := Self._LikeTo(TValue.From<Integer>(AValue));
end;

function TioWhere._LikeTo(AValue: Double): IioWhere;
begin
  Result := Self._LikeTo(TValue.From<Double>(AValue));
end;

function TioWhere._LowerThan(AValue: Double): IioWhere;
begin
  Result := Self._LowerThan(TValue.From<Double>(AValue));
end;

function TioWhere._LowerThan(AValue: Integer): IioWhere;
begin
  Result := Self._LowerThan(TValue.From<Integer>(AValue));
end;

function TioWhere._NotEqualTo(AValue: Integer): IioWhere;
begin
  Result := Self._NotEqualTo(TValue.From<Integer>(AValue));
end;

function TioWhere._NotLike: IioWhere;
begin
  Result := Self;
  Self.FWhereItems.Add(TioDbFactory.CompareOperator._NotLike);
end;

function TioWhere._NotLikeTo(AValue: TValue): IioWhere;
begin
  Result := Self;
  Self._NotLike;
  Self._Value(AValue);
end;

function TioWhere._NotLikeTo(AValue: TDateTime): IioWhere;
begin
  Result := Self._NotLikeTo(TValue.From<TDateTime>(AValue));
end;

function TioWhere._NotLikeTo(AValue: Double): IioWhere;
begin
  Result := Self._NotLikeTo(TValue.From<Double>(AValue));
end;

function TioWhere._NotLikeTo(AValue: Integer): IioWhere;
begin
  Result := Self._NotLikeTo(TValue.From<Integer>(AValue));
end;

function TioWhere._NotEqualTo(AValue: Double): IioWhere;
begin
  Result := Self._NotEqualTo(TValue.From<Double>(AValue));
end;

function TioWhere<T>._GreaterOrEqualThan(AValue: Integer): IioWhere<T>;
begin
  Result := Self._GreaterOrEqualThan(TValue.From<Integer>(AValue));
end;

function TioWhere<T>._GreaterOrEqualThan(AValue: Double): IioWhere<T>;
begin
  Result := Self._GreaterOrEqualThan(TValue.From<Double>(AValue));
end;

function TioWhere<T>._GreaterThan(AValue: Integer): IioWhere<T>;
begin
  Result := Self._GreaterThan(TValue.From<Integer>(AValue));
end;

function TioWhere<T>._GreaterThan(AValue: Double): IioWhere<T>;
begin
  Result := Self._GreaterThan(TValue.From<Double>(AValue));
end;

function TioWhere<T>._LowerOrEqualThan(AValue: Double): IioWhere<T>;
begin
  Result := Self._LowerOrEqualThan(TValue.From<Double>(AValue));
end;

function TioWhere<T>._LowerOrEqualThan(AValue: Integer): IioWhere<T>;
begin
  Result := Self._LowerOrEqualThan(TValue.From<Integer>(AValue));
end;

function TioWhere<T>._LowerThan(AValue: Double): IioWhere<T>;
begin
  Result := Self._LowerThan(TValue.From<Double>(AValue));
end;

function TioWhere<T>._LowerThan(AValue: Integer): IioWhere<T>;
begin
  Result := Self._LowerThan(TValue.From<Integer>(AValue));
end;

function TioWhere<T>._PropertyEqualsTo(APropertyName: String; AValue: Double): IioWhere<T>;
begin
  Result := Self._PropertyEqualsTo(APropertyName, TValue.From<Double>(AValue));
end;

function TioWhere<T>._PropertyEqualsTo(APropertyName: String; AValue: Integer): IioWhere<T>;
begin
  Result := Self._PropertyEqualsTo(APropertyName, TValue.From<Integer>(AValue));
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

function TioWhere._Value(AValue: TObject): IioWhere;
var
  LID: Integer;
begin
  LID := TioUtilities.ExtractOID(AValue);
  Result := Self._Value(TValue.From<Integer>(LID));
end;

function TioWhere<T>._Value(AValue: IInterface): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Value(AValue);
end;

function TioWhere<T>._Where(const APropertyName: String; const ACompareOp: TioCompareOp): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Where(APropertyName, ACompareOp);
end;

function TioWhere<T>._Where(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: Variant): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Where(APropertyName, ACompareOp, AValue);
end;

function TioWhere<T>._Where(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: TObject): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Where(APropertyName, ACompareOp, AValue);
end;

function TioWhere<T>._Where(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: IInterface): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Where(APropertyName, ACompareOp, AValue);
end;

function TioWhere<T>._Value(AValue: TObject): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Value(AValue);
end;

function TioWhere._Where(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: Variant): IioWhere;
begin
  Result := Self;
  _AddCriteria(APropertyName, ACompareOp, TValue.FromVariant(AValue));
end;

function TioWhere._Where(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: IInterface): IioWhere;
begin
  Result := Self;
  _AddCriteria(APropertyName, ACompareOp, TValue.From<IInterface>(AValue));
end;

function TioWhere._Where(const APropertyName: String; const ACompareOp: TioCompareOp): IioWhere;
begin
  Result := Self;
  _AddCriteria(APropertyName, ACompareOp);
end;

function TioWhere._Where(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: TObject): IioWhere;
begin
  Result := Self;
  _AddCriteria(APropertyName, ACompareOp, TValue.From<TObject>(AValue));
end;

function TioWhere<T>._Not(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: IInterface): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Not(APropertyName, ACompareOp, AValue);
end;

function TioWhere<T>._Not(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: TObject): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Not(APropertyName, ACompareOp, AValue);
end;

function TioWhere<T>._Not(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: Variant): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Not(APropertyName, ACompareOp, AValue);
end;

function TioWhere<T>._Not(const APropertyName: String; const ACompareOp: TioCompareOp): IioWhere<T>;
begin
  Result := Self;
  TioWhere(Self)._Not(APropertyName, ACompareOp);
end;

end.

