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

unit iORM;

interface

uses
  System.Classes, System.SysUtils, System.TypInfo, DJSON, iORM.CommonTypes, iORM.Where.Interfaces, iORM.Attributes, iORM.LiveBindings.BSPersistence,
  iORM.DB.ConnectionContainer, iORM.DB.Interfaces, iORM.DBBuilder.Interfaces, iORM.DependencyInjection, iORM.Global.Factory,
  iORM.DependencyInjection.Interfaces, iORM.MVVM.ViewContextProvider, iORM.MVVM.Interfaces, iORM.MVVM.ModelPresenter.Custom,
  iORM.LiveBindings.Interfaces, iORM.MVVM.ViewRegister;

const
{$REGION 'Type aliases to make sure you have to include fewer units (in practice only the iORM unit) in the "uses" part of the units that use iORM'}
  // TioTypeOfCollection
  tcSingleObject = iORM.CommonTypes.TioTypeOfCollection.tcSingleObject;
  tcList = iORM.CommonTypes.TioTypeOfCollection.tcList;

  // TioLoadType
  ltManual = iORM.CommonTypes.TioLoadType.ltManual;
  ltFromBSAsIs = iORM.CommonTypes.TioLoadType.ltFromBSAsIs;
  ltFromBSReload = iORM.CommonTypes.TioLoadType.ltFromBSReload;
  ltFromBSReloadNewInstance = iORM.CommonTypes.TioLoadType.ltFromBSReloadNewInstance;
  ltAuto = iORM.CommonTypes.TioLoadType.ltAuto;

  // TioObjStatus
  osDirty = iORM.CommonTypes.TioObjStatus.osDirty;
  osClean = iORM.CommonTypes.TioObjStatus.osClean;
  osDeleted = iORM.CommonTypes.TioObjStatus.osDeleted;

  // TioCompareOp
  coEqual = iORM.CommonTypes.TioCompareOp.coEqual;
  coNotEqual = iORM.CommonTypes.TioCompareOp.coNotEqual;
  coGreater = iORM.CommonTypes.TioCompareOp.coGreater;
  coLower = iORM.CommonTypes.TioCompareOp.coLower;
  coGreaterOrEqual = iORM.CommonTypes.TioCompareOp.coGreaterOrEqual;
  coLowerOrEqual = iORM.CommonTypes.TioCompareOp.coLowerOrEqual;
  coLike = iORM.CommonTypes.TioCompareOp.coLike;
  coNotLike = iORM.CommonTypes.TioCompareOp.coNotLike;
  coIsNull = iORM.CommonTypes.TioCompareOp.coIsNull;
  coIsNotNull = iORM.CommonTypes.TioCompareOp.coIsNotNull;

  // TioLogicOp
  loAnd = iORM.CommonTypes.TioLogicOp.loAnd;
  loOr = iORM.CommonTypes.TioLogicOp.loOr;
  loNot = iORM.CommonTypes.TioLogicOp.loNot;
  loOpenPar = iORM.CommonTypes.TioLogicOp.loOpenPar;
  loClosePar = iORM.CommonTypes.TioLogicOp.loClosePar;

  // TioIndexOrientation
  ioAscending = iORM.CommonTypes.TioIndexOrientation.ioAscending;
  ioDescending = iORM.CommonTypes.TioIndexOrientation.ioDescending;

  // TioMonitorMode
  mmDisabled = iORM.CommonTypes.TioMonitorMode.mmDisabled;
  mmRemote = iORM.CommonTypes.TioMonitorMode.mmRemote;
  mmFlatFile = iORM.CommonTypes.TioMonitorMode.mmFlatFile;

  // TioSelectionType
  stAppend = iORM.CommonTypes.TioSelectionType.stAppend;
  stInsert = iORM.CommonTypes.TioSelectionType.stInsert;

{$ENDREGION}

type

// Type aliases to make sure you have to include fewer units (in practice only the iORM unit) in the "uses" part of the units that use iORM
{$REGION 'Type aliases to make sure you have to include fewer units (in practice only the iORM unit) in the "uses" part of the units that use iORM'}
  TioSimpleViewRegister = iORM.MVVM.ViewRegister.TioSimpleViewRegister;

  TioCompareOp = iORM.CommonTypes.TioCompareOp;
  TioHideWaitProc = iORM.CommonTypes.TioHideWaitProc;
  TioIndexOrientation = iORM.CommonTypes.TioIndexOrientation;
  TioLoadType = iORM.CommonTypes.TioLoadType;
  TioLogicOp = iORM.CommonTypes.TioLogicOp;
  TioObjStatus = iORM.CommonTypes.TioObjStatus;
  TioObjVersion = iORM.CommonTypes.TioObjVersion;
  TioSelectionType = iORM.CommonTypes.TioSelectionType;
  TioShowWaitProc = iORM.CommonTypes.TioShowWaitProc;
  TioTypeOfCollection = iORM.CommonTypes.TioTypeOfCollection;

  IioWhere = iORM.Where.Interfaces.IioWhere;

  TioMapModeType = iORM.Attributes.TioMapModeType;
  TioRelationType = iORM.Attributes.TioRelationType;
  TioFKAction = iORM.Attributes.TioFKAction;
  TioFKCreate = iORM.Attributes.TioFKCreate;
  TioJoinType = iORM.Attributes.TioJoinType;
{$ENDREGION}

// Attributes aliases to make sure you have to include fewer units (in practice only the iORM unit) in the "uses" part of the units that use iORM
{$REGION 'Attributes aliases to make sure you have to include fewer units (in practice only the iORM unit) in the "uses" part of the units that use iORM'}
  ioMarker = iORM.Attributes.ioMarker;

  // Property attributes
  ioSkip = iORM.Attributes.ioSkip;
  ioTransient = iORM.Attributes.ioTransient;
  ioID = iORM.Attributes.ioID;
  ioOID = iORM.Attributes.ioOID;
  ioField = iORM.Attributes.ioField;
  ioNotNull = iORM.Attributes.ioNotNull;
  ioLoadSQL = iORM.Attributes.ioLoadSQL;
  ioFieldType = iORM.Attributes.ioFieldType;
  ioVarchar = iORM.Attributes.ioVarchar;
  ioChar = iORM.Attributes.ioChar;
  ioInteger = iORM.Attributes.ioInteger;
  ioFloat = iORM.Attributes.ioFloat;
  ioDate = iORM.Attributes.ioDate;
  ioTime = iORM.Attributes.ioTime;
  ioDateTime = iORM.Attributes.ioDateTime;
  ioBoolean = iORM.Attributes.ioBoolean;
  ioDecimal = iORM.Attributes.ioDecimal;
  ioNumeric = iORM.Attributes.ioNumeric;
  ioBinary = iORM.Attributes.ioBinary;
  ioDefault = iORM.Attributes.ioDefault;
  ioFTCustom = iORM.Attributes.ioFTCustom;
  ioForeignKey = iORM.Attributes.ioForeignKey;
  ioLazyLoad = iORM.Attributes.ioLazyLoad;
  ioLazy = iORM.Attributes.ioLazy;
  ioLoadOnly = iORM.Attributes.ioLoadOnly;
  ioPersistOnly = iORM.Attributes.ioPersistOnly;
  ioTypeAlias = iORM.Attributes.ioTypeAlias;
  ioBelongsTo = iORM.Attributes.ioBelongsTo;
  ioHasMany = iORM.Attributes.ioHasMany;
  ioHasOne = iORM.Attributes.ioHasOne;
  ioEmbeddedHasMany = iORM.Attributes.ioEmbeddedHasMany;
  ioEmbeddedHasOne = iORM.Attributes.ioEmbeddedHasOne;
  ioDisableRelationAutodetect = iORM.Attributes.ioDisableRelationAutodetect;

  // Class attributes
  ioEntity = iORM.Attributes.ioEntity;
  ioTable = iORM.Attributes.ioTable;
  ioKeyGenerator = iORM.Attributes.ioKeyGenerator;
  ioKeySequence = iORM.Attributes.ioKeySequence;
  ioConnectionDefName = iORM.Attributes.ioConnectionDefName;
  ioTrueClass = iORM.Attributes.ioTrueClass;
  ioGroupBy = iORM.Attributes.ioGroupBy;
  ioJoin = iORM.Attributes.ioJoin;
  ioIndex = iORM.Attributes.ioIndex;
  ioDisableAutoCreateOnDB = iORM.Attributes.ioDisableAutoCreateOnDB;

  // Dependency Injection attributes
  diRegister = iORM.Attributes.diRegister;
  diImplements = iORM.Attributes.diImplements;
  diSimpleViewImplements = iORM.Attributes.diSimpleViewImplements;
  diSimpleViewFor = iORM.Attributes.diSimpleViewFor;
  diViewImplements = iORM.Attributes.diViewImplements;
  diViewFor = iORM.Attributes.diViewFor;
  diViewModelImplements = iORM.Attributes.diViewModelImplements;
  diViewModelFor = iORM.Attributes.diViewModelFor;
  diDoNotRegisterAsInterfacedEntity = iORM.Attributes.diDoNotRegisterAsInterfacedEntity;
  diAsSingleton = iORM.Attributes.diAsSingleton;
  ioInject = iORM.Attributes.ioInject;

{$ENDREGION}

  // iORM facade
  io = class
  public
    // AnonymousTimer
    class procedure AnonymousTimer(const AIntervalMillisec: Integer; const AExecuteMethod: TFunc<boolean>);

    // RefTo (returning IioWhere fluent interface)
    class function RefTo(const ATypeName: String; const ATypeAlias: String = ''): IioWhere; overload;
    class function RefTo(const AClassRef: TioClassRef; const ATypeAlias: String = ''): IioWhere; overload;
    class function RefTo<T>(const ATypeAlias: String = ''): IioWhere<T>; overload;
    class function RefTo(const AWhere: IioWhere): IioWhere; overload;

    // Load (returning IioWhere fluent interface)
    class function Load(const ATypeName: String; const ATypeAlias: String = ''): IioWhere; overload;
    class function Load(const ATypeInfo: PTypeInfo; const ATypeAlias: String = ''): IioWhere; overload;
    class function Load(const AClassRef: TioClassRef; const ATypeAlias: String = ''): IioWhere; overload;
    class function Load(const AIID: TGUID; const ATypeAlias: String = ''): IioWhere; overload;
    class function Load(const AWhere: IioWhere): IioWhere; overload;
    class function Load<T>(const ATypeAlias: String = ''): IioWhere<T>; overload;
    // Load (returning result instance directly)
    class function LoadObject<T>(const AID: Integer): T; overload;
    class function LoadObject<T>(const ATypeAlias: String; const AID: Integer): T; overload;
    class function LoadObject<T>(const ATypeAlias: String = ''; const AWhere: IioWhere = nil): T; overload;
    class function LoadObject<T>(const AWhere: IioWhere): T; overload;
    // LoadToObject (fill existing object)
    class procedure LoadToObject<T>(const AObj: TObject; const AID: Integer); overload;
    class procedure LoadToObject<T>(const AObj: TObject; const ATypeAlias: String; const AID: Integer); overload;
    class procedure LoadToObject<T>(const AObj: TObject; const ATypeAlias: String = ''; const AWhere: IioWhere = nil); overload;
    class procedure LoadToObject<T>(const AObj: TObject; const AWhere: IioWhere); overload;
    // LoadToObject (fill existing object)
    class procedure LoadToObject<T>(const AIntfObj: IInterface; const AID: Integer); overload;
    class procedure LoadToObject<T>(const AIntfObj: IInterface; const ATypeAlias: String; const AID: Integer); overload;
    class procedure LoadToObject<T>(const AIntfObj: IInterface; const ATypeAlias: String = ''; const AWhere: IioWhere = nil); overload;
    class procedure LoadToObject<T>(const AIntfObj: IInterface; const AWhere: IioWhere); overload;
    // LoadList (returning result instance directly)
    class function LoadList<TListType: class, constructor>(const AItemAlias: String = ''): TListType; overload;
    class function LoadList<TListType: class, constructor>(const AWhere: IioWhere): TListType; overload;
    class function LoadList<TListType: class, constructor>(const AItemAlias: String; const AWhere: IioWhere): TListType; overload;
    // LoadToList as class (fill the list passed as parameter)
    class procedure LoadToList<TItemType>(const AListObj: TObject; const AItemAlias: String = ''); overload;
    class procedure LoadToList<TItemType>(const AListObj: TObject; const AWhere: IioWhere); overload;
    class procedure LoadToList<TItemType>(const AListObj: TObject; const AItemAlias: String; const AWhere: IioWhere); overload;
    // LoadToList as interface (fill the list passed as parameter)
    class procedure LoadToList<TItemType>(const AListIntf: IInterface; const AItemAlias: String = ''); overload;
    class procedure LoadToList<TItemType>(const AListIntf: IInterface; const AWhere: IioWhere); overload;
    class procedure LoadToList<TItemType>(const AListIntf: IInterface; const AItemAlias: String; const AWhere: IioWhere); overload;

    // Reload object as class
    class procedure Reload(const AObj: TObject; const ALazy: boolean; const ALazyProps: String); overload;
    class procedure Reload(const AObj: TObject; const ALazy: boolean = False); overload;
    class procedure Reload(const AObj: TObject; const ALazyProps: String); overload;
    // Reload object as interface
    class procedure Reload(const AIntfObj: IInterface; const ALazy: boolean; const ALazyProps: String); overload;
    class procedure Reload(const AIntfObj: IInterface; const ALazy: boolean = False); overload;
    class procedure Reload(const AIntfObj: IInterface; const ALazyProps: String); overload;
    // Reload list as class
    class procedure ReloadList(const AListObj: TObject; const ALazy: boolean; const ALazyProps: String); overload;
    class procedure ReloadList(const AListObj: TObject; const ALazy: boolean = False); overload;
    class procedure ReloadList(const AListObj: TObject; const ALazyProps: String); overload;
    // Reload list as interface
    class procedure ReloadList(const AListIntf: IInterface; const ALazy: boolean; const ALazyProps: String); overload;
    class procedure ReloadList(const AListIntf: IInterface; const ALazy: boolean = False); overload;
    class procedure ReloadList(const AListIntf: IInterface; const ALazyProps: String); overload;

    // Delete (accepting instance to delete directly)
    class procedure Delete(const AObj: TObject); overload;
    class procedure Delete(const AIntfObj: IInterface); overload;
    class procedure DeleteList(const AListObj: TObject); overload;
    class procedure DeleteList(const AListIntf: IInterface); overload;
    // Delete (accepting generic type to delete and ciriteria)
    class procedure Delete<T>(const AID: Integer); overload;
    class procedure Delete<T>(const ATypeAlias: String; const AID: Integer); overload;
    class procedure DeleteAll<T>(const ATypeAlias: String = ''); overload;
    class procedure DeleteAll<T>(const AWhere: IioWhere); overload;
    class procedure DeleteAll<T>(const ATypeAlias: String; const AWhere: IioWhere); overload;

    // Count (accepting generic type and ciriteria)
    class function Count(const ATypeName: String; const ATypeAlias: String = ''): Integer; overload;
    class function Count(const ATypeName: String; const AWhere: IioWhere): Integer; overload;
    class function Count(const ATypeName: String; const ATypeAlias: String; const AWhere: IioWhere): Integer; overload;
    class function Count<T>(const ATypeAlias: String = ''): Integer; overload;
    class function Count<T>(const AWhere: IioWhere): Integer; overload;
    class function Count<T>(const ATypeAlias: String; const AWhere: IioWhere): Integer; overload;
    // Exists (accepting generic type and ciriteria)
    class function Exists(const ATypeName: String; const ATypeAlias: String = ''): boolean; overload;
    class function Exists(const ATypeName: String; const AWhere: IioWhere): boolean; overload;
    class function Exists(const ATypeName: String; const ATypeAlias: String; const AWhere: IioWhere): boolean; overload;
    class function Exists<T>(const ATypeAlias: String = ''): boolean; overload;
    class function Exists<T>(const AWhere: IioWhere): boolean; overload;
    class function Exists<T>(const ATypeAlias: String; const AWhere: IioWhere): boolean; overload;
    // Exists (accepting generic type and ciriteria)
    class function NotExists(const ATypeName: String; const ATypeAlias: String = ''): boolean; overload;
    class function NotExists(const ATypeName: String; const AWhere: IioWhere): boolean; overload;
    class function NotExists(const ATypeName: String; const ATypeAlias: String; const AWhere: IioWhere): boolean; overload;
    class function NotExists<T>(const ATypeAlias: String = ''): boolean; overload;
    class function NotExists<T>(const AWhere: IioWhere): boolean; overload;
    class function NotExists<T>(const ATypeAlias: String; const AWhere: IioWhere): boolean; overload;

    // Persist (accepting instance to persist directly)
    class procedure Persist(const AObj: TObject; const ABlindInsert: boolean = False); overload;
    class procedure Persist(const AIntfObj: IInterface; const ABlindInsert: boolean = False); overload;
    class procedure _PersistInternal(const AObj: TObject; const ARelationPropertyName: String; const ARelationOID: Integer; const ABlindInsert: boolean;
      const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String); overload;
    // PersistCollection (accepting instance to persist directly)
    class procedure PersistCollection(const ACollection: TObject; const ABlindInsert: boolean = False); overload;
    class procedure PersistCollection(const AIntfCollection: IInterface; const ABlindInsert: boolean = False); overload;
    class procedure _PersistCollectionInternal(const ACollection: TObject; const ARelationPropertyName: String; const ARelationOID: Integer;
      const ABlindInsert: boolean; const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String); overload;

    class procedure StartTransaction(const AConnectionName: String = '');
    class procedure CommitTransaction(const AConnectionName: String = '');
    class procedure RollbackTransaction(const AConnectionName: String = '');
    class function InTransaction(const AConnectionName: String = ''): boolean;

    class function Connections: TioConnectionManagerRef;

    class function Where: IioWhere; overload;
    class function Where(const ATextCondition: String): IioWhere; overload;
    class function Where(const APropertyName: String; const ACompareOp: TioCompareOp): IioWhere; overload;
    class function Where(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: Variant): IioWhere; overload;
    class function Where(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: TObject): IioWhere; overload;
    class function Where(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: IInterface): IioWhere; overload;
    class function Where<T>: IioWhere<T>; overload;
    class function Where<T>(const ATextCondition: String): IioWhere<T>; overload;
    class function Where<T>(const APropertyName: String; const ACompareOp: TioCompareOp): IioWhere<T>; overload;
    class function Where<T>(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: Variant): IioWhere<T>; overload;
    class function Where<T>(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: TObject): IioWhere<T>; overload;
    class function Where<T>(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: IInterface): IioWhere<T>; overload;

    class function SQL(const ASQL: String): IioSQLDestination; overload;
    class function SQL(const ASQL: TStrings; const AOwns: boolean = False): IioSQLDestination; overload;
    class function SQL(const ASQLDestination: IioSQLDestination): IioSQLDestination; overload;

    class procedure SetWaitProc(const AShowWaitProc: TProc = nil; const AHideWaitProc: TProc = nil);
    class procedure ShowWait;
    class procedure HideWait;

    class function DBBuilder(const AAddIndexes: boolean = True; const AAddForeignKeys: boolean = True): IioDBBuilderEngine; overload;
    class function DBBuilder(const AConnectionDefName: String; const AAddIndexes: boolean = True; const AAddForeignKeys: boolean = True)
      : IioDBBuilderEngine; overload;

    class function di: TioDependencyInjectionRef;
    class function ExtractOID(const AObj: TObject): Integer; overload;
    class function ExtractOID(const AIntfObj: IInterface): Integer; overload;
    class function GlobalFactory: TioGlobalFactoryRef;
    class procedure HandleException(Sender: TObject);
    class procedure ShowMessage(const AMessage: String);
    class function TerminateApplication: boolean;

    // Create instance
    class function Create<T: IInterface>(const ATypeAlias: String = ''; const AParams: TioConstructorParams = nil): T; overload;
    class function Create<T: IInterface>(const AParams: TioConstructorParams): T; overload;

    // Create View instance
    class function CreateView<T: IInterface>(const ATypeAlias: String = ''; const AParams: TioConstructorParams = nil): T; overload;
    class function CreateView<T: IInterface>(const AParams: TioConstructorParams): T; overload;
    // Create View instance passing a ViewContextProvider
    class function CreateView<T: IInterface>(const ATypeAlias: String; const AVCProvider: TioViewContextProvider; const AParams: TioConstructorParams = nil)
      : T; overload;
    class function CreateView<T: IInterface>(const AVCProvider: TioViewContextProvider; const AParams: TioConstructorParams = nil): T; overload;
    // Create View instance passing an already created ViewContext
    class function CreateView<T: IInterface>(const ATypeAlias: String; const AViewContext: TComponent; const AParams: TioConstructorParams = nil): T; overload;
    class function CreateView<T: IInterface>(const AViewContext: TComponent; const AParams: TioConstructorParams = nil): T; overload;
    // Create View instance passing a ViewModel
    class function CreateView<T: IInterface>(const ATypeAlias: String; const AViewModel: IioViewModel; const AParams: TioConstructorParams = nil): T; overload;
    class function CreateView<T: IInterface>(const AViewModel: IioViewModel; const AParams: TioConstructorParams = nil): T; overload;
    // Create View instance passing a ViewModel and a VCProvider)
    class function CreateView<T: IInterface>(const ATypeAlias: String; const AVCProvider: TioViewContextProvider; const AViewModel: IioViewModel;
      const AParams: TioConstructorParams = nil): T; overload;
    class function CreateView<T: IInterface>(const AVCProvider: TioViewContextProvider; const AViewModel: IioViewModel;
      const AParams: TioConstructorParams = nil): T; overload;
    // Create View instance passing a ViewModel and an already created ViewContext
    class function CreateView<T: IInterface>(const ATypeAlias: String; const AViewContext: TComponent; const AViewModel: IioViewModel;
      const AParams: TioConstructorParams = nil): T; overload;
    class function CreateView<T: IInterface>(const AViewContext: TComponent; const AViewModel: IioViewModel; const AParams: TioConstructorParams = nil)
      : T; overload;

    // Create View instance for a specified type of instances
    class function CreateViewFor<T>(const AVVMAlias: String = ''; const AParams: TioConstructorParams = nil): TComponent; overload;
    class function CreateViewFor<T>(const AParams: TioConstructorParams): TComponent; overload;
    // Create View instance for a specified type of instances passing a ViewContextProvider
    class function CreateViewFor<T>(const AVVMAlias: String; const AVCProvider: TioViewContextProvider; const AParams: TioConstructorParams = nil)
      : TComponent; overload;
    class function CreateViewFor<T>(const AVCProvider: TioViewContextProvider; const AParams: TioConstructorParams = nil): TComponent; overload;
    // Create View instance for a specified type of instances passing an already created ViewContext
    class function CreateViewFor<T>(const AVVMAlias: String; const AViewContext: TComponent; const AParams: TioConstructorParams = nil): TComponent; overload;
    class function CreateViewFor<T>(const AViewContext: TComponent; const AParams: TioConstructorParams = nil): TComponent; overload;
    // Create View instance for a specified type of instances passing a ViewModel
    class function CreateViewFor<T>(const AVVMAlias: String; const AViewModel: IioViewModel; const AParams: TioConstructorParams = nil): TComponent; overload;
    class function CreateViewFor<T>(const AViewModel: IioViewModel; const AParams: TioConstructorParams = nil): TComponent; overload;
    // Create View instance for a specified type of instances passing a ViewModel and a VCProvider)
    class function CreateViewFor<T>(const AVVMAlias: String; const AVCProvider: TioViewContextProvider; const AViewModel: IioViewModel;
      const AParams: TioConstructorParams = nil): TComponent; overload;
    class function CreateViewFor<T>(const AVCProvider: TioViewContextProvider; const AViewModel: IioViewModel; const AParams: TioConstructorParams = nil)
      : TComponent; overload;
    // Create View instance for a specified type of instances passing a ViewModel and an already created ViewContext
    class function CreateViewFor<T>(const AVVMAlias: String; const AViewContext: TComponent; const AViewModel: IioViewModel;
      const AParams: TioConstructorParams = nil): TComponent; overload;
    class function CreateViewFor<T>(const AViewContext: TComponent; const AViewModel: IioViewModel; const AParams: TioConstructorParams = nil)
      : TComponent; overload;

    // Create ViewModel instance
    class function CreateViewModel<T: IioViewModel>(const AAlias: String = ''; const AParams: TioConstructorParams = nil): T; overload;
    class function CreateViewModel<T: IioViewModel>(const AParams: TioConstructorParams): T; overload;
    // Create ViewModel instance for a specified type of instances
    class function CreateViewModelFor<T>(const AAlias: String = ''; const AParams: TioConstructorParams = nil): IioViewModel; overload;
    class function CreateViewModelFor<T>(const AParams: TioConstructorParams): IioViewModel; overload;

    // Create View & ViewModel coupled instances
    class procedure CreateViewViewModel<TView: IInterface; TViewModel: IioViewModel>(const AAlias: String = ''; const AVCProviderName: String = ''); overload;
    // Create View & ViewModel coupled instances passing a ViewContextProvider
    class procedure CreateViewViewModel<TView: IInterface; TViewModel: IioViewModel>(const AVCProvider: TioViewContextProvider); overload;
    class procedure CreateViewViewModel<TView: IInterface; TViewModel: IioViewModel>(const AAlias: String; const AVCProvider: TioViewContextProvider); overload;
    // Create View & ViewModel coupled instances passing an already created ViewContext
    class procedure CreateViewViewModel<TView: IInterface; TViewModel: IioViewModel>(const AViewContext: TComponent); overload;
    class procedure CreateViewViewModel<TView: IInterface; TViewModel: IioViewModel>(const AAlias: String; const AViewContext: TComponent); overload;

    // Create View & ViewModel instance for a specified type of instances
    class procedure CreateViewViewModelFor<T>(const AVVMAlias: String = ''; const AVCProviderName: String = ''); overload;
    class procedure CreateViewViewModelFor<T>(const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure CreateViewViewModelFor<T>(const AViewContext: TComponent; const AVVMAlias: String = ''); overload;

    // Show instance as TObject (even passing ViewContextProvider or an already created ViewContext)
    class procedure Show(const ATargetObj: TObject; const AVVMAlias: String = ''; const AVCProviderName: String = ''); overload;
    class procedure Show(const ATargetObj: TObject; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure Show(const ATargetObj: TObject; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;
    // Show instance as IInterface (even passing ViewContextProvider or an already created ViewContext)
    class procedure Show(const ATargetIntf: IInterface; const AVVMAlias: String = ''; const AVCProviderName: String = ''); overload;
    class procedure Show(const ATargetIntf: IInterface; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure Show(const ATargetIntf: IInterface; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;
    // Show instance of generic type <T> (even passing ViewContextProvider or an already created ViewContext)
    class procedure Show<T>(const AVVMAlias: String = ''; const AVCProviderName: String = ''); overload;
    class procedure Show<T>(const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure Show<T>(const AViewContext: TComponent; const AVVMAlias: String = ''); overload;

    // Show current record/instance of a ModelPresenter (even passing ViewContextProvider or an already created ViewContext)
    class procedure ShowCurrent(const ABindSource: IioNotifiableBindSource; const AVVMAlias: String = ''; const AVCProviderName: String = ''); overload;
    class procedure ShowCurrent(const ABindSource: IioNotifiableBindSource; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure ShowCurrent(const ABindSource: IioNotifiableBindSource; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;

    // Show each record/instance of a ModelPresenter (even passing ViewContextProvider or an already created ViewContext)
    class procedure ShowEach(const AModelPresenter: IioNotifiableBindSource; const AVVMAlias: String = ''; const AVCProviderName: String = ''); overload;
    class procedure ShowEach(const AModelPresenter: IioNotifiableBindSource; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure ShowEach(const ABindSource: IioNotifiableBindSource; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;

    // Show selector
    class procedure ShowAsSelector(const ATargetBindSource: IioNotifiableBindSource; const AVVMAlias: String = ''; const AVCProviderName: String = '');
      overload;
    class procedure ShowAsSelector(const ATargetBindSource: IioNotifiableBindSource; const AVCProvider: TioViewContextProvider;
      const AVVMAlias: String = ''); overload;
    class procedure ShowAsSelector(const ATargetBindSource: IioNotifiableBindSource; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;
    // Show selector (Generic version)
    class procedure ShowAsSelector<T>(const ATargetMP: IioNotifiableBindSource; const AVVMAlias: String = ''; const AVCProviderName: String = ''); overload;
    class procedure ShowAsSelector<T>(const ATargetMP: IioNotifiableBindSource; const AVCProvider: TioViewContextProvider;
      const AVVMAlias: String = ''); overload;
    class procedure ShowAsSelector<T>(const ATargetMP: IioNotifiableBindSource; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;
  end;

implementation

// uses
// System.Rtti,
// iORM.DuckTyped.Interfaces,
// iORM.DuckTyped.Factory,
// iORM.DuckTyped.StreamObject,
// iORM.Exceptions,
// iORM.DB.Factory,
// iORM.Utilities,
// iORM.Strategy.Factory,
// iORM.Context.Container,
// iORM.Abstraction,
// iORM.DBBuilder.Factory,
// iORM.Context.Map.Interfaces;

uses
  System.Rtti, iORM.Exceptions, iORM.Utilities, iORM.Where.Factory, iORM.Context.Container, iORM.Strategy.Factory, iORM.DuckTyped.Interfaces,
  iORM.DuckTyped.Factory, iORM.DB.Factory, iORM.Abstraction, iORM.DuckTyped.StreamObject,
  iORM.LiveBindings.CommonBSBehavior;

{ io }

class function io.Load(const ATypeName, ATypeAlias: String): IioWhere;
begin
  Result := TioWhereFactory.NewWhere;
  Result.TypeName := ATypeName;
  Result.TypeAlias := ATypeAlias;
  Result.TypeInfo := nil;
end;

class function io.Load(const AWhere: IioWhere): IioWhere;
begin
  Result := AWhere;
end;

class function io.LoadObject<T>(const ATypeAlias: String; const AID: Integer): T;
begin
  Result := io.Load<T>(ATypeAlias).ByID(AID).ToObject;
end;

class function io.LoadList<TListType>(const AWhere: IioWhere): TListType;
begin
  Result := Self.LoadList<TListType>('', AWhere);
end;

class function io.LoadList<TListType>(const AItemAlias: String; const AWhere: IioWhere): TListType;
var
  LItemRttiType: TRttiType;
begin
  LItemRttiType := TioUtilities.ExtractItemRttiType<TListType>;
  Result := TListType.Create;
  AWhere.TypeName := LItemRttiType.Name;
  AWhere.TypeAlias := AItemAlias;
  AWhere.TypeInfo := LItemRttiType.Handle;
  AWhere.ToList(Result);
end;

class function io.LoadObject<T>(const AWhere: IioWhere): T;
begin
  AWhere.TypeName := TioUtilities.GenericToString<T>;
  // AWhere.TypeInfo := TypeInfo(TItemType);
  Result := TioUtilities.CastObjectToGeneric<T>(AWhere.ToObject);
  // ----- OLD CODE -----
  // Result := io.Load<T>._Where(AWhere).ToObject;
  // ----- OLD CODE -----
end;

class procedure io.LoadToList<TItemType>(const AListObj: TObject; const AItemAlias: String);
begin
  Self.LoadToList<TItemType>(AListObj, AItemAlias, Self.Where);
end;

class procedure io.LoadToList<TItemType>(const AListObj: TObject; const AWhere: IioWhere);
begin
  Self.LoadToList<TItemType>(AListObj, '', AWhere);
end;

class procedure io.LoadToList<TItemType>(const AListObj: TObject; const AItemAlias: String; const AWhere: IioWhere);
begin
  AWhere.TypeName := TioUtilities.GenericToString<TItemType>;
  AWhere.TypeAlias := AItemAlias;
  // AWhere.TypeInfo := TypeInfo(TItemType);
  AWhere.ToList(AListObj);
end;

class function io.LoadList<TListType>(const AItemAlias: String): TListType;
begin
  Result := Self.LoadList<TListType>(AItemAlias, Self.Where);
end;

class function io.LoadObject<T>(const AID: Integer): T;
begin
  Result := io.Load<T>.ByID(AID).ToObject;
end;

class function io.Load(const AIID: TGUID; const ATypeAlias: String): IioWhere;
begin
  Result := Self.Load(TioUtilities.GUIDtoTypeInfo(AIID), ATypeAlias);
end;

class function io.Load<T>(const ATypeAlias: String): IioWhere<T>;
begin
  Result := TioWhereFactory.NewWhere<T>;
  Result.TypeName := TioUtilities.GenericToString<T>;
  Result.TypeAlias := ATypeAlias;
  Result.TypeInfo := TypeInfo(T);
end;

class function io.Where: IioWhere;
begin
  Result := TioWhereFactory.NewWhere;
end;

class function io.Where(const ATextCondition: String): IioWhere;
begin
  Result := Self.Where.Add(ATextCondition);
end;

class function io.Where(const APropertyName: String; const ACompareOp: TioCompareOp): IioWhere;
begin
  Result := Self.Where._Where(APropertyName, ACompareOp);
end;

class function io.Where(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: Variant): IioWhere;
begin
  Result := Self.Where._Where(APropertyName, ACompareOp, AValue);
end;

class function io.Where(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: TObject): IioWhere;
begin
  Result := Self.Where._Where(APropertyName, ACompareOp, AValue);
end;

class function io.Where(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: IInterface): IioWhere;
begin
  Result := Self.Where._Where(APropertyName, ACompareOp, AValue);
end;

class function io.Where<T>(const APropertyName: String; const ACompareOp: TioCompareOp): IioWhere<T>;
begin
  Result := Self.Where<T>._Where(APropertyName, ACompareOp);
end;

class function io.Where<T>(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: Variant): IioWhere<T>;
begin
  Result := Self.Where<T>._Where(APropertyName, ACompareOp, AValue);
end;

class function io.Where<T>(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: TObject): IioWhere<T>;
begin
  Result := Self.Where<T>._Where(APropertyName, ACompareOp, AValue);
end;

class function io.Where<T>(const APropertyName: String; const ACompareOp: TioCompareOp; const AValue: IInterface): IioWhere<T>;
begin
  Result := Self.Where<T>._Where(APropertyName, ACompareOp, AValue);
end;

class function io.Where<T>(const ATextCondition: String): IioWhere<T>;
begin
  Result := Self.Where<T>.Add(ATextCondition);
end;

class function io.Where<T>: IioWhere<T>;
begin
  Result := TioWhereFactory.NewWhere<T>;
end;

class function io.NotExists<T>(const ATypeAlias: String): boolean;
begin
  Result := Self.RefTo<T>(ATypeAlias).NotExists;
end;

class function io.NotExists<T>(const AWhere: IioWhere): boolean;
begin
  Result := Self.NotExists<T>('', AWhere);
end;

class function io.NotExists(const ATypeName, ATypeAlias: String): boolean;
begin
  Result := Self.RefTo(ATypeName, ATypeAlias).NotExists;
end;

class function io.NotExists(const ATypeName: String; const AWhere: IioWhere): boolean;
begin
  Result := Self.NotExists(ATypeName, '', AWhere);
end;

class function io.NotExists(const ATypeName, ATypeAlias: String; const AWhere: IioWhere): boolean;
begin
  AWhere.TypeName := ATypeName;
  AWhere.TypeAlias := ATypeAlias;
  Result := AWhere.NotExists;
end;

class function io.NotExists<T>(const ATypeAlias: String; const AWhere: IioWhere): boolean;
begin
  AWhere.TypeName := TioUtilities.GenericToString<T>(False);
  AWhere.TypeAlias := ATypeAlias;
  Result := AWhere.NotExists;
end;

class procedure io._PersistInternal(const AObj: TObject; const ARelationPropertyName: String; const ARelationOID: Integer; const ABlindInsert: boolean;
  const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String);
var
  LConnectionDefName: String;
begin
  LConnectionDefName := TioMapContainer.GetConnectionDefName(AObj.ClassName);
  // Get the strategy and call the proper funtionality
  TioStrategyFactory.GetStrategy(LConnectionDefName).PersistObject(AObj, ARelationPropertyName, ARelationOID, ABlindInsert, AMasterBSPersistence,
    AMasterPropertyName, AMasterPropertyPath);
end;

class procedure io.Persist(const AIntfObj: IInterface; const ABlindInsert: boolean);
begin
  Self.Persist(AIntfObj as TObject, ABlindInsert);
end;

class procedure io.PersistCollection(const ACollection: TObject; const ABlindInsert: boolean);
begin
  Self._PersistCollectionInternal(ACollection, '', 0, ABlindInsert, nil, '', '');
end;

class procedure io.Persist(const AObj: TObject; const ABlindInsert: boolean);
begin
  Self._PersistInternal(AObj, '', 0, ABlindInsert, nil, '', '');
end;

class procedure io.PersistCollection(const AIntfCollection: IInterface; const ABlindInsert: boolean);
begin
  Self.PersistCollection(AIntfCollection as TObject, ABlindInsert);
end;

class function io.RefTo(const AClassRef: TioClassRef; const ATypeAlias: String = ''): IioWhere;
begin
  Result := Self.Load(AClassRef, ATypeAlias);
end;

class function io.RefTo(const ATypeName, ATypeAlias: String): IioWhere;
begin
  Result := Self.Load(ATypeName, ATypeAlias);
end;

class function io.RefTo<T>(const ATypeAlias: String = ''): IioWhere<T>;
begin
  Result := Self.Load<T>(ATypeAlias);
end;

class procedure io.Reload(const AIntfObj: IInterface; const ALazy: boolean; const ALazyProps: String);
begin
  io.Reload(AIntfObj as TObject, ALazy, ALazyProps);
end;

class procedure io.Reload(const AIntfObj: IInterface; const ALazy: boolean);
begin
  io.Reload(AIntfObj as TObject, ALazy, '');
end;

class procedure io.Reload(const AIntfObj: IInterface; const ALazyProps: String);
begin
  io.Reload(AIntfObj as TObject, False, ALazyProps);
end;

class procedure io.ReloadList(const AListObj: TObject; const ALazy: boolean);
begin
  io.ReloadList(AListObj, ALazy, '');
end;

class procedure io.ReloadList(const AListObj: TObject; const ALazyProps: String);
begin
  io.ReloadList(AListObj, False, ALazyProps);
end;

class procedure io.ReloadList(const AListIntf: IInterface; const ALazy: boolean);
begin
  io.ReloadList(AListIntf as TObject, ALazy, '');
end;

class procedure io.ReloadList(const AListIntf: IInterface; const ALazyProps: String);
begin
  io.ReloadList(AListIntf as TObject, False, ALazyProps);
end;

class procedure io.ReloadList(const AListIntf: IInterface; const ALazy: boolean; const ALazyProps: String);
begin
  io.ReloadList(AListIntf as TObject, ALazy, ALazyProps);
end;

class procedure io.ReloadList(const AListObj: TObject; const ALazy: boolean; const ALazyProps: String);
var
  LDuckList: IioDuckTypedList;
  I: Integer;
begin
  LDuckList := TioDuckTypedFactory.DuckTypedList(AListObj);
  io.StartTransaction;
  try
    for I := 0 to LDuckList.Count - 1 do
      io.Reload(LDuckList.GetItem(I), ALazy, ALazyProps);
    io.CommitTransaction;
  except
    io.RollbackTransaction;
    raise;
  end;
end;

class procedure io.Reload(const AObj: TObject; const ALazy: boolean; const ALazyProps: String);
begin
  if not Assigned(AObj) then
    raise EioException.Create(ClassName, 'Reload', '"AObj" cannot be nil.');
  io.Load(AObj.ClassName).ByID(TioUtilities.ExtractOID(AObj)).Lazy(ALazy).LazyProps(ALazyProps).ClearListBefore.ToObject(AObj);
end;

class procedure io.Reload(const AObj: TObject; const ALazy: boolean);
begin
  io.Reload(AObj, ALazy, '');
end;

class procedure io.Reload(const AObj: TObject; const ALazyProps: String);
begin
  io.Reload(AObj, False, ALazyProps);
end;

class procedure io.RollbackTransaction(const AConnectionName: String);
begin
  TioStrategyFactory.GetStrategy(AConnectionName).RollbackTransaction(AConnectionName);
end;

class function io.SQL(const ASQL: String): IioSQLDestination;
begin
  Result := TioDBFactory.SQLDestination(ASQL);
end;

class procedure io.SetWaitProc(const AShowWaitProc: TProc; const AHideWaitProc: TProc);
begin
  TioConnectionManager.SetShowHideWaitProc(AShowWaitProc, AHideWaitProc);
end;

class procedure io.Show(const ATargetObj: TObject; const AViewContext: TComponent; const AVVMAlias: String);
begin
  if di.LocateSimpleViewFor(ATargetObj, AVVMAlias).Exist then
    di.LocateSimpleViewfor(ATargetObj, AVVMAlias).SetViewContext(AViewContext).Show
  else
    di.LocateViewVMfor(ATargetObj, AVVMAlias).SetViewContext(AViewContext).Show;
end;

class procedure io.Show(const ATargetObj: TObject; const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  if di.LocateSimpleViewFor(ATargetObj, AVVMAlias).Exist then
    di.LocateSimpleViewfor(ATargetObj, AVVMAlias).VCProvider(AVCProvider).Show
  else
    di.LocateViewVMfor(ATargetObj, AVVMAlias).VCProvider(AVCProvider).Show;
end;

class procedure io.Show(const ATargetObj: TObject; const AVVMAlias: String; const AVCProviderName: String);
begin
  if di.LocateSimpleViewFor(ATargetObj, AVVMAlias).Exist then
    di.LocateSimpleViewfor(ATargetObj, AVVMAlias).VCProvider(AVCProviderName).Show
  else
    di.LocateViewVMfor(ATargetObj, AVVMAlias).VCProvider(AVCProviderName).Show;
end;

class procedure io.Show(const ATargetIntf: IInterface; const AViewContext: TComponent; const AVVMAlias: String);
begin
  if di.LocateSimpleViewFor(ATargetIntf, AVVMAlias).Exist then
    di.LocateSimpleViewfor(ATargetIntf, AVVMAlias).SetViewContext(AViewContext).Show
  else
    di.LocateViewVMfor(ATargetIntf, AVVMAlias).SetViewContext(AViewContext).Show;
end;

class procedure io.Show<T>(const AVVMAlias: String; const AVCProviderName: String);
begin
  if di.LocateSimpleViewFor<T>(AVVMAlias).Exist then
    di.LocateSimpleViewfor<T>(AVVMAlias).VCProvider(AVCProviderName).Show
  else
    di.LocateViewVMfor<T>(AVVMAlias).VCProvider(AVCProviderName).Show;
end;

class procedure io.Show<T>(const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  if di.LocateSimpleViewFor<T>(AVVMAlias).Exist then
    di.LocateSimpleViewfor<T>(AVVMAlias).VCProvider(AVCProvider).Show
  else
    di.LocateViewVMfor<T>(AVVMAlias).VCProvider(AVCProvider).Show;
end;

class procedure io.Show<T>(const AViewContext: TComponent; const AVVMAlias: String);
begin
  if di.LocateSimpleViewFor<T>(AVVMAlias).Exist then
    di.LocateSimpleViewfor<T>(AVVMAlias).SetViewContext(AViewContext).Show
  else
    di.LocateViewVMfor<T>(AVVMAlias).SetViewContext(AViewContext).Show;
end;

class procedure io.Show(const ATargetIntf: IInterface; const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  if di.LocateSimpleViewFor(ATargetIntf, AVVMAlias).Exist then
    di.LocateSimpleViewfor(ATargetIntf, AVVMAlias).VCProvider(AVCProvider).Show
  else
    di.LocateViewVMfor(ATargetIntf, AVVMAlias).VCProvider(AVCProvider).Show;
end;

class procedure io.Show(const ATargetIntf: IInterface; const AVVMAlias: String; const AVCProviderName: String);
begin
  if di.LocateSimpleViewFor(ATargetIntf, AVVMAlias).Exist then
    di.LocateSimpleViewfor(ATargetIntf, AVVMAlias).VCProvider(AVCProviderName).Show
  else
    di.LocateViewVMfor(ATargetIntf, AVVMAlias).VCProvider(AVCProviderName).Show;
end;

class procedure io.ShowCurrent(const ABindSource: IioNotifiableBindSource; const AViewContext: TComponent; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ABindSource, True, False) then
    TioDependencyInjectionFactory.GetViewVMLocatorFor(ABindSource, AVVMAlias, False).SetViewContext(AViewContext).ShowCurrent;
end;

class procedure io.ShowCurrent(const ABindSource: IioNotifiableBindSource; const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ABindSource, True, False) then
    TioDependencyInjectionFactory.GetViewVMLocatorFor(ABindSource, AVVMAlias, False).VCProvider(AVCProvider).ShowCurrent;
end;

class procedure io.ShowCurrent(const ABindSource: IioNotifiableBindSource; const AVVMAlias: String; const AVCProviderName: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ABindSource, True, False) then
    TioDependencyInjectionFactory.GetViewVMLocatorFor(ABindSource, AVVMAlias, False).VCProvider(AVCProviderName).ShowCurrent;
end;

class procedure io.ShowEach(const ABindSource: IioNotifiableBindSource; const AViewContext: TComponent; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ABindSource, True, False) then
    TioDependencyInjectionFactory.GetViewVMLocatorFor(ABindSource, AVVMAlias, False).SetViewContext(AViewContext).ShowEach;
end;

class procedure io.ShowMessage(const AMessage: String);
begin
  TioApplication.ShowMessage(AMessage);
end;

class procedure io.ShowAsSelector(const ATargetBindSource: IioNotifiableBindSource; const AVVMAlias, AVCProviderName: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ATargetBindSource, False, False) then
    io.di.LocateViewVMfor(ATargetBindSource.GetTypeName, AVVMAlias).VCProvider(AVCProviderName).SetBindSourceAsSelectorFor(ATargetBindSource).Get;
end;

class procedure io.ShowAsSelector(const ATargetBindSource: IioNotifiableBindSource; const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ATargetBindSource, False, False) then
    io.di.LocateViewVMfor(ATargetBindSource.GetTypeName, AVVMAlias).VCProvider(AVCProvider).SetBindSourceAsSelectorFor(ATargetBindSource).Get;
end;

class procedure io.ShowAsSelector(const ATargetBindSource: IioNotifiableBindSource; const AViewContext: TComponent; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ATargetBindSource, False, False) then
    io.di.LocateViewVMfor(ATargetBindSource.GetTypeName, AVVMAlias).SetViewContext(AViewContext).SetBindSourceAsSelectorFor(ATargetBindSource).Get;
end;

class procedure io.ShowAsSelector<T>(const ATargetMP: IioNotifiableBindSource; const AViewContext: TComponent; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ATargetMP, False, False) then
    io.di.LocateViewVMfor<T>(AVVMAlias).SetViewContext(AViewContext).SetBindSourceAsSelectorFor(ATargetMP).Get;
end;

class procedure io.ShowAsSelector<T>(const ATargetMP: IioNotifiableBindSource; const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ATargetMP, False, False) then
    io.di.LocateViewVMfor<T>(AVVMAlias).VCProvider(AVCProvider).SetBindSourceAsSelectorFor(ATargetMP).Get;
end;

class procedure io.ShowAsSelector<T>(const ATargetMP: IioNotifiableBindSource; const AVVMAlias, AVCProviderName: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ATargetMP, False, False) then
    io.di.LocateViewVMfor<T>(AVVMAlias).VCProvider(AVCProviderName).SetBindSourceAsSelectorFor(ATargetMP).Get;
end;

class procedure io.ShowEach(const AModelPresenter: IioNotifiableBindSource; const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(AModelPresenter, True, False) then
    TioDependencyInjectionFactory.GetViewVMLocatorFor(AModelPresenter, AVVMAlias, False).VCProvider(AVCProvider).ShowEach;
end;

class procedure io.ShowEach(const AModelPresenter: IioNotifiableBindSource; const AVVMAlias: String; const AVCProviderName: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(AModelPresenter, True, False) then
    TioDependencyInjectionFactory.GetViewVMLocatorFor(AModelPresenter, AVVMAlias, False).VCProvider(AVCProviderName).ShowEach;
end;

class procedure io.ShowWait;
begin
  TioConnectionManager.ShowWaitProc;
end;

class function io.SQL(const ASQLDestination: IioSQLDestination): IioSQLDestination;
begin
  Result := ASQLDestination;
end;

class function io.SQL(const ASQL: TStrings; const AOwns: boolean): IioSQLDestination;
begin
  Result := TioDBFactory.SQLDestination(ASQL, AOwns);
end;

class procedure io.StartTransaction(const AConnectionName: String);
begin
  TioStrategyFactory.GetStrategy(AConnectionName).StartTransaction(AConnectionName);
end;

class procedure io.AnonymousTimer(const AIntervalMillisec: Integer; const AExecuteMethod: TFunc<boolean>);
begin
  TioAnonymousTimer.Create(AIntervalMillisec, AExecuteMethod);
end;

class procedure io.CommitTransaction(const AConnectionName: String);
begin
  TioStrategyFactory.GetStrategy(AConnectionName).CommitTransaction(AConnectionName);
end;

class function io.Connections: TioConnectionManagerRef;
begin
  Result := Self.GlobalFactory.DBFactory.ConnectionManager;
end;

class function io.Count<T>(const ATypeAlias: String): Integer;
begin
  Result := Self.RefTo<T>(ATypeAlias).Count;
end;

class function io.Count<T>(const AWhere: IioWhere): Integer;
begin
  Result := Self.Count<T>('', AWhere);
end;

class function io.Count(const ATypeName, ATypeAlias: String): Integer;
begin
  Result := Self.RefTo(ATypeName, ATypeAlias).Count;
end;

class function io.Count(const ATypeName: String; const AWhere: IioWhere): Integer;
begin
  Result := Self.Count(ATypeName, '', AWhere);
end;

class function io.Count(const ATypeName, ATypeAlias: String; const AWhere: IioWhere): Integer;
begin
  AWhere.TypeName := ATypeName;
  AWhere.TypeAlias := ATypeAlias;
  Result := AWhere.Count;
end;

class function io.Count<T>(const ATypeAlias: String; const AWhere: IioWhere): Integer;
begin
  AWhere.TypeName := TioUtilities.GenericToString<T>(False);
  AWhere.TypeAlias := ATypeAlias;
  Result := AWhere.Count;
end;

class function io.Create<T>(const ATypeAlias: String; const AParams: TioConstructorParams): T;
begin
  Result := di.Locate<T>(ATypeAlias).ConstructorParams(AParams).Get;
end;

class function io.CreateView<T>(const AViewContext: TComponent; const AParams: TioConstructorParams): T;
begin
  Result := di.LocateView<T>.SetViewContext(AViewContext).ConstructorParams(AParams).Get;
end;

class function io.CreateView<T>(const ATypeAlias: String; const AViewContext: TComponent; const AParams: TioConstructorParams): T;
begin
  Result := di.LocateView<T>(ATypeAlias).SetViewContext(AViewContext).ConstructorParams(AParams).Get;
end;

class function io.CreateView<T>(const AViewModel: IioViewModel; const AParams: TioConstructorParams): T;
begin
  Result := di.LocateView<T>.SetViewModel(AViewModel).ConstructorParams(AParams).Get;
end;

class function io.CreateView<T>(const ATypeAlias: String; const AVCProvider: TioViewContextProvider; const AParams: TioConstructorParams): T;
begin
  Result := di.LocateView<T>(ATypeAlias).VCProvider(AVCProvider).ConstructorParams(AParams).Get;
end;

class function io.CreateView<T>(const ATypeAlias: String; const AParams: TioConstructorParams): T;
begin
  Result := di.LocateView<T>(ATypeAlias).ConstructorParams(AParams).Get;
end;

class function io.CreateView<T>(const AParams: TioConstructorParams): T;
begin
  Result := di.LocateView<T>.ConstructorParams(AParams).Get;
end;

class function io.CreateView<T>(const AVCProvider: TioViewContextProvider; const AParams: TioConstructorParams): T;
begin
  Result := di.LocateView<T>.VCProvider(AVCProvider).ConstructorParams(AParams).Get;
end;

class function io.CreateView<T>(const AViewContext: TComponent; const AViewModel: IioViewModel; const AParams: TioConstructorParams): T;
begin
  Result := di.LocateView<T>.SetViewContext(AViewContext).SetViewModel(AViewModel).ConstructorParams(AParams).Get;
end;

class function io.CreateView<T>(const ATypeAlias: String; const AViewContext: TComponent; const AViewModel: IioViewModel;
  const AParams: TioConstructorParams): T;
begin
  Result := di.LocateView<T>(ATypeAlias).SetViewContext(AViewContext).SetViewModel(AViewModel).ConstructorParams(AParams).Get;
end;

class function io.CreateViewFor<T>(const AVVMAlias: String; const AVCProvider: TioViewContextProvider; const AParams: TioConstructorParams): TComponent;
begin
  Result := io.di.LocateViewFor<T>(AVVMAlias).ConstructorParams(AParams).VCProvider(AVCProvider).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateViewFor<T>(const AViewContext: TComponent; const AParams: TioConstructorParams): TComponent;
begin
  Result := io.di.LocateViewFor<T>.ConstructorParams(AParams).SetViewContext(AViewContext).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateViewFor<T>(const AVVMAlias: String; const AViewContext: TComponent; const AParams: TioConstructorParams): TComponent;
begin
  Result := io.di.LocateViewFor<T>(AVVMAlias).ConstructorParams(AParams).SetViewContext(AViewContext).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateViewFor<T>(const AVVMAlias: String; const AParams: TioConstructorParams): TComponent;
begin
  Result := io.di.LocateViewFor<T>(AVVMAlias).ConstructorParams(AParams).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateViewFor<T>(const AParams: TioConstructorParams): TComponent;
begin
  Result := io.di.LocateViewFor<T>.ConstructorParams(AParams).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateViewFor<T>(const AVCProvider: TioViewContextProvider; const AParams: TioConstructorParams): TComponent;
begin
  Result := io.di.LocateViewFor<T>.ConstructorParams(AParams).VCProvider(AVCProvider).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateViewFor<T>(const AVVMAlias: String; const AVCProvider: TioViewContextProvider; const AViewModel: IioViewModel;
  const AParams: TioConstructorParams): TComponent;
begin
  Result := io.di.LocateViewFor<T>(AVVMAlias).ConstructorParams(AParams).VCProvider(AVCProvider).SetViewModel(AViewModel).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateViewFor<T>(const AViewContext: TComponent; const AViewModel: IioViewModel; const AParams: TioConstructorParams): TComponent;
begin
  Result := io.di.LocateViewFor<T>.ConstructorParams(AParams).SetViewContext(AViewContext).SetViewModel(AViewModel).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateViewFor<T>(const AVVMAlias: String; const AViewContext: TComponent; const AViewModel: IioViewModel; const AParams: TioConstructorParams)
  : TComponent;
begin
  Result := io.di.LocateViewFor<T>(AVVMAlias).ConstructorParams(AParams).SetViewContext(AViewContext).SetViewModel(AViewModel).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateViewFor<T>(const AViewModel: IioViewModel; const AParams: TioConstructorParams): TComponent;
begin
  Result := io.di.LocateViewFor<T>.ConstructorParams(AParams).SetViewModel(AViewModel).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateViewFor<T>(const AVVMAlias: String; const AViewModel: IioViewModel; const AParams: TioConstructorParams): TComponent;
begin
  Result := io.di.LocateViewFor<T>(AVVMAlias).ConstructorParams(AParams).SetViewModel(AViewModel).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateViewFor<T>(const AVCProvider: TioViewContextProvider; const AViewModel: IioViewModel; const AParams: TioConstructorParams): TComponent;
begin
  Result := io.di.LocateViewFor<T>.ConstructorParams(AParams).VCProvider(AVCProvider).SetViewModel(AViewModel).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateViewModelFor<T>(const AAlias: String; const AParams: TioConstructorParams): IioViewModel;
begin
  Result := io.di.LocateVMfor<T>(AAlias).ConstructorParams(AParams).GetAsGeneric.OfType<IioViewModel>;
end;

class function io.CreateViewModelFor<T>(const AParams: TioConstructorParams): IioViewModel;
begin
  Result := io.di.LocateVMfor<T>.ConstructorParams(AParams).GetAsGeneric.OfType<IioViewModel>;
end;

class function io.CreateView<T>(const ATypeAlias: String; const AVCProvider: TioViewContextProvider; const AViewModel: IioViewModel;
  const AParams: TioConstructorParams): T;
begin
  Result := di.LocateView<T>(ATypeAlias).VCProvider(AVCProvider).SetViewModel(AViewModel).ConstructorParams(AParams).Get;
end;

class function io.CreateView<T>(const ATypeAlias: String; const AViewModel: IioViewModel; const AParams: TioConstructorParams): T;
begin
  Result := di.LocateView<T>(ATypeAlias).SetViewModel(AViewModel).ConstructorParams(AParams).Get;
end;

class function io.CreateView<T>(const AVCProvider: TioViewContextProvider; const AViewModel: IioViewModel; const AParams: TioConstructorParams): T;
begin
  Result := di.LocateView<T>.VCProvider(AVCProvider).SetViewModel(AViewModel).ConstructorParams(AParams).Get;
end;

class procedure io.CreateViewViewModel<TView, TViewModel>(const AAlias: String; const AVCProvider: TioViewContextProvider);
begin
  di.LocateViewVM<TView, TViewModel>(AAlias, AAlias).VCProvider(AVCProvider).Show;
end;

class procedure io.CreateViewViewModel<TView, TViewModel>(const AAlias: String; const AVCProviderName: String);
begin
  di.LocateViewVM<TView, TViewModel>(AAlias, AAlias).VCProvider(AVCProviderName).Show;
end;

class procedure io.CreateViewViewModel<TView, TViewModel>(const AVCProvider: TioViewContextProvider);
begin
  di.LocateViewVM<TView, TViewModel>.VCProvider(AVCProvider).Show;
end;

class procedure io.CreateViewViewModel<TView, TViewModel>(const AViewContext: TComponent);
begin
  di.LocateViewVM<TView, TViewModel>.SetViewContext(AViewContext).Show;
end;

class procedure io.CreateViewViewModel<TView, TViewModel>(const AAlias: String; const AViewContext: TComponent);
begin
  di.LocateViewVM<TView, TViewModel>(AAlias, AAlias).SetViewContext(AViewContext).Show;
end;

class procedure io.CreateViewViewModelFor<T>(const AVVMAlias: String; const AVCProviderName: String);
begin
  Self.Show<T>(AVVMAlias, AVCProviderName);
end;

class procedure io.CreateViewViewModelFor<T>(const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  Self.Show<T>(AVCProvider, AVVMAlias);
end;

class procedure io.CreateViewViewModelFor<T>(const AViewContext: TComponent; const AVVMAlias: String);
begin
  Self.Show<T>(AViewContext, AVVMAlias);
end;

class function io.CreateViewModel<T>(const AParams: TioConstructorParams): T;
begin
  Result := di.LocateVM<T>.ConstructorParams(AParams).Get;
end;

class function io.CreateViewModel<T>(const AAlias: String; const AParams: TioConstructorParams): T;
begin
  Result := di.LocateVM<T>(AAlias).ConstructorParams(AParams).Get;
end;

class function io.Create<T>(const AParams: TioConstructorParams): T;
begin
  Result := di.Locate<T>.ConstructorParams(AParams).Get;
end;

class procedure io.Delete(const AObj: TObject);
var
  LConnectionDefName: String;
begin
  LConnectionDefName := TioMapContainer.GetConnectionDefName(AObj.ClassName);
  TioStrategyFactory.GetStrategy(LConnectionDefName).DeleteObject(AObj);
end;

class function io.DBBuilder(const AConnectionDefName: String; const AAddIndexes, AAddForeignKeys: boolean): IioDBBuilderEngine;
begin
  Result := GlobalFactory.DBBuilderFactory.NewEngine(AConnectionDefName, AAddIndexes, AAddForeignKeys);
end;

class function io.DBBuilder(const AAddIndexes, AAddForeignKeys: boolean): IioDBBuilderEngine;
begin
  Result := GlobalFactory.DBBuilderFactory.NewEngine(AAddIndexes, AAddForeignKeys);
end;

class procedure io.Delete(const AIntfObj: IInterface);
begin
  Self.Delete(AIntfObj as TObject);
end;

class procedure io.Delete<T>(const AID: Integer);
begin
  Self.Delete<T>('', AID);
end;

class procedure io.Delete<T>(const ATypeAlias: String; const AID: Integer);
begin
  Self.RefTo<T>(ATypeAlias).ByID(AID).Delete;
end;

class procedure io.DeleteAll<T>(const ATypeAlias: String);
begin
  Self.RefTo<T>(ATypeAlias).Delete;
end;

class procedure io.DeleteAll<T>(const AWhere: IioWhere);
begin
  Self.DeleteAll<T>('', AWhere);
end;

class procedure io.DeleteAll<T>(const ATypeAlias: String; const AWhere: IioWhere);
begin
  AWhere.TypeName := TioUtilities.GenericToString<T>(False);
  AWhere.TypeAlias := ATypeAlias;
  AWhere.Delete;
end;

class procedure io.DeleteList(const AListIntf: IInterface);
begin
  Self.DeleteList(AListIntf as TObject);
end;

class procedure io.DeleteList(const AListObj: TObject);
var
  LConnectionDefName: String;
begin
  LConnectionDefName := TioConnectionManager.GetCurrentConnectionName;
  TioStrategyFactory.GetStrategy(LConnectionDefName).DeleteCollection(AListObj);
end;

class function io.di: TioDependencyInjectionRef;
begin
  Result := TioDependencyInjection;
end;

class function io.Exists<T>(const ATypeAlias: String): boolean;
begin
  Result := Self.RefTo<T>(ATypeAlias).Exists;
end;

class function io.Exists<T>(const AWhere: IioWhere): boolean;
begin
  Result := Self.Exists<T>('', AWhere);
end;

class function io.Exists(const ATypeName, ATypeAlias: String): boolean;
begin
  Result := Self.RefTo(ATypeName, ATypeAlias).Exists;
end;

class function io.Exists(const ATypeName, ATypeAlias: String; const AWhere: IioWhere): boolean;
begin
  AWhere.TypeName := ATypeName;
  AWhere.TypeAlias := ATypeAlias;
  Result := AWhere.Exists;
end;

class function io.Exists(const ATypeName: String; const AWhere: IioWhere): boolean;
begin
  Result := Self.Exists(ATypeName, '', AWhere);
end;

class function io.Exists<T>(const ATypeAlias: String; const AWhere: IioWhere): boolean;
begin
  AWhere.TypeName := TioUtilities.GenericToString<T>(False);
  AWhere.TypeAlias := ATypeAlias;
  Result := AWhere.Exists;
end;

class function io.ExtractOID(const AIntfObj: IInterface): Integer;
begin
  Result := TioUtilities.ExtractOID(AIntfObj);
end;

class function io.ExtractOID(const AObj: TObject): Integer;
begin
  Result := TioUtilities.ExtractOID(AObj);
end;

class function io.GlobalFactory: TioGlobalFactoryRef;
begin
  Result := TioGlobalFactory;
end;

class procedure io.HandleException(Sender: TObject);
begin
  TioApplication.HandleException(Sender);
end;

class procedure io.HideWait;
begin
  TioConnectionManager.HideWaitProc;
end;

class function io.InTransaction(const AConnectionName: String): boolean;
begin
  Result := TioStrategyFactory.GetStrategy(AConnectionName).InTransaction(AConnectionName);
end;

class function io.Load(const AClassRef: TioClassRef; const ATypeAlias: String): IioWhere;
begin
  Result := Self.Load(AClassRef.ClassInfo, ATypeAlias);
end;

class function io.Load(const ATypeInfo: PTypeInfo; const ATypeAlias: String): IioWhere;
begin
  Result := TioWhereFactory.NewWhere;
  Result.TypeName := TioUtilities.TypeInfoToTypeName(ATypeInfo);
  Result.TypeAlias := ATypeAlias;
  Result.TypeInfo := ATypeInfo;
end;

class procedure io._PersistCollectionInternal(const ACollection: TObject; const ARelationPropertyName: String; const ARelationOID: Integer;
  const ABlindInsert: boolean; const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String);
var
  LConnectionDefName: String;
begin
  LConnectionDefName := TioConnectionManager.GetCurrentConnectionName;
  TioStrategyFactory.GetStrategy(LConnectionDefName).PersistCollection(ACollection, ARelationPropertyName, ARelationOID, ABlindInsert, AMasterBSPersistence,
    AMasterPropertyName, AMasterPropertyPath);
end;

class function io.TerminateApplication: boolean;
begin
  Result := TioApplication.Terminate;
end;

class function io.RefTo(const AWhere: IioWhere): IioWhere;
begin
  Result := Self.Load(AWhere);
end;

class procedure io.LoadToList<TItemType>(const AListIntf: IInterface; const AItemAlias: String);
begin
  Self.LoadToList<TItemType>(AListIntf as TObject, AItemAlias);
end;

class procedure io.LoadToList<TItemType>(const AListIntf: IInterface; const AWhere: IioWhere);
begin
  Self.LoadToList<TItemType>(AListIntf as TObject, AWhere);
end;

class procedure io.LoadToList<TItemType>(const AListIntf: IInterface; const AItemAlias: String; const AWhere: IioWhere);
begin
  Self.LoadToList<TItemType>(AListIntf as TObject, AItemAlias, AWhere);
end;

class procedure io.LoadToObject<T>(const AObj: TObject; const AID: Integer);
begin
  io.Load<T>.ByID(AID).ToObject(AObj);
end;

class procedure io.LoadToObject<T>(const AObj: TObject; const ATypeAlias: String; const AID: Integer);
begin
  io.Load<T>(ATypeAlias).ByID(AID).ToObject(AObj);
end;

class procedure io.LoadToObject<T>(const AObj: TObject; const ATypeAlias: String; const AWhere: IioWhere);
begin
  AWhere.TypeName := TioUtilities.GenericToString<T>;
  AWhere.TypeAlias := ATypeAlias;
  // AWhere.TypeInfo := TypeInfo(TItemType);
  AWhere.ToObject(AObj);
  // ----- OLD CODE -----
  // io.Load<T>(ATypeAlias)._Where(AWhere).ToObject(AObj);
  // ----- OLD CODE -----
end;

class procedure io.LoadToObject<T>(const AObj: TObject; const AWhere: IioWhere);
begin
  AWhere.TypeName := TioUtilities.GenericToString<T>;
  // AWhere.TypeInfo := TypeInfo(TItemType);
  AWhere.ToObject(AObj);
  // ----- OLD CODE -----
  // io.Load<T>._Where(AWhere).ToObject(AObj);
  // ----- OLD CODE -----
end;

class function io.LoadObject<T>(const ATypeAlias: String; const AWhere: IioWhere): T;
begin
  AWhere.TypeName := TioUtilities.GenericToString<T>;
  AWhere.TypeAlias := ATypeAlias;
  // AWhere.TypeInfo := TypeInfo(TItemType);
  Result := TioUtilities.CastObjectToGeneric<T>(AWhere.ToObject);
  // ----- OLD CODE -----
  // Result := io.Load<T>(ATypeAlias)._Where(AWhere).ToObject;
  // ----- OLD CODE -----
end;

class procedure io.LoadToObject<T>(const AIntfObj: IInterface; const AID: Integer);
begin
  Self.LoadToObject<T>(AIntfObj as TObject, AID);
end;

class procedure io.LoadToObject<T>(const AIntfObj: IInterface; const ATypeAlias: String; const AID: Integer);
begin
  Self.LoadToObject<T>(AIntfObj as TObject, ATypeAlias, AID);
end;

class procedure io.LoadToObject<T>(const AIntfObj: IInterface; const ATypeAlias: String; const AWhere: IioWhere);
begin
  Self.LoadToObject<T>(AIntfObj as TObject, ATypeAlias, AWhere);
end;

class procedure io.LoadToObject<T>(const AIntfObj: IInterface; const AWhere: IioWhere);
begin
  Self.LoadToObject<T>(AIntfObj as TObject, AWhere);
end;

initialization

// Initialize the dependency injection container
// NB: Crea semplicemente il dictionary, la registrazione delle classi avviene più sotto chiamando TioMapContainer.Build
TioDependencyInjectionContainer.Build;

// Register as default DuckTypedStreamObject invoker
// NB: L'ho messo qui perchè altrimenti nella unit dove è dichiarata la classe non
// venive eseguito
// NB:  Evita un AV error probabilmente causato dal fatto che i vari containers della parte ORM non sono ancora a posto
io.di.RegisterClass<TioDuckTypedStreamObject>.Implements<IioDuckTypedStreamObject>.DisableMapImplemetersRef.Execute;

// Create the ContextContainer Instance and Init it by loading
// all entities declarated in the application
// NB: Attualmente effettua sia il mapping delle classi per la parte ORM che la registrazione delle classi al DIC (magari meglio separare le cose?)
TioMapContainer.Build;

end.
