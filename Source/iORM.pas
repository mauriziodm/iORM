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
unit iORM;

interface

uses
  System.Classes, System.SysUtils, System.TypInfo, System.Generics.Collections, DJSON,
  iORM.CommonTypes, iORM.Where.Interfaces, iORM.Attributes, iORM.LiveBindings.BSPersistence,
  iORM.DB.ConnectionContainer, iORM.DB.Interfaces, iORM.DBBuilder.Interfaces, iORM.DependencyInjection, iORM.Global.Factory,
  iORM.DependencyInjection.Interfaces, iORM.MVVM.ViewContextProvider, iORM.MVVM.Interfaces, iORM.MVVM.ModelPresenter.Custom,
  iORM.LiveBindings.Interfaces, iORM.MVVM.ViewRegister,
  iORM.StdActions.Interfaces, iORM.Context.Container,
  iORM.Context.Properties.Interfaces, iORM.Where.SmartBuilder,
  iORM.Interceptor.Strategy.Register, iORM.Interceptor.CRUD.Register,
  iORM.ETM.Engine, iORM.ETM.Interfaces, DJSON.Params,
  iORM.ConflictStrategy.Interfaces, iORM.ConflictStrategy.SameVersionWin, iORM.ConflictStrategy.LastUpdateWin,
  iORM.Context.Interfaces, iORM.SynchroStrategy.Interfaces, iORM.MVVM.ViewModel;

const
  IORM_VERSION = 'iORM 2 (beta 3.4)';

{$REGION 'Value aliases to make sure you have to include fewer units (in practice only the iORM unit) in the "uses" part of the units that use iORM'}
  // NULL value constants
  IO_INTEGER_NULL_VALUE = iORM.CommonTypes.IO_INTEGER_NULL_VALUE;
  IO_STRING_NULL_VALUE = iORM.CommonTypes.IO_STRING_NULL_VALUE;
  IO_DATETIME_NULL_VALUE = iORM.CommonTypes.IO_DATETIME_NULL_VALUE;

  // BlindLevel bit value
  BL_BIT_DETECT_OBJ_EXISTS = iORM.CommonTypes.BL_BIT_DETECT_OBJ_EXISTS;
  BL_BIT_AUTO_UPDATE_PROPS = iORM.CommonTypes.BL_BIT_AUTO_UPDATE_PROPS;
  BL_BIT_DETECT_CONFLICTS = iORM.CommonTypes.BL_BIT_DETECT_CONFLICTS;
  // BlindLevel constant values
  BL_DEFAULT = iORM.CommonTypes.BL_DEFAULT;
  BL_ALL = iORM.CommonTypes.BL_ALL;
  BL_NONE = iORM.CommonTypes.BL_NONE;
  BL_ETM_PERSIST_TIMESLOT = iORM.CommonTypes.BL_ETM_PERSIST_TIMESLOT;
  BL_ETM_REVERT_TO_OBJ = iORM.CommonTypes.BL_ETM_REVERT_TO_OBJ;
  BL_ETM_REVERT_TO_DB = iORM.CommonTypes.BL_ETM_REVERT_TO_DB;
  BL_SYNCHRO_PERSIST_LOGITEM = iORM.CommonTypes.BL_SYNCHRO_PERSIST_LOGITEM;
  BL_SYNCHRO_PERSIST_PAYLOAD_TOCLIENT = iORM.CommonTypes.BL_SYNCHRO_PERSIST_PAYLOAD_TOCLIENT;
  BL_SYNCHRO_PERSIST_PAYLOAD_TOSERVER = iORM.CommonTypes.BL_SYNCHRO_PERSIST_PAYLOAD_TOSERVER;

  // TioTypeOfCollection = (tcSingleObject, tcList);
  tcSingleObject = iORM.CommonTypes.TioTypeOfCollection.tcSingleObject;
  tcList = iORM.CommonTypes.TioTypeOfCollection.tcList;

  // TioLoadType = (ltManual, ltCreate, ltFromBSAsIs, ltFromBSReload, ltFromBSReloadNewInstance, ltAuto)
  ltManual = iORM.CommonTypes.TioLoadType.ltManual;
  ltFromBSAsIs = iORM.CommonTypes.TioLoadType.ltFromBSAsIs;
  ltFromBSReload = iORM.CommonTypes.TioLoadType.ltFromBSReload;
  ltFromBSReloadNewInstance = iORM.CommonTypes.TioLoadType.ltFromBSReloadNewInstance;
  ltAuto = iORM.CommonTypes.TioLoadType.ltAuto;

  // TioObjStatus = (osDirty = 0, osClean, osDeleted)
  osDirty = iORM.CommonTypes.TioObjStatus.osDirty;
  osClean = iORM.CommonTypes.TioObjStatus.osClean;
  osDeleted = iORM.CommonTypes.TioObjStatus.osDeleted;

  // TioCompareOp = (coEquals, coNotEquals, coGreater, coLower, coGreaterOrEqual, coLowerOrEqual, coLike, coNotLike, coIsNull, coIsNotNull)
  coEquals = iORM.CommonTypes.TioCompareOp.coEquals;
  coNotEquals = iORM.CommonTypes.TioCompareOp.coNotEquals;
  coGreater = iORM.CommonTypes.TioCompareOp.coGreater;
  coLower = iORM.CommonTypes.TioCompareOp.coLower;
  coGreaterOrEqual = iORM.CommonTypes.TioCompareOp.coGreaterOrEqual;
  coLowerOrEqual = iORM.CommonTypes.TioCompareOp.coLowerOrEqual;
  coLike = iORM.CommonTypes.TioCompareOp.coLike;
  coNotLike = iORM.CommonTypes.TioCompareOp.coNotLike;
  coIsNull = iORM.CommonTypes.TioCompareOp.coIsNull;
  coIsNotNull = iORM.CommonTypes.TioCompareOp.coIsNotNull;

  // TioLogicOp = (loAnd, loOr, loNot, loOpenPar, loClosePar)
  loAnd = iORM.CommonTypes.TioLogicOp.loAnd;
  loOr = iORM.CommonTypes.TioLogicOp.loOr;
  loNot = iORM.CommonTypes.TioLogicOp.loNot;
  loOpenPar = iORM.CommonTypes.TioLogicOp.loOpenPar;
  loClosePar = iORM.CommonTypes.TioLogicOp.loClosePar;

  // TioIndexOrientation = (ioAscending = 0, ioDescending)
  ioAscending = iORM.CommonTypes.TioIndexOrientation.ioAscending;
  ioDescending = iORM.CommonTypes.TioIndexOrientation.ioDescending;

  // TioMonitorMode = (mmDisabled = 0, mmRemote, mmFlatFile)
  mmDisabled = iORM.CommonTypes.TioMonitorMode.mmDisabled;
  mmRemote = iORM.CommonTypes.TioMonitorMode.mmRemote;
  mmFlatFile = iORM.CommonTypes.TioMonitorMode.mmFlatFile;

  // TioSelectionType = (stAppend, stInsert)
  stAppend = iORM.CommonTypes.TioSelectionType.stAppend;
  stInsert = iORM.CommonTypes.TioSelectionType.stInsert;

  // TioActionShowMode = (smBSCurrent, smBSEach, smEntityTypeName, smEntityTypeNameAsSelector, smBSTypeNameAsSelector)
  smBSCurrent = iORM.StdActions.Interfaces.smBSCurrent;
  smBSEach = iORM.StdActions.Interfaces.smBSEach;
  smEntityTypeName = iORM.StdActions.Interfaces.smEntityTypeName;
  smEntityTypeNameAsSelector = iORM.StdActions.Interfaces.smEntityTypeNameAsSelector;

  // TioActionViewContextBy = (vcByDefaultViewContextProvider, vcByViewContextProviderName, vcByViewContextProvider, vcByViewContext)
  vcByDefaultViewContextProvider = iORM.StdActions.Interfaces.vcByDefaultViewContextProvider;
  vcByViewContextProviderName = iORM.StdActions.Interfaces.vcByViewContextProviderName;
  vcByViewContextProvider = iORM.StdActions.Interfaces.vcByViewContextProvider;
  vcByViewContext = iORM.StdActions.Interfaces.vcByViewContext;
  // vcNone = iORM.StdActions.Interfaces.vcNone;

  // TioFKAction = (fkUnspecified, fkNoAction, fkSetNull, fkSetDefault, fkCascade);
  fkUnspecified = iORM.Attributes.fkUnspecified;
  fkNoAction = iORM.Attributes.fkNoAction;
  fkSetNull = iORM.Attributes.fkSetNull;
  fkSetDefault = iORM.Attributes.fkSetDefault;
  fkCascade = iORM.Attributes.fkCascade;

  // TioFKCreate = (fkCreate, fkDoNotCreate);
  fkCreate = iORM.Attributes.fkCreate;
  fkDoNotCreate = iORM.Attributes.fkDoNotCreate;

  // TioJoinType = (jtInner, jtCross, jtLeftOuter, jtRightOuter, jtFullOuter);
  jtInner = iORM.Attributes.jtInner;
  jtCross = iORM.Attributes.jtCross;
  jtLeftOuter = iORM.Attributes.jtLeftOuter;
  jtRightOuter = iORM.Attributes.jtRightOuter;
  jtFullOuter = iORM.Attributes.jtFullOuter;

  // TioMapModeType = (mmHybrid, mmProperties, mmFields);
  mmHybrid = iORM.Attributes.mmHybrid;
  mmProperties = iORM.Attributes.mmProperties;
  mmFields = iORM.Attributes.mmFields;

  // TioTrueClassMode = (tcDisabled, tcSmart, tcmStrictly);
  tcDisabled = iORM.Attributes.tcDisabled;
  tcSmart = iORM.Attributes.tcSmart;
  tcmStrictly = iORM.Attributes.tcmStrictly;

  // TioRelationType = (rtNone, rtBelongsTo, rtHasMany, rtHasOne, rtEmbeddedHasMany, rtEmbeddedHasOne);
  rtNone = iORM.Attributes.rtNone;
  rtBelongsTo = iORM.Attributes.rtBelongsTo;
  rtHasMany = iORM.Attributes.rtHasMany;
  rtHasOne = iORM.Attributes.rtHasOne;
  rtEmbeddedHasMany = iORM.Attributes.rtEmbeddedHasMany;
  rtEmbeddedHasOne = iORM.Attributes.rtEmbeddedHasOne;

  // TioPersistenceActionType = (atDoNotPersist, atInsert, atUpdate, atDelete);
  atDoNotPersist = iORM.CommonTypes.atDoNotPersist;
  atInsert = iORM.CommonTypes.atInsert;
  atUpdate = iORM.CommonTypes.atUpdate;
  atDelete = iORM.CommonTypes.atDelete;
  // TioPersistenceIntentType = (itRegular, itRevert, itSynchronization);
  itRegular = iORM.CommonTypes.itRegular;
  itRevert = iORM.CommonTypes.itRevert;
  itSynchro_PersistToServer = iORM.CommonTypes.itSynchro_PersistToServer;
  itSynchro_PersistToClient = iORM.CommonTypes.itSynchro_PersistToClient;
  // TioPersistenceConflictState = (csUndefined, csResolved, csRejected, csRejectedRaise);
  csUndefined = iORM.CommonTypes.csUndefined;
  csResolved = iORM.CommonTypes.csResolved;
  csRejected = iORM.CommonTypes.csRejected;
  csRejectedRaise = iORM.CommonTypes.csRejectedRaise;
  // TioFreeObjAfterPersistOrDelete = (foKeepAlive, foFree, foFreeAndNil);
  foKeepAlive = iORM.CommonTypes.foKeepAlive;
  foFree = iORM.CommonTypes.foFree;
  foFreeAndNil = iORM.CommonTypes.foFreeAndNil;

  // TioEtmDiffMode = (dmOneway, dmTwoway);
  dmOneway = iORM.ETM.Interfaces.TioEtmDiffMode.dmOneway;
  dmTwoway = iORM.ETM.Interfaces.TioEtmDiffMode.dmTwoway;

  // TdjSkipScope = (ssMap, ssETM, ssHTTP, ssEmbeddeRelation, ssSUD, ssSaveRevertPoint, ssDJSON);
  ssMap = DJSON.Params.TdjSkipScope.ssMap;
  ssETM = DJSON.Params.TdjSkipScope.ssETM;
  ssHTTP = DJSON.Params.TdjSkipScope.ssHTTP;
  ssEmbeddeRelation = DJSON.Params.TdjSkipScope.ssEmbeddeRelation;
  ssSUD = DJSON.Params.TdjSkipScope.ssSUD;
  ssSaveRevertPoint = DJSON.Params.TdjSkipScope.ssSaveRevertPoint;
  ssDJSON = DJSON.Params.TdjSkipScope.ssDJSON;

  // TioStdAction_ETM_AutoExec_AfterRevert = (doNothing, doRefresh, doReload);
  doNothing = iORM.CommonTypes.doNothing;
  doRefresh = iORM.CommonTypes.doRefresh;
  doReload = iORM.CommonTypes.doReload;

  // TioBSCloseQueryActionUpdateScope = (usLocal, usDisableIfChilds, usGlobal);
  usLocal = iORM.CommonTypes.usLocal;
  usDisableIfChilds = iORM.CommonTypes.usDisableIfChilds;
  usGlobal = iORM.CommonTypes.usGlobal;

  // TioBSCloseQueryOnEditingAction = (eaDisable, eaAutoPersist, eaAutoRevert);
  eaDisable = iORM.CommonTypes.eaDisable;
  eaAutoPersist = iORM.CommonTypes.eaAutoPersist;
  eaAutoRevert = iORM.CommonTypes.eaAutoRevert;

  // TioBSCloseQueryOnExecuteAction = (eaClose, eaTerminateApplication);
  eaClose = iORM.CommonTypes.eaClose;
  eaTerminateApplication = iORM.CommonTypes.eaTerminateApplication;

  // TioBSCloseQueryRepeaterScope = (rsFirstLevelChilds, rsDeepChilds);
  rsFirstLevelChilds = iORM.CommonTypes.rsFirstLevelChilds;
  rsDeepChilds = iORM.CommonTypes.rsDeepChilds;

  // TioEtmTimeSlotSynchroState = (stRegular, stToBeSynchronized, stSynchronized_SentToServer, stSynchronized_ReceivedFromServer, stSynchronized_ReceivedFromClient);
  stRegular = iORM.Attributes.stRegular;
  stToBeSynchronized = iORM.Attributes.stToBeSynchronized;
  stSynchronized_SentToServer = iORM.Attributes.stSynchronized_SentToServer;
  stSynchronized_ReceivedFromServer = iORM.Attributes.stSynchronized_ReceivedFromServer;
  stSynchronized_ReceivedFromClient = iORM.Attributes.stSynchronized_ReceivedFromClient;

  // TioSynchroLevel = (slIncremental, slFull);
  slIncremental = iORM.SynchroStrategy.Interfaces.slIncremental;
  slFull = iORM.SynchroStrategy.Interfaces.slFull;
  // TioSynchroStatus = (ssInitialization, ssLoadFromClient, ssPersistToServer, ssReloadFromServer, ssPersistToClient, ssFinalization, ssCompleted);
  ssInitialization = iORM.SynchroStrategy.Interfaces.ssInitialization;
  ssLoadFromClient = iORM.SynchroStrategy.Interfaces.ssLoadFromClient;
  ssPersistToServer = iORM.SynchroStrategy.Interfaces.ssPersistToServer;
  ssReloadFromServer = iORM.SynchroStrategy.Interfaces.ssReloadFromServer;
  ssPersistToClient = iORM.SynchroStrategy.Interfaces.ssPersistToClient;
  ssFinalization = iORM.SynchroStrategy.Interfaces.ssFinalization;
  ssCompleted = iORM.SynchroStrategy.Interfaces.ssCompleted;
  // TioSynchroErrorState = (esOK, esNotCompleted, esError);
  esOK = iORM.SynchroStrategy.Interfaces.esOK;
  esNotCompleted = iORM.SynchroStrategy.Interfaces.esNotCompleted;
  esError = iORM.SynchroStrategy.Interfaces.esError;

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
  TioObjCreated = iORM.CommonTypes.TioObjCreated;
  TioObjCreatedUserID = iORM.CommonTypes.TioObjCreatedUserID;
  TioObjCreatedUserName = iORM.CommonTypes.TioObjCreatedUserName;
  TioObjUpdated = iORM.CommonTypes.TioObjUpdated;
  TioObjUpdatedUserID = iORM.CommonTypes.TioObjUpdatedUserID;
  TioObjUpdatedUserName = iORM.CommonTypes.TioObjUpdatedUserName;
  TioSelectionType = iORM.CommonTypes.TioSelectionType;
  TioShowWaitProc = iORM.CommonTypes.TioShowWaitProc;
  TioTypeOfCollection = iORM.CommonTypes.TioTypeOfCollection;

  IioWhere = iORM.Where.Interfaces.IioWhere;
  IioProperty = iORM.Context.Properties.Interfaces.IioProperty;

  TioMapModeType = iORM.Attributes.TioMapModeType;
  TioTrueClassMode = iORM.Attributes.TioTrueClassMode;

  TioRelationType = iORM.Attributes.TioRelationType;
  TioFKAction = iORM.Attributes.TioFKAction;
  TioFKCreate = iORM.Attributes.TioFKCreate;
  TioJoinType = iORM.Attributes.TioJoinType;

  TioActionShowMode = iORM.StdActions.Interfaces.TioActionShowMode;
  TioActionViewContextBy = iORM.StdActions.Interfaces.TioActionViewContextBy;

  // FD monitor and trace mode
  TioMonitorMode = iORM.CommonTypes.TioMonitorMode;

  // Persistence types
  TioPersistenceActionType = iORM.CommonTypes.TioPersistenceActionType;
  TioPersistenceIntentType = iORM.CommonTypes.TioPersistenceIntentType;
  TioPersistenceConflictState = iORM.CommonTypes.TioPersistenceConflictState;
  TioFreeObjAfterPersistOrDelete = iORM.CommonTypes.TioFreeObjAfterPersistOrDelete;

  // Conflict Strategy
  TioCustomConflictStrategy = iORM.ConflictStrategy.Interfaces.TioCustomConflictStrategy;
  TioSameVersionWin = iORM.ConflictStrategy.SameVersionWin.TioSameVersionWin;
  TioLastUpdateWin = iORM.ConflictStrategy.LastUpdateWin.TioLastUpdateWin;

  // Entity Time Machine (ETM)
  TioEtmTimeLine = iORM.Attributes.TioEtmTimeLine;
  TioEtmCustomTimeSlot = iORM.Attributes.TioEtmCustomTimeSlot;
  TioEtmDiffMode = iORM.ETM.Interfaces.TioEtmDiffMode;
  TioEtmTimeSlotSynchroState = iORM.Attributes.TioEtmTimeSlotSynchroState;

  // SkipScope (vedi anche sopra (const) i valori)
  TioSkipScope = DJSON.Params.TdjSkipScope;
  TioSkipScopeSet = DJSON.Params.TdjSkipScopeSet;

  // StdActions types
  TioStdAction_ETM_AutoExec_AfterRevert = iORM.CommonTypes.TioStdAction_ETM_AutoExec_AfterRevert;
  TioBSCloseQueryActionUpdateScope = iORM.CommonTypes.TioBSCloseQueryActionUpdateScope;
  TioBSCloseQueryOnEditingAction = iORM.CommonTypes.TioBSCloseQueryOnEditingAction;
  TioBSCloseQueryOnExecuteAction = iORM.CommonTypes.TioBSCloseQueryOnExecuteAction;
  TioBSCloseQueryRepeaterScope = iORM.CommonTypes.TioBSCloseQueryRepeaterScope;

  // Synchro strategies
  TioSynchroLevel = iORM.SynchroStrategy.Interfaces.TioSynchroLevel;
  TioSynchroStatus = iORM.SynchroStrategy.Interfaces.TioSynchroStatus;
  TioSynchroErrorState = iORM.SynchroStrategy.Interfaces.TioSynchroErrorState;

  // ViewModel class
  TioViewModel = iORM.MVVM.ViewModel.TioViewModel;

{$ENDREGION}
  // Attributes aliases to make sure you have to include fewer units (in practice only the iORM unit) in the "uses" part of the units that use iORM
{$REGION 'Attributes aliases to make sure you have to include fewer units (in practice only the iORM unit) in the "uses" part of the units that use iORM'}
  // Property attributes
  ioSkip = iORM.Attributes.ioSkip;
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

  // Class attributes
  ioEntity = iORM.Attributes.ioEntity;
  ioNotPersistedEntity = iORM.Attributes.ioNotPersistedEntity;
  ioKeyGenerator = iORM.Attributes.ioKeyGenerator;
  ioKeySequence = iORM.Attributes.ioKeySequence;
  ioConnection = iORM.Attributes.ioConnection;
  ioTrueClass = iORM.Attributes.ioTrueClass;
  ioGroupBy = iORM.Attributes.ioGroupBy;
  ioJoin = iORM.Attributes.ioJoin;
  ioIndex = iORM.Attributes.ioIndex;

  // Relations attributes
  ioBelongsTo = iORM.Attributes.ioBelongsTo;
  ioHasMany = iORM.Attributes.ioHasMany;
  ioHasOne = iORM.Attributes.ioHasOne;
  ioEmbeddedHasMany = iORM.Attributes.ioEmbeddedHasMany;
  ioEmbeddedHasOne = iORM.Attributes.ioEmbeddedHasOne;
  ioDisableRelationAutodetect = iORM.Attributes.ioDisableRelationAutodetect;

  // SmartWhereAttributes
  ioWhereAttribute = iORM.Attributes.ioWhereAttribute;
  ioWhereGroupAttribute = iORM.Attributes.ioWhereGroupAttribute;
  ioWhereNullValueAttribute = iORM.Attributes.ioWhereNullValueAttribute;
  ioWhereSkipAttribute = iORM.Attributes.ioWhereSkipAttribute;

  // Dependency Injection attributes
  diRegister = iORM.Attributes.diRegister;
  diImplements = iORM.Attributes.diImplements;
  diSimpleViewImplements = iORM.Attributes.diSimpleViewImplements;
  diSimpleViewFor = iORM.Attributes.diSimpleViewFor;
  diViewImplements = iORM.Attributes.diViewImplements;
  diViewFor = iORM.Attributes.diViewFor;
  diViewModelImplements = iORM.Attributes.diViewModelImplements;
  diVMImplements = iORM.Attributes.diVMImplements;
  diViewModelFor = iORM.Attributes.diViewModelFor;
  diDoNotRegisterAsInterfacedEntity = iORM.Attributes.diDoNotRegisterAsInterfacedEntity;
  diAsSingleton = iORM.Attributes.diAsSingleton;
  ioInject = iORM.Attributes.ioInject;

  // Conflict strategies attributes
  ioConflictStrategyAttribute = iORM.ConflictStrategy.Interfaces.ioConflictStrategyAttribute;
  ioDeleteConflictStrategyAttribute = iORM.ConflictStrategy.Interfaces.ioDeleteConflictStrategyAttribute;
  ioInsertConflictStrategyAttribute = iORM.ConflictStrategy.Interfaces.ioInsertConflictStrategyAttribute;
  ioUpdateConflictStrategyAttribute = iORM.ConflictStrategy.Interfaces.ioUpdateConflictStrategyAttribute;

  // ETM attributes
  etmRepository = iORM.Attributes.etmRepository;
  etmTrace = iORM.Attributes.etmTrace;
  etmProperty = iORM.Attributes.etmPropertyAttribute;

  // Other attributes
  ioMarker = iORM.Attributes.ioMarker;
  ioEnumerated = iORM.Attributes.ioEnumerated;

{$ENDREGION}

  // iORM facade
  io = class
  private
    class procedure _FreeObjAfterPersistOrDelete(const [ref] AObj: TObject; const AFree: TioFreeObjAfterPersistOrDelete); static; inline;
  public
    // KeepClass
    class procedure KeepClass(const AClass: TClass);

    // AnonymousTimer
    class procedure AnonymousTimer(const AIntervalMillisec: Integer; const AExecuteMethod: TFunc<boolean>);

    // Registered enumerated types container
    class function Enums: TioEnumContainerExRef;

    // Entity Time Machine (ETM)
    class function ETM: TIoEtmEngineRef;

    // Interceptors
    class function StrategyInterceptors: TioStrategyInterceptorRegisterRef;
    class function CRUDInterceptors: TioCRUDInterceptorRegisterRef;

    // Global VCProvider register
    class function DefaultVCProvider: TioViewContextProvider;
    class function VCProviderByName(const AVCProviderName: String): TioViewContextProvider;

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
    class procedure ReloadObject(const AObj: TObject; const ALazy: boolean; const ALazyProps: String); overload;
    class procedure ReloadObject(const AObj: TObject; const ALazy: boolean = False); overload;
    class procedure ReloadObject(const AObj: TObject; const ALazyProps: String); overload;
    // Reload object as interface
    class procedure ReloadObject(const AIntfObj: IInterface; const ALazy: boolean; const ALazyProps: String); overload;
    class procedure ReloadObject(const AIntfObj: IInterface; const ALazy: boolean = False); overload;
    class procedure ReloadObject(const AIntfObj: IInterface; const ALazyProps: String); overload;
    // Reload list as class
    class procedure ReloadList(const AListObj: TObject; const ALazy: boolean; const ALazyProps: String); overload;
    class procedure ReloadList(const AListObj: TObject; const ALazy: boolean = False); overload;
    class procedure ReloadList(const AListObj: TObject; const ALazyProps: String); overload;
    // Reload list as interface
    class procedure ReloadList(const AListIntf: IInterface; const ALazy: boolean; const ALazyProps: String); overload;
    class procedure ReloadList(const AListIntf: IInterface; const ALazy: boolean = False); overload;
    class procedure ReloadList(const AListIntf: IInterface; const ALazyProps: String); overload;
    // LoadObjVersion (internal use)
    class function LoadObjVersion(const AContext: IioContext): Integer;

    // DeleteObject (accepting instance to delete directly)
    class procedure DeleteObject(const [ref] AObj: TObject; const ABlindLevel: Byte = BL_DEFAULT; const AFree: TioFreeObjAfterPersistOrDelete = foKeepAlive); overload;
    class procedure DeleteObject(const [ref] AObj: TObject; const AFree: TioFreeObjAfterPersistOrDelete); overload;
    class procedure DeleteObject(const AIntfObj: IInterface; const ABlindLevel: Byte = BL_DEFAULT); overload;
    class procedure _DeleteObjectInternal(const AObj: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte); static;
    // DeleteList (accepting instance to delete directly)
    class procedure DeleteList(const [ref] AListObj: TObject; const ABlindLevel: Byte = BL_DEFAULT; const AFree: TioFreeObjAfterPersistOrDelete = foKeepAlive); overload;
    class procedure DeleteList(const [ref] AListObj: TObject; const AFree: TioFreeObjAfterPersistOrDelete); overload;
    class procedure DeleteList(const AListIntf: IInterface; const ABlindLevel: Byte = BL_DEFAULT); overload;
    class procedure _DeleteListInternal(const AListObj: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte); static;
    // Delete (accepting generic type to delete and ciriteria)
    // NB: I metodi Delete qui sotto prima caricano gli oggetti vivi e poi li eliminano in modo che funzioni anche ETM e ConflictStrategy
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
    // Max (accepting generic type and ciriteria)
    class function Max(const ATypeName, APropertyName: String; const ATypeAlias: String = ''): Integer; overload;
    class function Max(const ATypeName, APropertyName: String; const AWhere: IioWhere): Integer; overload;
    class function Max(const ATypeName, APropertyName: String; const ATypeAlias: String; const AWhere: IioWhere): Integer; overload;
    class function Max<T>(const APropertyName: String; const ATypeAlias: String = ''): Integer; overload;
    class function Max<T>(const APropertyName: String; const AWhere: IioWhere): Integer; overload;
    class function Max<T>(const APropertyName: String; const ATypeAlias: String; const AWhere: IioWhere): Integer; overload;
    // Min (accepting generic type and ciriteria)
    class function Min(const ATypeName, APropertyName: String; const ATypeAlias: String = ''): Integer; overload;
    class function Min(const ATypeName, APropertyName: String; const AWhere: IioWhere): Integer; overload;
    class function Min(const ATypeName, APropertyName: String; const ATypeAlias: String; const AWhere: IioWhere): Integer; overload;
    class function Min<T>(const APropertyName: String; const ATypeAlias: String = ''): Integer; overload;
    class function Min<T>(const APropertyName: String; const AWhere: IioWhere): Integer; overload;
    class function Min<T>(const APropertyName: String; const ATypeAlias: String; const AWhere: IioWhere): Integer; overload;
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

    // PersistObject (accepting instance to persist directly)
    class procedure PersistObject(const [ref] AObj: TObject; const ABlindLevel: Byte = BL_DEFAULT; const AFree: TioFreeObjAfterPersistOrDelete = foKeepAlive); overload;
    class procedure PersistObject(const [ref] AObj: TObject; const AFree: TioFreeObjAfterPersistOrDelete); overload;
    class procedure PersistObject(const AIntfObj: IInterface; const ABlindLevel: Byte = BL_DEFAULT); overload;
    class procedure _PersistObject(const AObj: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte); static;
    class procedure _PersistObjectInternal(const AObj: TObject; const AIntent: TioPersistenceIntentType; const ARelationPropertyName: String;
      const ARelationOID: Integer; const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String;
      const ABlindLevel: Byte); static;
    // PersistCollection (accepting instance to persist directly)
    class procedure PersistList(const [ref] AList: TObject; const ABlindLevel: Byte = BL_DEFAULT; const AFree: TioFreeObjAfterPersistOrDelete = foKeepAlive); overload;
    class procedure PersistList(const [ref] AList: TObject; const AFree: TioFreeObjAfterPersistOrDelete); overload;
    class procedure PersistList(const AListIntf: IInterface; const ABlindLevel: Byte = BL_DEFAULT); overload;
    class procedure _PersistList(const AList: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte); static;
    class procedure _PersistListInternal(const AList: TObject; const AIntent: TioPersistenceIntentType; const ARelationPropertyName: String;
      const ARelationOID: Integer; const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String;
      const ABlindLevel: Byte); static;

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

    class function SmartWhereBuilder: TioWhereSmartBuilderRef;

    class function SQL(const ASQL: String): IioSQLDestination; overload;
    class function SQL(const ASQL: TStrings; const AOwns: boolean = False): IioSQLDestination; overload;
    class function SQL(const ASQLDestination: IioSQLDestination): IioSQLDestination; overload;

    class procedure SetWaitProc(const AShowWaitProc: TProc = nil; const AHideWaitProc: TProc = nil);
    class procedure ShowWait;
    class procedure HideWait;

    class function DBBuilder(const AAddIndexes: boolean = True; const AAddForeignKeys: boolean = True): IioDBBuilderEngine; overload;
    class function DBBuilder(const AConnectionDefName: String; const AAddIndexes: boolean = True; const AAddForeignKeys: boolean = True)
      : IioDBBuilderEngine; overload;

    // Dependency Injection Container (DIC)
    class function di: TioDependencyInjectionRef;

    class function ExtractOID(const AObj: TObject): Integer; overload;
    class function ExtractOID(const AIntfObj: IInterface): Integer; overload;
    class function GlobalFactory: TioGlobalFactoryRef;
    class procedure HandleException(Sender: TObject);
    class procedure ShowMessage(const AMessage: String);
    class function TerminateApplication: boolean;

    // Create instance by DIC
    class function Create(const ATypeName: String; const ATypeAlias: String = ''; const AParams: TioConstructorParams = nil): TObject; overload;
    class function Create<T: IInterface>(const ATypeAlias: String = ''; const AParams: TioConstructorParams = nil): T; overload;

    // Create SimpleView instance
    class function CreateSimpleView(const ASVTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String = '';
      const AParams: TioConstructorParams = nil): TComponent; overload;
    class function CreateSimpleView(const ASVTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider;
      const ASVAlias: String = ''; const AParams: TioConstructorParams = nil): TComponent; overload;
    class function CreateSimpleView(const ASVTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent;
      const ASVAlias: String = ''; const AParams: TioConstructorParams = nil): TComponent; overload;
    class function CreateSimpleView(const ASVTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewModel: IioViewModel;
      const ASVAlias: String = ''; const AParams: TioConstructorParams = nil): TComponent; overload;
    class function CreateSimpleView(const ASVTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider;
      const AViewModel: IioViewModel; const ASVAlias: String = ''; const AParams: TioConstructorParams = nil): TComponent; overload;
    class function CreateSimpleView(const ASVTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent;
      const AViewModel: IioViewModel; const ASVAlias: String = ''; const AParams: TioConstructorParams = nil): TComponent; overload;
    class function CreateSimpleView<T: IInterface>(const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String = '';
      const AParams: TioConstructorParams = nil): T; overload;
    class function CreateSimpleView<T: IInterface>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider;
      const ASVAlias: String = ''; const AParams: TioConstructorParams = nil): T; overload;
    class function CreateSimpleView<T: IInterface>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent;
      const ASVAlias: String = ''; const AParams: TioConstructorParams = nil): T; overload;
    class function CreateSimpleView<T: IInterface>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewModel: IioViewModel;
      const ASVAlias: String = ''; const AParams: TioConstructorParams = nil): T; overload;
    class function CreateSimpleView<T: IInterface>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider;
      const AViewModel: IioViewModel; const ASVAlias: String = ''; const AParams: TioConstructorParams = nil): T; overload;
    class function CreateSimpleView<T: IInterface>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent;
      const AViewModel: IioViewModel; const ASVAlias: String = ''; const AParams: TioConstructorParams = nil): T; overload;
    // Create View instance for a specified type of instances
    class function CreateSimpleViewFor<T: IInterface>(const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String = '';
      const AParams: TioConstructorParams = nil): TComponent; overload;
    class function CreateSimpleViewFor<T: IInterface>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider;
      const ASVAlias: String = ''; const AParams: TioConstructorParams = nil): TComponent; overload;
    class function CreateSimpleViewFor<T: IInterface>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent;
      const ASVAlias: String = ''; const AParams: TioConstructorParams = nil): TComponent; overload;
    class function CreateSimpleViewFor<T: IInterface>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewModel: IioViewModel;
      const ASVAlias: String = ''; const AParams: TioConstructorParams = nil): TComponent; overload;
    class function CreateSimpleViewFor<T: IInterface>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider;
      const AViewModel: IioViewModel; const ASVAlias: String = ''; const AParams: TioConstructorParams = nil): TComponent; overload;
    class function CreateSimpleViewFor<T: IInterface>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent;
      const AViewModel: IioViewModel; const ASVAlias: String = ''; const AParams: TioConstructorParams = nil): TComponent; overload;

    // Create View instance
    class function CreateView(const AViewTypeName: String; const AVAlias: String = ''; const AParams: TioConstructorParams = nil): TComponent; overload;
    class function CreateView(const AViewTypeName: String; const AVCProvider: TioViewContextProvider; const AVAlias: String = '';
      const AParams: TioConstructorParams = nil): TComponent; overload;
    class function CreateView(const AViewTypeName: String; const AViewContext: TComponent; const AVAlias: String = '';
      const AParams: TioConstructorParams = nil): TComponent; overload;
    class function CreateView(const AViewTypeName: String; const AViewModel: IioViewModel; const AVAlias: String = '';
      const AParams: TioConstructorParams = nil): TComponent; overload;
    class function CreateView(const AViewTypeName: String; const AVCProvider: TioViewContextProvider; const AViewModel: IioViewModel;
      const AVAlias: String = ''; const AParams: TioConstructorParams = nil): TComponent; overload;
    class function CreateView(const AViewTypeName: String; const AViewContext: TComponent; const AViewModel: IioViewModel; const AVAlias: String = '';
      const AParams: TioConstructorParams = nil): TComponent; overload;
    class function CreateView<T: IInterface>(const AVAlias: String = ''; const AParams: TioConstructorParams = nil): T; overload;
    class function CreateView<T: IInterface>(const AVCProvider: TioViewContextProvider; const AVAlias: String = ''; const AParams: TioConstructorParams = nil)
      : T; overload;
    class function CreateView<T: IInterface>(const AViewContext: TComponent; const AVAlias: String = ''; const AParams: TioConstructorParams = nil): T;
      overload;
    class function CreateView<T: IInterface>(const AViewModel: IioViewModel; const AVAlias: String = ''; const AParams: TioConstructorParams = nil): T;
      overload;
    class function CreateView<T: IInterface>(const AVCProvider: TioViewContextProvider; const AViewModel: IioViewModel; const AVAlias: String = '';
      const AParams: TioConstructorParams = nil): T; overload;
    class function CreateView<T: IInterface>(const AViewContext: TComponent; const AViewModel: IioViewModel; const AVAlias: String = '';
      const AParams: TioConstructorParams = nil): T; overload;
    // Create View instance for a specified type of instances
    class function CreateViewFor<T>(const AVAlias: String = ''; const AParams: TioConstructorParams = nil): TComponent; overload;
    class function CreateViewFor<T>(const AVCProvider: TioViewContextProvider; const AVAlias: String = ''; const AParams: TioConstructorParams = nil)
      : TComponent; overload;
    class function CreateViewFor<T>(const AViewContext: TComponent; const AVAlias: String = ''; const AParams: TioConstructorParams = nil): TComponent;
      overload;
    class function CreateViewFor<T>(const AViewModel: IioViewModel; const AVAlias: String = ''; const AParams: TioConstructorParams = nil): TComponent;
      overload;
    class function CreateViewFor<T>(const AVCProvider: TioViewContextProvider; const AViewModel: IioViewModel; const AVAlias: String = '';
      const AParams: TioConstructorParams = nil): TComponent; overload;
    class function CreateViewFor<T>(const AViewContext: TComponent; const AViewModel: IioViewModel; const AVAlias: String = '';
      const AParams: TioConstructorParams = nil): TComponent; overload;

    // Create ViewModel instance
    class function CreateVM(const AVMTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String = '';
      const AParams: TioConstructorParams = nil): IioViewModel; overload;
    class function CreateVM<T: IioViewModel>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String = '';
      const AParams: TioConstructorParams = nil): T; overload;
    // Create ViewModel instance for a specified type of instances
    class function CreateVMFor<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String = ''; const AParams: TioConstructorParams = nil)
      : IioViewModel; overload;

    // Create View & ViewModel coupled instances
    class procedure CreateViewVM(const AViewTypeName, AVMTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction;
      const AVVMAlias: String = ''); overload;
    class procedure CreateViewVM(const AViewTypeName, AVMTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction;
      const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure CreateViewVM(const AViewTypeName, AVMTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent;
      const AVVMAlias: String = ''); overload;
    class procedure CreateViewVM<TView: IInterface; TViewModel: IioViewModel>(const AParentCloseQueryAction: IioBSCloseQueryAction;
      const AVVMAlias: String = ''); overload;
    class procedure CreateViewVM<TView: IInterface; TViewModel: IioViewModel>(const AParentCloseQueryAction: IioBSCloseQueryAction;
      const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure CreateViewVM<TView: IInterface; TViewModel: IioViewModel>(const AParentCloseQueryAction: IioBSCloseQueryAction;
      const AViewContext: TComponent; const AVVMAlias: String = ''); overload;

    // Show instance as TObject (even passing ViewContextProvider or an already created ViewContext)
    class procedure Show(const ATargetObj: TObject; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    class procedure Show(const ATargetObj: TObject; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure Show(const ATargetObj: TObject; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;
    // Show instance as IInterface (even passing ViewContextProvider or an already created ViewContext)
    class procedure Show(const ATargetIntf: IInterface; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    class procedure Show(const ATargetIntf: IInterface; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure Show(const ATargetIntf: IInterface; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;
    // Show the EntityTypeName specified (even passing ViewContextProvider or an already created ViewContext)
    class procedure Show(const AEntityTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    class procedure Show(const AEntityTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure Show(const AEntityTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;
    // Show the EntityTypeName specified + where (even passing ViewContextProvider or an already created ViewContext)
    class procedure Show(const AEntityTypeName: String; const AWhere: IioWhere; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    class procedure Show(const AEntityTypeName: String; const AWhere: IioWhere; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure Show(const AEntityTypeName: String; const AWhere: IioWhere; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;
    // Show the generic type <T> (even passing ViewContextProvider or an already created ViewContext)
    class procedure Show<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    class procedure Show<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure Show<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;
    // Show the generic type <T> + where (even passing ViewContextProvider or an already created ViewContext)
    class procedure Show<T>(const AWhere: IioWhere; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    class procedure Show<T>(const AWhere: IioWhere; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure Show<T>(const AWhere: IioWhere; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;

    // Show current record/instance of a BindSource (even passing ViewContextProvider or an already created ViewContext)
    class procedure ShowCurrent(const ABindSource: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    class procedure ShowCurrent(const ABindSource: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure ShowCurrent(const ABindSource: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;

    // Show each record/instance of a BindSource (even passing ViewContextProvider or an already created ViewContext)
    class procedure ShowEach(const ABindSource: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    class procedure ShowEach(const ABindSource: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure ShowEach(const ABindSource: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;

    // ShowAsSelector (entity type from AEntityTypeName parameter)
    class procedure ShowAsSelector(const AEntityTypeName: String; const ASelectionTargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    class procedure ShowAsSelector(const AEntityTypeName: String; const ASelectionTargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure ShowAsSelector(const AEntityTypeName: String; const ASelectionTargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;
    // ShowAsSelector + where (entity type from AEntityTypeName parameter)
    class procedure ShowAsSelector(const AEntityTypeName: String; const AWhere: IioWhere; const ASelectionTargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    class procedure ShowAsSelector(const AEntityTypeName: String; const AWhere: IioWhere; const ASelectionTargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure ShowAsSelector(const AEntityTypeName: String; const AWhere: IioWhere; const ASelectionTargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;
    // ShowAsSelector (Entity type from generic type parameter)
    class procedure ShowAsSelector<T>(const ASelectionTargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    class procedure ShowAsSelector<T>(const ASelectionTargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure ShowAsSelector<T>(const ASelectionTargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;
    // ShowAsSelector  + where (Entity type from generic type parameter)
    class procedure ShowAsSelector<T>(const AWhere: IioWhere; const ASelectionTargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    class procedure ShowAsSelector<T>(const AWhere: IioWhere; const ASelectionTargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure ShowAsSelector<T>(const AWhere: IioWhere; const ASelectionTargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;

    // ShowAsWherebuilder (entity type from AEntityTypeName parameter)
    class procedure ShowAsWhereBuilder(const AEntityTypeName: String; const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    class procedure ShowAsWhereBuilder(const AEntityTypeName: String; const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure ShowAsWhereBuilder(const AEntityTypeName: String; const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;
    // ShowAsWherebuilder + where (entity type from AEntityTypeName parameter)
    class procedure ShowAsWhereBuilder(const AEntityTypeName: String; const AWhere: IioWhere; const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    class procedure ShowAsWhereBuilder(const AEntityTypeName: String; const AWhere: IioWhere; const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure ShowAsWhereBuilder(const AEntityTypeName: String; const AWhere: IioWhere; const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;
    // ShowAsWherebuilder (Entity type from generic type parameter)
    class procedure ShowAsWhereBuilder<T>(const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    class procedure ShowAsWhereBuilder<T>(const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure ShowAsWhereBuilder<T>(const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;
    // ShowAsWherebuilder + where (Entity type from generic type parameter)
    class procedure ShowAsWhereBuilder<T>(const AWhere: IioWhere; const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    class procedure ShowAsWhereBuilder<T>(const AWhere: IioWhere; const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure ShowAsWhereBuilder<T>(const AWhere: IioWhere; const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;

    // ShowAsETM (entity type from AEntityTypeName parameter)
    class procedure ShowAsETM(const AEntityTypeName: String; const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    class procedure ShowAsETM(const AEntityTypeName: String; const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure ShowAsETM(const AEntityTypeName: String; const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;
    // ShowAsETM + where (entity type from AEntityTypeName parameter)
    class procedure ShowAsETM(const AEntityTypeName: String; const AWhere: IioWhere; const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    class procedure ShowAsETM(const AEntityTypeName: String; const AWhere: IioWhere; const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure ShowAsETM(const AEntityTypeName: String; const AWhere: IioWhere; const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;
    // ShowAsETM (Entity type from generic type parameter)
    class procedure ShowAsETM<T>(const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    class procedure ShowAsETM<T>(const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure ShowAsETM<T>(const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;
    // ShowAsETM + where (Entity type from generic type parameter)
    class procedure ShowAsETM<T>(const AWhere: IioWhere; const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String = ''); overload;
    class procedure ShowAsETM<T>(const AWhere: IioWhere; const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String = ''); overload;
    class procedure ShowAsETM<T>(const AWhere: IioWhere; const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String = ''); overload;

    // Version
    class function Version: String;
  end;

implementation

uses
  System.Rtti, iORM.Exceptions, iORM.Utilities, iORM.Where.Factory, iORM.PersistenceStrategy.Factory, iORM.DuckTyped.Interfaces,
  iORM.DuckTyped.Factory, iORM.DB.Factory, iORM.Abstraction, iORM.DuckTyped.StreamObject,
  iORM.LiveBindings.CommonBSBehavior, iORM.MVVM.ViewContextProviderContainer;

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
  LItemRttiType := TioUtilities.ExtractItemRttiTypeByGeneric<TListType>;
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

class function io.LoadObjVersion(const AContext: IioContext): Integer;
var
  LConnectionDefName: String;
begin
  LConnectionDefName := AContext.GetTable.GetConnectionDefName;
  Result := TioPersistenceStrategyFactory.GetStrategy(LConnectionDefName).LoadObjVersion(AContext);
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

class procedure io._PersistObject(const AObj: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte);
begin
  _PersistObjectInternal(AObj, AIntent, '', 0, nil, '', '', ABlindLevel);
end;

class procedure io._PersistObjectInternal(const AObj: TObject; const AIntent: TioPersistenceIntentType; const ARelationPropertyName: String;
      const ARelationOID: Integer; const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String;
      const ABlindLevel: Byte);
var
  LConnectionDefName: String;
begin
  LConnectionDefName := TioMapContainer.GetConnectionDefName(AObj.ClassName);
  // Get the strategy and call the proper funtionality
  TioPersistenceStrategyFactory.GetStrategy(LConnectionDefName).PersistObject(AObj, AIntent, ARelationPropertyName, ARelationOID, AMasterBSPersistence,
    AMasterPropertyName, AMasterPropertyPath, ABlindLevel);
end;

class procedure io.PersistList(const [ref] AList: TObject; const AFree: TioFreeObjAfterPersistOrDelete);
begin
  PersistList(AList, BL_DEFAULT, AFree);
end;

class procedure io.PersistObject(const AIntfObj: IInterface; const ABlindLevel: Byte);
begin
  _PersistObjectInternal(AIntfObj as TObject, itRegular, '', 0, nil, '', '', ABlindLevel);
end;

class procedure io.PersistList(const [ref] AList: TObject; const ABlindLevel: Byte; const AFree: TioFreeObjAfterPersistOrDelete);
begin
  _PersistListInternal(AList, itRegular, '', 0, nil, '', '', ABlindLevel);
  _FreeObjAfterPersistOrDelete(AList, AFree);
end;

class procedure io.PersistObject(const [ref] AObj: TObject; const ABlindLevel: Byte; const AFree: TioFreeObjAfterPersistOrDelete);
begin
  _PersistObjectInternal(AObj, itRegular, '', 0, nil, '', '', ABlindLevel);
  _FreeObjAfterPersistOrDelete(AObj, AFree);
end;

class procedure io.PersistList(const AListIntf: IInterface; const ABlindLevel: Byte);
begin
  _PersistListInternal(AListIntf as TObject, itRegular, '', 0, nil, '', '', ABlindLevel);
end;

class procedure io.PersistObject(const [ref] AObj: TObject; const AFree: TioFreeObjAfterPersistOrDelete);
begin
  PersistObject(AObj, BL_DEFAULT, AFree);
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

class procedure io.ReloadObject(const AIntfObj: IInterface; const ALazy: boolean; const ALazyProps: String);
begin
  io.ReloadObject(AIntfObj as TObject, ALazy, ALazyProps);
end;

class procedure io.ReloadObject(const AIntfObj: IInterface; const ALazy: boolean);
begin
  io.ReloadObject(AIntfObj as TObject, ALazy, '');
end;

class procedure io.ReloadObject(const AIntfObj: IInterface; const ALazyProps: String);
begin
  io.ReloadObject(AIntfObj as TObject, False, ALazyProps);
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
      io.ReloadObject(LDuckList.GetItem(I), ALazy, ALazyProps);
    io.CommitTransaction;
  except
    io.RollbackTransaction;
    raise;
  end;
end;

class procedure io.ReloadObject(const AObj: TObject; const ALazy: boolean; const ALazyProps: String);
begin
  if not Assigned(AObj) then
    raise EioGenericException.Create(ClassName, 'Reload', '"AObj" cannot be nil.');
  io.Load(AObj.ClassName).ByID(TioUtilities.ObjToID(AObj)).Lazy(ALazy).LazyProps(ALazyProps).ClearListBefore.ToObject(AObj);
end;

class procedure io.ReloadObject(const AObj: TObject; const ALazy: boolean);
begin
  io.ReloadObject(AObj, ALazy, '');
end;

class procedure io.ReloadObject(const AObj: TObject; const ALazyProps: String);
begin
  io.ReloadObject(AObj, False, ALazyProps);
end;

class procedure io.RollbackTransaction(const AConnectionName: String);
begin
  TioPersistenceStrategyFactory.GetStrategy(AConnectionName).RollbackTransaction(AConnectionName);
end;

class function io.SQL(const ASQL: String): IioSQLDestination;
begin
  Result := TioDBFactory.SQLDestination(ASQL);
end;

class procedure io.SetWaitProc(const AShowWaitProc: TProc; const AHideWaitProc: TProc);
begin
  TioConnectionManager.SetShowHideWaitProc(AShowWaitProc, AHideWaitProc);
end;

class procedure io.Show(const ATargetObj: TObject; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent;
  const AVVMAlias: String);
begin
  if di.LocateSimpleViewFor(ATargetObj, AParentCloseQueryAction, AVVMAlias).Exist then
    di.LocateSimpleViewFor(ATargetObj, AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).Show
  else
    di.LocateViewVMfor(ATargetObj, AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).Show;
end;

class procedure io.Show(const ATargetObj: TObject; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider;
  const AVVMAlias: String);
begin
  if di.LocateSimpleViewFor(ATargetObj, AParentCloseQueryAction, AVVMAlias).Exist then
    di.LocateSimpleViewFor(ATargetObj, AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).Show
  else
    di.LocateViewVMfor(ATargetObj, AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).Show;
end;

class procedure io.Show(const ATargetObj: TObject; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String);
begin
  if di.LocateSimpleViewFor(ATargetObj, AParentCloseQueryAction, AVVMAlias).Exist then
    di.LocateSimpleViewFor(ATargetObj, AParentCloseQueryAction, AVVMAlias).Show
  else
    di.LocateViewVMfor(ATargetObj, AParentCloseQueryAction, AVVMAlias).Show;
end;

class procedure io.Show(const ATargetIntf: IInterface; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent;
  const AVVMAlias: String);
begin
  if di.LocateSimpleViewFor(ATargetIntf, AParentCloseQueryAction, AVVMAlias).Exist then
    di.LocateSimpleViewFor(ATargetIntf, AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).Show
  else
    di.LocateViewVMfor(ATargetIntf, AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).Show;
end;

class procedure io.Show<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String);
begin
  if di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).Exist then
    di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).Show
  else
    di.LocateViewVMfor<T>(AParentCloseQueryAction, AVVMAlias).Show;
end;

class procedure io.Show<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  if di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).Exist then
    di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).Show
  else
    di.LocateViewVMfor<T>(AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).Show;
end;

class procedure io.Show<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String);
begin
  if di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).Exist then
    di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).Show
  else
    di.LocateViewVMfor<T>(AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).Show;
end;

class procedure io.Show(const ATargetIntf: IInterface; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider;
  const AVVMAlias: String);
begin
  if di.LocateSimpleViewFor(ATargetIntf, AParentCloseQueryAction, AVVMAlias).Exist then
    di.LocateSimpleViewFor(ATargetIntf, AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).Show
  else
    di.LocateViewVMfor(ATargetIntf, AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).Show;
end;

class procedure io.Show(const ATargetIntf: IInterface; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String);
begin
  if di.LocateSimpleViewFor(ATargetIntf, AParentCloseQueryAction, AVVMAlias).Exist then
    di.LocateSimpleViewFor(ATargetIntf, AParentCloseQueryAction, AVVMAlias).Show
  else
    di.LocateViewVMfor(ATargetIntf, AParentCloseQueryAction, AVVMAlias).Show;
end;

class procedure io.ShowCurrent(const ABindSource: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent;
  const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ABindSource, True, False) then
    TioDependencyInjectionFactory.GetViewVMLocatorFor(ABindSource, AParentCloseQueryAction, AVVMAlias, False).SetViewContext(AViewContext).ShowCurrent;
end;

class procedure io.ShowCurrent(const ABindSource: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ABindSource, True, False) then
    TioDependencyInjectionFactory.GetViewVMLocatorFor(ABindSource, AParentCloseQueryAction, AVVMAlias, False).ShowCurrent;
end;

class procedure io.ShowCurrent(const ABindSource: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction;
  const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ABindSource, True, False) then
    TioDependencyInjectionFactory.GetViewVMLocatorFor(ABindSource, AParentCloseQueryAction, AVVMAlias, False).VCProvider(AVCProvider).ShowCurrent;
end;

class procedure io.ShowEach(const ABindSource: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent;
  const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ABindSource, True, False) then
    TioDependencyInjectionFactory.GetViewVMLocatorFor(ABindSource, AParentCloseQueryAction, AVVMAlias, False).SetViewContext(AViewContext).ShowEach;
end;

class procedure io.ShowEach(const ABindSource: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ABindSource, True, False) then
    TioDependencyInjectionFactory.GetViewVMLocatorFor(ABindSource, AParentCloseQueryAction, AVVMAlias, False).ShowEach;
end;

class procedure io.ShowMessage(const AMessage: String);
begin
  TioApplication.ShowMessage(AMessage);
end;

class procedure io.ShowAsSelector<T>(const ASelectionTargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS, False, False) then
    if di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).SetBindSourceAsSelectorFor(ASelectionTargetBS).Show
    else
      di.LocateViewVMfor<T>(AParentCloseQueryAction, AVVMAlias).SetBindSourceAsSelectorFor(ASelectionTargetBS).Show;
end;

class procedure io.ShowAsSelector<T>(const ASelectionTargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction;
  const AViewContext: TComponent; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS, False, False) then
    if di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).SetBindSourceAsSelectorFor(ASelectionTargetBS).Show
    else
      di.LocateViewVMfor<T>(AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).SetBindSourceAsSelectorFor(ASelectionTargetBS).Show;
end;

class procedure io.ShowAsWhereBuilder(const AEntityTypeName: String; const ASelectionTargetBS: IioMasterBindSource;
  const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS as IioBindSource, False, False) then
    if di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext)
        .SetBindSourceAsWhereBuilderFor(ASelectionTargetBS).Show
    else
      di.LocateViewVMfor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext)
        .SetBindSourceAsWhereBuilderFor(ASelectionTargetBS).Show;
end;

class procedure io.ShowAsWhereBuilder<T>(const AWhere: IioWhere; const ASelectionTargetBS: IioMasterBindSource;
  const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS as IioBindSource, False, False) then
    if di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).SetBindSourceAsWhereBuilderFor(ASelectionTargetBS).SetBindSource(AWhere).Show
    else
      di.LocateViewVMfor<T>(AParentCloseQueryAction, AVVMAlias).SetBindSourceAsWhereBuilderFor(ASelectionTargetBS).SetBindSource(AWhere).Show;
end;

class procedure io.ShowAsWhereBuilder<T>(const AWhere: IioWhere; const ASelectionTargetBS: IioMasterBindSource;
  const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS as IioBindSource, False, False) then
    if di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).SetBindSourceAsWhereBuilderFor(ASelectionTargetBS).SetBindSource(AWhere).Show
    else
      di.LocateViewVMfor<T>(AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).SetBindSourceAsWhereBuilderFor(ASelectionTargetBS).SetBindSource(AWhere).Show;
end;

class procedure io.ShowAsWhereBuilder(const AEntityTypeName: String; const AWhere: IioWhere; const ASelectionTargetBS: IioMasterBindSource;
  const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS as IioBindSource, False, False) then
    if di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetBindSourceAsWhereBuilderFor(ASelectionTargetBS).SetBindSource(AWhere).Show
    else
      di.LocateViewVMfor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetBindSourceAsWhereBuilderFor(ASelectionTargetBS).SetBindSource(AWhere).Show;
end;

class procedure io.ShowAsWhereBuilder(const AEntityTypeName: String; const AWhere: IioWhere; const ASelectionTargetBS: IioMasterBindSource;
  const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS as IioBindSource, False, False) then
    if di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider)
        .SetBindSourceAsWhereBuilderFor(ASelectionTargetBS).SetBindSource(AWhere).Show
    else
      di.LocateViewVMfor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).SetBindSourceAsWhereBuilderFor(ASelectionTargetBS).SetBindSource(AWhere).Show;
end;

class procedure io.ShowAsWhereBuilder(const AEntityTypeName: String; const AWhere: IioWhere; const ASelectionTargetBS: IioMasterBindSource;
  const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS as IioBindSource, False, False) then
    if di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext)
        .SetBindSourceAsWhereBuilderFor(ASelectionTargetBS).SetBindSource(AWhere).Show
    else
      di.LocateViewVMfor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext)
        .SetBindSourceAsWhereBuilderFor(ASelectionTargetBS).SetBindSource(AWhere).Show;
end;

class procedure io.ShowAsWhereBuilder<T>(const AWhere: IioWhere; const ASelectionTargetBS: IioMasterBindSource;
  const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS as IioBindSource, False, False) then
    if di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).SetBindSourceAsWhereBuilderFor(ASelectionTargetBS).SetBindSource(AWhere).Show
    else
      di.LocateViewVMfor<T>(AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).SetBindSourceAsWhereBuilderFor(ASelectionTargetBS).SetBindSource(AWhere).Show;
end;

class procedure io.ShowAsWhereBuilder(const AEntityTypeName: String; const ASelectionTargetBS: IioMasterBindSource;
  const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS as IioBindSource, False, False) then
    if di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider)
        .SetBindSourceAsWhereBuilderFor(ASelectionTargetBS).Show
    else
      di.LocateViewVMfor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).SetBindSourceAsWhereBuilderFor(ASelectionTargetBS).Show;
end;

class procedure io.ShowAsWhereBuilder(const AEntityTypeName: String; const ASelectionTargetBS: IioMasterBindSource;
  const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS as IioBindSource, False, False) then
    if di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetBindSourceAsWhereBuilderFor(ASelectionTargetBS).Show
    else
      di.LocateViewVMfor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetBindSourceAsWhereBuilderFor(ASelectionTargetBS).Show;
end;

class procedure io.ShowAsWhereBuilder<T>(const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction;
  const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS as IioBindSource, False, False) then
    if di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).SetBindSourceAsWhereBuilderFor(ASelectionTargetBS).Show
    else
      di.LocateViewVMfor<T>(AParentCloseQueryAction, AVVMAlias).SetBindSourceAsWhereBuilderFor(ASelectionTargetBS).Show;
end;

class procedure io.ShowAsWhereBuilder<T>(const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction;
  const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS as IioBindSource, False, False) then
    if di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).SetBindSourceAsWhereBuilderFor(ASelectionTargetBS).Show
    else
      di.LocateViewVMfor<T>(AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).SetBindSourceAsWhereBuilderFor(ASelectionTargetBS).Show;
end;

class procedure io.ShowAsWhereBuilder<T>(const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction;
  const AViewContext: TComponent; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS as IioBindSource, False, False) then
    if di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).SetBindSourceAsWhereBuilderFor(ASelectionTargetBS).Show
    else
      di.LocateViewVMfor<T>(AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).SetBindSourceAsWhereBuilderFor(ASelectionTargetBS).Show;
end;

class procedure io.ShowAsSelector<T>(const ASelectionTargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction;
  const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS, False, False) then
    if di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).SetBindSourceAsSelectorFor(ASelectionTargetBS).Show
    else
      di.LocateViewVMfor<T>(AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).SetBindSourceAsSelectorFor(ASelectionTargetBS).Show;
end;

class procedure io.ShowEach(const ABindSource: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider;
  const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ABindSource, True, False) then
    TioDependencyInjectionFactory.GetViewVMLocatorFor(ABindSource, AParentCloseQueryAction, AVVMAlias, False).VCProvider(AVCProvider).ShowEach;
end;

class procedure io.ShowWait;
begin
  TioConnectionManager.ShowWaitProc;
end;

class function io.SmartWhereBuilder: TioWhereSmartBuilderRef;
begin
  Result := TioWhereFactory.NewWhereSmartBuilder;
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
  TioPersistenceStrategyFactory.GetStrategy(AConnectionName).StartTransaction(AConnectionName);
end;

class function io.StrategyInterceptors: TioStrategyInterceptorRegisterRef;
begin
  Result := TioStrategyInterceptorRegister;
end;

class function io.CRUDInterceptors: TioCRUDInterceptorRegisterRef;
begin
  Result := TioCRUDInterceptorRegister;
end;

class procedure io.AnonymousTimer(const AIntervalMillisec: Integer; const AExecuteMethod: TFunc<boolean>);
begin
  TioAnonymousTimer.Create(AIntervalMillisec, AExecuteMethod);
end;

class procedure io.CommitTransaction(const AConnectionName: String);
begin
  TioPersistenceStrategyFactory.GetStrategy(AConnectionName).CommitTransaction(AConnectionName);
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

class function io.Create(const ATypeName, ATypeAlias: String; const AParams: TioConstructorParams): TObject;
begin
  Result := di.Locate(ATypeName, ATypeAlias).ConstructorParams(AParams).Get;
end;

class function io.Create<T>(const ATypeAlias: String; const AParams: TioConstructorParams): T;
begin
  Result := di.Locate<T>(ATypeAlias).ConstructorParams(AParams).Get;
end;

class function io.CreateSimpleView(const ASVTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent;
  const ASVAlias: String; const AParams: TioConstructorParams): TComponent;
begin
  Result := di.LocateSimpleView(ASVTypeName, AParentCloseQueryAction, ASVAlias).SetViewContext(AViewContext).ConstructorParams(AParams)
    .GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateSimpleView(const ASVTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewModel: IioViewModel;
  const ASVAlias: String; const AParams: TioConstructorParams): TComponent;
begin
  Result := di.LocateSimpleView(ASVTypeName, AParentCloseQueryAction, ASVAlias).SetViewModel(AViewModel).ConstructorParams(AParams)
    .GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateSimpleView(const ASVTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider;
  const AViewModel: IioViewModel; const ASVAlias: String; const AParams: TioConstructorParams): TComponent;
begin
  Result := di.LocateSimpleView(ASVTypeName, AParentCloseQueryAction, ASVAlias).VCProvider(AVCProvider).SetViewModel(AViewModel).ConstructorParams(AParams)
    .GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateSimpleView(const ASVTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent;
  const AViewModel: IioViewModel; const ASVAlias: String; const AParams: TioConstructorParams): TComponent;
begin
  Result := di.LocateSimpleView(ASVTypeName, AParentCloseQueryAction, ASVAlias).SetViewContext(AViewContext).SetViewModel(AViewModel).ConstructorParams(AParams)
    .GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateSimpleView<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const ASVAlias: String;
  const AParams: TioConstructorParams): T;
begin
  Result := di.LocateSimpleView<T>(AParentCloseQueryAction, ASVAlias).SetViewContext(AViewContext).ConstructorParams(AParams).Get;
end;

class function io.CreateSimpleView<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const ASVAlias: String;
  const AParams: TioConstructorParams): T;
begin
  Result := di.LocateSimpleView<T>(AParentCloseQueryAction, ASVAlias).VCProvider(AVCProvider).ConstructorParams(AParams).Get;
end;

class function io.CreateSimpleView<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String; const AParams: TioConstructorParams): T;
begin
  Result := di.LocateSimpleView<T>(AParentCloseQueryAction, ASVAlias).ConstructorParams(AParams).Get;
end;

class function io.CreateSimpleView<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AViewModel: IioViewModel;
  const ASVAlias: String; const AParams: TioConstructorParams): T;
begin
  Result := di.LocateSimpleView<T>(AParentCloseQueryAction, ASVAlias).SetViewContext(AViewContext).SetViewModel(AViewModel).ConstructorParams(AParams).Get;
end;

class function io.CreateSimpleViewFor<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const ASVAlias: String;
  const AParams: TioConstructorParams): TComponent;
begin
  Result := io.di.LocateSimpleViewFor<T>(AParentCloseQueryAction, ASVAlias).ConstructorParams(AParams).SetViewContext(AViewContext)
    .GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateSimpleViewFor<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider;
  const ASVAlias: String; const AParams: TioConstructorParams): TComponent;
begin
  Result := io.di.LocateSimpleViewFor<T>(AParentCloseQueryAction, ASVAlias).ConstructorParams(AParams).VCProvider(AVCProvider).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateSimpleViewFor<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String; const AParams: TioConstructorParams)
  : TComponent;
begin
  Result := io.di.LocateSimpleViewFor<T>(AParentCloseQueryAction, ASVAlias).ConstructorParams(AParams).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateSimpleViewFor<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AViewModel: IioViewModel;
  const ASVAlias: String; const AParams: TioConstructorParams): TComponent;
begin
  Result := io.di.LocateSimpleViewFor<T>(AParentCloseQueryAction, ASVAlias).ConstructorParams(AParams).SetViewContext(AViewContext).SetViewModel(AViewModel)
    .GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateSimpleViewFor<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider;
  const AViewModel: IioViewModel; const ASVAlias: String; const AParams: TioConstructorParams): TComponent;
begin
  Result := io.di.LocateSimpleViewFor<T>(AParentCloseQueryAction, ASVAlias).ConstructorParams(AParams).VCProvider(AVCProvider).SetViewModel(AViewModel)
    .GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateSimpleViewFor<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewModel: IioViewModel; const ASVAlias: String;
  const AParams: TioConstructorParams): TComponent;
begin
  Result := io.di.LocateSimpleViewFor<T>(AParentCloseQueryAction, ASVAlias).ConstructorParams(AParams).SetViewModel(AViewModel).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateSimpleView<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider;
  const AViewModel: IioViewModel; const ASVAlias: String; const AParams: TioConstructorParams): T;
begin
  Result := di.LocateSimpleView<T>(AParentCloseQueryAction, ASVAlias).VCProvider(AVCProvider).SetViewModel(AViewModel).ConstructorParams(AParams).Get;
end;

class function io.CreateSimpleView<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewModel: IioViewModel; const ASVAlias: String;
  const AParams: TioConstructorParams): T;
begin
  Result := di.LocateSimpleView<T>(AParentCloseQueryAction, ASVAlias).SetViewModel(AViewModel).ConstructorParams(AParams).Get;
end;

class function io.CreateSimpleView(const ASVTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider;
  const ASVAlias: String; const AParams: TioConstructorParams): TComponent;
begin
  Result := di.LocateSimpleView(ASVTypeName, AParentCloseQueryAction, ASVAlias).VCProvider(AVCProvider).ConstructorParams(AParams)
    .GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateSimpleView(const ASVTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const ASVAlias: String;
  const AParams: TioConstructorParams): TComponent;
begin
  Result := di.LocateSimpleView(ASVTypeName, AParentCloseQueryAction, ASVAlias).ConstructorParams(AParams).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateView<T>(const AViewContext: TComponent; const AVAlias: String; const AParams: TioConstructorParams): T;
begin
  Result := di.LocateView<T>(AVAlias).SetViewContext(AViewContext).ConstructorParams(AParams).Get;
end;

class function io.CreateView<T>(const AVCProvider: TioViewContextProvider; const AVAlias: String; const AParams: TioConstructorParams): T;
begin
  Result := di.LocateView<T>(AVAlias).VCProvider(AVCProvider).ConstructorParams(AParams).Get;
end;

class function io.CreateView<T>(const AVAlias: String; const AParams: TioConstructorParams): T;
begin
  Result := di.LocateView<T>(AVAlias).ConstructorParams(AParams).Get;
end;

class function io.CreateView(const AViewTypeName, AVAlias: String; const AParams: TioConstructorParams): TComponent;
begin
  Result := di.LocateView(AViewTypeName, AVAlias).ConstructorParams(AParams).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateView(const AViewTypeName: String; const AVCProvider: TioViewContextProvider; const AVAlias: String; const AParams: TioConstructorParams)
  : TComponent;
begin
  Result := di.LocateView(AViewTypeName, AVAlias).VCProvider(AVCProvider).ConstructorParams(AParams).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateView(const AViewTypeName: String; const AViewContext: TComponent; const AVAlias: String; const AParams: TioConstructorParams)
  : TComponent;
begin
  Result := di.LocateView(AViewTypeName, AVAlias).SetViewContext(AViewContext).ConstructorParams(AParams).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateView(const AViewTypeName: String; const AViewModel: IioViewModel; const AVAlias: String; const AParams: TioConstructorParams)
  : TComponent;
begin
  Result := di.LocateView(AViewTypeName, AVAlias).SetViewModel(AViewModel).ConstructorParams(AParams).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateView(const AViewTypeName: String; const AVCProvider: TioViewContextProvider; const AViewModel: IioViewModel; const AVAlias: String;
  const AParams: TioConstructorParams): TComponent;
begin
  Result := di.LocateView(AViewTypeName, AVAlias).VCProvider(AVCProvider).SetViewModel(AViewModel).ConstructorParams(AParams).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateView(const AViewTypeName: String; const AViewContext: TComponent; const AViewModel: IioViewModel; const AVAlias: String;
  const AParams: TioConstructorParams): TComponent;
begin
  Result := di.LocateView(AViewTypeName, AVAlias).SetViewContext(AViewContext).SetViewModel(AViewModel).ConstructorParams(AParams)
    .GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateView<T>(const AViewContext: TComponent; const AViewModel: IioViewModel; const AVAlias: String; const AParams: TioConstructorParams): T;
begin
  Result := di.LocateView<T>(AVAlias).SetViewContext(AViewContext).SetViewModel(AViewModel).ConstructorParams(AParams).Get;
end;

class function io.CreateViewFor<T>(const AVCProvider: TioViewContextProvider; const AVAlias: String; const AParams: TioConstructorParams): TComponent;
begin
  Result := io.di.LocateViewFor<T>(AVAlias).ConstructorParams(AParams).VCProvider(AVCProvider).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateViewFor<T>(const AViewContext: TComponent; const AVAlias: String; const AParams: TioConstructorParams): TComponent;
begin
  Result := io.di.LocateViewFor<T>(AVAlias).ConstructorParams(AParams).SetViewContext(AViewContext).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateViewFor<T>(const AVAlias: String; const AParams: TioConstructorParams): TComponent;
begin
  Result := io.di.LocateViewFor<T>(AVAlias).ConstructorParams(AParams).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateViewFor<T>(const AVCProvider: TioViewContextProvider; const AViewModel: IioViewModel; const AVAlias: String;
  const AParams: TioConstructorParams): TComponent;
begin
  Result := io.di.LocateViewFor<T>(AVAlias).ConstructorParams(AParams).VCProvider(AVCProvider).SetViewModel(AViewModel).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateViewFor<T>(const AViewContext: TComponent; const AViewModel: IioViewModel; const AVAlias: String; const AParams: TioConstructorParams)
  : TComponent;
begin
  Result := io.di.LocateViewFor<T>(AVAlias).ConstructorParams(AParams).SetViewContext(AViewContext).SetViewModel(AViewModel).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateViewFor<T>(const AViewModel: IioViewModel; const AVAlias: String; const AParams: TioConstructorParams): TComponent;
begin
  Result := io.di.LocateViewFor<T>(AVAlias).ConstructorParams(AParams).SetViewModel(AViewModel).GetAsGeneric.OfType<TComponent>;
end;

class function io.CreateView<T>(const AVCProvider: TioViewContextProvider; const AViewModel: IioViewModel; const AVAlias: String;
  const AParams: TioConstructorParams): T;
begin
  Result := di.LocateView<T>(AVAlias).VCProvider(AVCProvider).SetViewModel(AViewModel).ConstructorParams(AParams).Get;
end;

class function io.CreateView<T>(const AViewModel: IioViewModel; const AVAlias: String; const AParams: TioConstructorParams): T;
begin
  Result := di.LocateView<T>(AVAlias).SetViewModel(AViewModel).ConstructorParams(AParams).Get;
end;

class procedure io.CreateViewVM<TView, TViewModel>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider;
  const AVVMAlias: String);
begin
  di.LocateViewVM<TView, TViewModel>(AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).Show;
end;

class procedure io.CreateViewVM(const AViewTypeName, AVMTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String);
begin
  di.LocateViewVM(AViewTypeName, AVMTypeName, AParentCloseQueryAction, AVVMAlias).Show;
end;

class procedure io.CreateViewVM(const AViewTypeName, AVMTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent;
  const AVVMAlias: String);
begin
  di.LocateViewVM(AViewTypeName, AVMTypeName, AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).Show;
end;

class procedure io.CreateViewVM(const AViewTypeName, AVMTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction;
  const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  di.LocateViewVM(AViewTypeName, AVMTypeName, AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).Show;
end;

class procedure io.CreateViewVM<TView, TViewModel>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent;
  const AVVMAlias: String);
begin
  di.LocateViewVM<TView, TViewModel>(AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).Show;
end;

class procedure io.CreateViewVM<TView, TViewModel>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String);
begin
  di.LocateViewVM<TView, TViewModel>(AParentCloseQueryAction, AVVMAlias).Show;
end;

class function io.CreateVMFor<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String; const AParams: TioConstructorParams)
  : IioViewModel;
begin
  Result := io.di.LocateVMfor<T>(AParentCloseQueryAction, AVMAlias).ConstructorParams(AParams).GetAsGeneric.OfType<IioViewModel>;
end;

class function io.CreateVM(const AVMTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String;
  const AParams: TioConstructorParams): IioViewModel;
begin
  Result := di.LocateVM(AVMTypeName, AParentCloseQueryAction, AVMAlias).ConstructorParams(AParams).GetAsGeneric.OfType<IioViewModel>;
end;

class function io.CreateVM<T>(const AParentCloseQueryAction: IioBSCloseQueryAction; const AVMAlias: String; const AParams: TioConstructorParams): T;
begin
  Result := di.LocateVM<T>(AParentCloseQueryAction, AVMAlias).ConstructorParams(AParams).Get;
end;

class procedure io.DeleteObject(const [ref] AObj: TObject; const ABlindLevel: Byte; const AFree: TioFreeObjAfterPersistOrDelete);
begin
  _DeleteObjectInternal(AObj, itRegular, ABlindLevel);
  _FreeObjAfterPersistOrDelete(AObj, AFree);
end;

class function io.DBBuilder(const AConnectionDefName: String; const AAddIndexes, AAddForeignKeys: boolean): IioDBBuilderEngine;
begin
  Result := GlobalFactory.DBBuilderFactory.NewEngine(AConnectionDefName, AAddIndexes, AAddForeignKeys);
end;

class function io.DBBuilder(const AAddIndexes, AAddForeignKeys: boolean): IioDBBuilderEngine;
begin
  Result := GlobalFactory.DBBuilderFactory.NewEngine(AAddIndexes, AAddForeignKeys);
end;

class function io.DefaultVCProvider: TioViewContextProvider;
begin
  Result := TioGlobalVCProviderRegister.GetInstance.DefaultVCProvider;
end;

class procedure io.DeleteObject(const AIntfObj: IInterface; const ABlindLevel: Byte);
begin
  _DeleteObjectInternal(AIntfObj as TObject, itRegular, ABlindLevel);
end;

class procedure io.Delete<T>(const AID: Integer);
begin
  Self.Delete<T>(String.Empty, AID);
end;

class procedure io.Delete<T>(const ATypeAlias: String; const AID: Integer);
var
  LTypeName: String;
  LObj: TObject;
  LIntf: IInterface;
begin
  LTypeName := TioUtilities.GenericToString<T>(False);
  if TioUtilities.IsAnInterfaceTypeName(LTypeName) then
  begin
    Supports(Self.Load(LTypeName, ATypeAlias).ByID(AID).ToObject, IInterface, LIntf);
    Self.DeleteObject(LIntf);
  end
  else
  begin
    LObj := Self.Load(LTypeName, ATypeAlias).ByID(AID).ToObject;
    try
      Self.DeleteObject(LObj);
    finally
      LObj.Free;
    end;
  end;
end;

class procedure io.DeleteList(const AListIntf: IInterface; const ABlindLevel: Byte);
begin
  _DeleteListInternal(AListIntf as TObject, itRegular, ABlindLevel)
end;

class procedure io.DeleteList(const [ref] AListObj: TObject; const AFree: TioFreeObjAfterPersistOrDelete);
begin
  DeleteList(AListObj, BL_DEFAULT, AFree);
end;

class procedure io.DeleteObject(const [ref] AObj: TObject; const AFree: TioFreeObjAfterPersistOrDelete);
begin
  DeleteObject(AObj, BL_DEFAULT, AFree);
end;

class procedure io.DeleteList(const [ref] AListObj: TObject; const ABlindLevel: Byte; const AFree: TioFreeObjAfterPersistOrDelete);
begin
  _DeleteListInternal(AListObj, itRegular, ABlindLevel);
  _FreeObjAfterPersistOrDelete(AListObj, AFree);
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

class function io.Enums: TioEnumContainerExRef;
begin
  Result := TioEnumContainerEx;
end;

class function io.ETM: TIoEtmEngineRef;
begin
  Result := TioEtmEngine;
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
  Result := TioUtilities.IntfToID(AIntfObj);
end;

class function io.ExtractOID(const AObj: TObject): Integer;
begin
  Result := TioUtilities.ObjToID(AObj);
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
  Result := TioPersistenceStrategyFactory.GetStrategy(AConnectionName).InTransaction(AConnectionName);
end;

class procedure io.KeepClass(const AClass: TClass);
begin
  // This method does nothing, it only serves to ensure that the linker
  //  does not remove the class whose pointer is received and therefore
  //  that the RTTI information is generated even for classes for which
  //  there is no reference in the code.
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

class procedure io._DeleteListInternal(const AListObj: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte);
var
  LConnectionDefName: String;
begin
  LConnectionDefName := TioConnectionManager.GetCurrentConnectionName;
  TioPersistenceStrategyFactory.GetStrategy(LConnectionDefName).DeleteList(AListObj, AIntent, ABlindLevel);
end;

class procedure io._DeleteObjectInternal(const AObj: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte);
var
  LConnectionDefName: String;
begin
  LConnectionDefName := TioMapContainer.GetConnectionDefName(AObj.ClassName);
  TioPersistenceStrategyFactory.GetStrategy(LConnectionDefName).DeleteObject(AObj, AIntent, ABlindLevel);
end;

class procedure io._FreeObjAfterPersistOrDelete(const [ref] AObj: TObject; const AFree: TioFreeObjAfterPersistOrDelete);
begin
  case AFree of
    foFree:
      AObj.Free;
    foFreeAndNil:
      FreeAndNil(AObj);
  end;
end;

class procedure io._PersistList(const AList: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte);
begin
  _PersistListInternal(AList, AIntent, '', 0, nil, '', '', ABlindLevel);
end;

class procedure io._PersistListInternal(const AList: TObject; const AIntent: TioPersistenceIntentType; const ARelationPropertyName: String;
      const ARelationOID: Integer; const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String;
      const ABlindLevel: Byte);
var
  LConnectionDefName: String;
begin
  LConnectionDefName := TioConnectionManager.GetCurrentConnectionName;
  TioPersistenceStrategyFactory.GetStrategy(LConnectionDefName).PersistList(AList, AIntent, ARelationPropertyName, ARelationOID, AMasterBSPersistence, AMasterPropertyName,
    AMasterPropertyPath, ABlindLevel);
end;

class function io.TerminateApplication: boolean;
begin
  Result := TioApplication.Terminate;
end;

class function io.VCProviderByName(const AVCProviderName: String): TioViewContextProvider;
begin
  Result := TioGlobalVCProviderRegister.GetInstance.VCProviderByName(AVCProviderName);
end;

class function io.Version: String;
begin
  Result := IORM_VERSION;
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

class function io.Max(const ATypeName, APropertyName, ATypeAlias: String): Integer;
begin
  Result := Self.RefTo(ATypeName, ATypeAlias).Max(APropertyName);
end;

class function io.Max(const ATypeName, APropertyName: String; const AWhere: IioWhere): Integer;
begin
  Result := Self.Max(ATypeName, APropertyName, '', AWhere);
end;

class function io.Max(const ATypeName, APropertyName, ATypeAlias: String; const AWhere: IioWhere): Integer;
begin
  AWhere.TypeName := ATypeName;
  AWhere.TypeAlias := ATypeAlias;
  Result := AWhere.Max(APropertyName);
end;

class function io.Max<T>(const APropertyName, ATypeAlias: String): Integer;
begin
  Result := Self.RefTo<T>(ATypeAlias).Max(APropertyName);
end;

class function io.Max<T>(const APropertyName: String; const AWhere: IioWhere): Integer;
begin
  Result := Self.Max<T>(APropertyName, '', AWhere);
end;

class function io.Max<T>(const APropertyName, ATypeAlias: String; const AWhere: IioWhere): Integer;
begin
  AWhere.TypeName := TioUtilities.GenericToString<T>(False);
  AWhere.TypeAlias := ATypeAlias;
  Result := AWhere.Max(APropertyName);
end;

class function io.Min(const ATypeName, APropertyName, ATypeAlias: String): Integer;
begin
  Result := Self.RefTo(ATypeName, ATypeAlias).Min(APropertyName);
end;

class function io.Min(const ATypeName, APropertyName: String; const AWhere: IioWhere): Integer;
begin
  Result := Self.Min(ATypeName, APropertyName, '', AWhere);
end;

class function io.Min(const ATypeName, APropertyName, ATypeAlias: String; const AWhere: IioWhere): Integer;
begin
  AWhere.TypeName := ATypeName;
  AWhere.TypeAlias := ATypeAlias;
  Result := AWhere.Min(APropertyName);
end;

class function io.Min<T>(const APropertyName, ATypeAlias: String): Integer;
begin
  Result := Self.RefTo<T>(ATypeAlias).Min(APropertyName);
end;

class function io.Min<T>(const APropertyName: String; const AWhere: IioWhere): Integer;
begin
  Result := Self.Min<T>(APropertyName, '', AWhere);
end;

class function io.Min<T>(const APropertyName, ATypeAlias: String; const AWhere: IioWhere): Integer;
begin
  AWhere.TypeName := TioUtilities.GenericToString<T>(False);
  AWhere.TypeAlias := ATypeAlias;
  Result := AWhere.Min(APropertyName);
end;

class procedure io.Show(const AEntityTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String);
begin
  if di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Exist then
    di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Show
  else
    di.LocateViewVMfor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Show;
end;

class procedure io.Show(const AEntityTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent;
  const AVVMAlias: String);
begin
  if di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Exist then
    di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).Show
  else
    di.LocateViewVMfor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).Show;
end;

class procedure io.Show(const AEntityTypeName: String; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider;
  const AVVMAlias: String);
begin
  if di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Exist then
    di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).Show
  else
    di.LocateViewVMfor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).Show;
end;

class procedure io.ShowAsSelector(const AEntityTypeName: String; const ASelectionTargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction;
  const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS, False, False) then
    if di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetBindSourceAsSelectorFor(ASelectionTargetBS).Show
    else
      di.LocateViewVMfor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetBindSourceAsSelectorFor(ASelectionTargetBS).Show;
end;

class procedure io.ShowAsSelector(const AEntityTypeName: String; const ASelectionTargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction;
  const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS, False, False) then
    if di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).SetBindSourceAsSelectorFor(ASelectionTargetBS).Show
    else
      di.LocateViewVMfor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).SetBindSourceAsSelectorFor(ASelectionTargetBS).Show;
end;

class procedure io.ShowAsETM(const AEntityTypeName: String; const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction;
  const AViewContext: TComponent; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS as IioBindSource, False, False) then
    if di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).SetBindSourceAsETMfor(ASelectionTargetBS).Show
    else
      di.LocateViewVMfor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).SetBindSourceAsETMfor(ASelectionTargetBS).Show;
end;

class procedure io.ShowAsETM(const AEntityTypeName: String; const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction;
  const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS as IioBindSource, False, False) then
    if di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).SetBindSourceAsETMfor(ASelectionTargetBS).Show
    else
      di.LocateViewVMfor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).SetBindSourceAsETMfor(ASelectionTargetBS).Show;
end;

class procedure io.ShowAsETM(const AEntityTypeName: String; const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction;
  const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS as IioBindSource, False, False) then
    if di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetBindSourceAsETMfor(ASelectionTargetBS).Show
    else
      di.LocateViewVMfor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetBindSourceAsETMfor(ASelectionTargetBS).Show;
end;

class procedure io.ShowAsETM<T>(const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS as IioBindSource, False, False) then
    if di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).SetBindSourceAsETMfor(ASelectionTargetBS).Show
    else
      di.LocateViewVMfor<T>(AParentCloseQueryAction, AVVMAlias).SetBindSourceAsETMfor(ASelectionTargetBS).Show;
end;

class procedure io.ShowAsETM<T>(const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction;
  const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS as IioBindSource, False, False) then
    if di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).SetBindSourceAsETMfor(ASelectionTargetBS).Show
    else
      di.LocateViewVMfor<T>(AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).SetBindSourceAsETMfor(ASelectionTargetBS).Show;
end;

class procedure io.ShowAsETM<T>(const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction;
  const AViewContext: TComponent; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS as IioBindSource, False, False) then
    if di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).SetBindSourceAsETMfor(ASelectionTargetBS).Show
    else
      di.LocateViewVMfor<T>(AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).SetBindSourceAsETMfor(ASelectionTargetBS).Show;
end;

class procedure io.ShowAsSelector(const AEntityTypeName: String; const ASelectionTargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction;
  const AViewContext: TComponent; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS, False, False) then
    if di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext)
        .SetBindSourceAsSelectorFor(ASelectionTargetBS).Show
    else
      di.LocateViewVMfor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).SetBindSourceAsSelectorFor(ASelectionTargetBS).Show;
end;

class procedure io.ShowAsSelector(const AEntityTypeName: String; const AWhere: IioWhere; const ASelectionTargetBS: IioBindSource;
  const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS, False, False) then
    if di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetBindSourceAsSelectorFor(ASelectionTargetBS).SetBindSource(AWhere).Show
    else
      di.LocateViewVMfor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetBindSourceAsSelectorFor(ASelectionTargetBS).SetBindSource(AWhere).Show;
end;

class procedure io.ShowAsSelector(const AEntityTypeName: String; const AWhere: IioWhere; const ASelectionTargetBS: IioBindSource;
  const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS, False, False) then
    if di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).SetBindSourceAsSelectorFor(ASelectionTargetBS).SetBindSource(AWhere).Show
    else
      di.LocateViewVMfor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).SetBindSourceAsSelectorFor(ASelectionTargetBS).SetBindSource(AWhere).Show;
end;

class procedure io.ShowAsSelector(const AEntityTypeName: String; const AWhere: IioWhere; const ASelectionTargetBS: IioBindSource;
  const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS, False, False) then
    if di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext)
        .SetBindSourceAsSelectorFor(ASelectionTargetBS).SetBindSource(AWhere).Show
    else
      di.LocateViewVMfor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).SetBindSourceAsSelectorFor(ASelectionTargetBS).SetBindSource(AWhere).Show;
end;

class procedure io.DeleteAll<T>(const ATypeAlias: String);
begin
  Self.DeleteAll<T>(ATypeAlias, nil);
end;

class procedure io.DeleteAll<T>(const AWhere: IioWhere);
begin
  Self.DeleteAll<T>(string.Empty, AWhere);
end;

class procedure io.DeleteAll<T>(const ATypeAlias: String; const AWhere: IioWhere);
var
  LList: TObject;
begin
  if TioUtilities.IsAnInterface<T> then
    LList := Self.Load<T>(ATypeAlias).Add(AWhere).ToGenericList.OfType<TList<IInterface>>
  else
    LList := Self.Load<T>(ATypeAlias).Add(AWhere).ToGenericList.OfType<TObjectList<TObject>>;
  try
    Self.DeleteList(LList);
  finally
    LList.Free;
  end;
end;

class procedure io.Show(const AEntityTypeName: String; const AWhere: IioWhere; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String);
begin
  if di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Exist then
    di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetBindSource(AWhere).Show
  else
    di.LocateViewVMfor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetBindSource(AWhere).Show;
end;

class procedure io.Show(const AEntityTypeName: String; const AWhere: IioWhere; const AParentCloseQueryAction: IioBSCloseQueryAction;
  const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  if di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Exist then
    di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetBindSource(AWhere).VCProvider(AVCProvider).Show
  else
    di.LocateViewVMfor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetBindSource(AWhere).VCProvider(AVCProvider).Show;
end;

class procedure io.Show(const AEntityTypeName: String; const AWhere: IioWhere; const AParentCloseQueryAction: IioBSCloseQueryAction;
  const AViewContext: TComponent; const AVVMAlias: String);
begin
  if di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Exist then
    di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetBindSource(AWhere).SetViewContext(AViewContext).Show
  else
    di.LocateViewVMfor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetBindSource(AWhere).SetViewContext(AViewContext).Show;
end;

class procedure io.Show<T>(const AWhere: IioWhere; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String);
begin
  if di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).Exist then
    di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).SetBindSource(AWhere).Show
  else
    di.LocateViewVMfor<T>(AParentCloseQueryAction, AVVMAlias).SetBindSource(AWhere).Show;
end;

class procedure io.Show<T>(const AWhere: IioWhere; const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider;
  const AVVMAlias: String);
begin
  if di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).Exist then
    di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).SetBindSource(AWhere).VCProvider(AVCProvider).Show
  else
    di.LocateViewVMfor<T>(AParentCloseQueryAction, AVVMAlias).SetBindSource(AWhere).VCProvider(AVCProvider).Show;
end;

class procedure io.Show<T>(const AWhere: IioWhere; const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent;
  const AVVMAlias: String);
begin
  if di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).Exist then
    di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).SetBindSource(AWhere).SetViewContext(AViewContext).Show
  else
    di.LocateViewVMfor<T>(AParentCloseQueryAction, AVVMAlias).SetBindSource(AWhere).SetViewContext(AViewContext).Show;
end;

class procedure io.ShowAsSelector<T>(const AWhere: IioWhere; const ASelectionTargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction;
  const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS, False, False) then
    if di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).SetBindSourceAsSelectorFor(ASelectionTargetBS).SetBindSource(AWhere).Show
    else
      di.LocateViewVMfor<T>(AParentCloseQueryAction, AVVMAlias).SetBindSourceAsSelectorFor(ASelectionTargetBS).SetBindSource(AWhere).Show;
end;

class procedure io.ShowAsSelector<T>(const AWhere: IioWhere; const ASelectionTargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction;
  const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS, False, False) then
    if di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).SetBindSourceAsSelectorFor(ASelectionTargetBS).SetBindSource(AWhere).Show
    else
      di.LocateViewVMfor<T>(AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).SetBindSourceAsSelectorFor(ASelectionTargetBS).SetBindSource(AWhere).Show;
end;

class procedure io.ShowAsSelector<T>(const AWhere: IioWhere; const ASelectionTargetBS: IioBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction;
  const AViewContext: TComponent; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS, False, False) then
    if di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).SetBindSourceAsSelectorFor(ASelectionTargetBS).SetBindSource(AWhere).Show
    else
      di.LocateViewVMfor<T>(AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).SetBindSourceAsSelectorFor(ASelectionTargetBS).SetBindSource(AWhere).Show;
end;

class procedure io.ShowAsETM<T>(const AWhere: IioWhere; const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction;
  const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS as IioBindSource, False, False) then
    if di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).SetBindSourceAsETMfor(ASelectionTargetBS).SetBindSource(AWhere).Show
    else
      di.LocateViewVMfor<T>(AParentCloseQueryAction, AVVMAlias).SetBindSourceAsETMfor(ASelectionTargetBS).SetBindSource(AWhere).Show;
end;

class procedure io.ShowAsETM<T>(const AWhere: IioWhere; const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction;
  const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS as IioBindSource, False, False) then
    if di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).SetBindSourceAsETMfor(ASelectionTargetBS).SetBindSource(AWhere).Show
    else
      di.LocateViewVMfor<T>(AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).SetBindSourceAsETMfor(ASelectionTargetBS).SetBindSource(AWhere).Show;
end;

class procedure io.ShowAsETM<T>(const AWhere: IioWhere; const ASelectionTargetBS: IioMasterBindSource; const AParentCloseQueryAction: IioBSCloseQueryAction;
  const AViewContext: TComponent; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS as IioBindSource, False, False) then
    if di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor<T>(AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).SetBindSourceAsETMfor(ASelectionTargetBS).SetBindSource(AWhere).Show
    else
      di.LocateViewVMfor<T>(AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).SetBindSourceAsETMfor(ASelectionTargetBS).SetBindSource(AWhere).Show;
end;

class procedure io.ShowAsETM(const AEntityTypeName: String; const AWhere: IioWhere; const ASelectionTargetBS: IioMasterBindSource;
  const AParentCloseQueryAction: IioBSCloseQueryAction; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS as IioBindSource, False, False) then
    if di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetBindSourceAsETMfor(ASelectionTargetBS).SetBindSource(AWhere).Show
    else
      di.LocateViewVMfor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetBindSourceAsETMfor(ASelectionTargetBS).SetBindSource(AWhere).Show;
end;

class procedure io.ShowAsETM(const AEntityTypeName: String; const AWhere: IioWhere; const ASelectionTargetBS: IioMasterBindSource;
  const AParentCloseQueryAction: IioBSCloseQueryAction; const AVCProvider: TioViewContextProvider; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS as IioBindSource, False, False) then
    if di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).SetBindSourceAsETMfor(ASelectionTargetBS).SetBindSource(AWhere).Show
    else
      di.LocateViewVMfor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).VCProvider(AVCProvider).SetBindSourceAsETMfor(ASelectionTargetBS).SetBindSource(AWhere).Show;
end;

class procedure io.ShowAsETM(const AEntityTypeName: String; const AWhere: IioWhere; const ASelectionTargetBS: IioMasterBindSource;
  const AParentCloseQueryAction: IioBSCloseQueryAction; const AViewContext: TComponent; const AVVMAlias: String);
begin
  if TioCommonBSBehavior.IsValidForDependencyInjectionLocator(ASelectionTargetBS as IioBindSource, False, False) then
    if di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).Exist then
      di.LocateSimpleViewFor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).SetBindSourceAsETMfor(ASelectionTargetBS).SetBindSource(AWhere).Show
    else
      di.LocateViewVMfor(AEntityTypeName, AParentCloseQueryAction, AVVMAlias).SetViewContext(AViewContext).SetBindSourceAsETMfor(ASelectionTargetBS).SetBindSource(AWhere).Show;
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
  TioEnumContainer._Build;
  TioMapContainer._Build;

  // Enums UI translations
  io.Enums.Add<TioPersistenceActionType>('do not persist, insert, update, delete');
  io.Enums.Add<TioPersistenceIntentType>('regular, revert, synchro (svr), synchro (cli)');
  io.Enums.Add<TioPersistenceConflictState>('undefined, resolved, rejected, rejected raise');
  io.Enums.Add<TioEtmTimeSlotSynchroState>('regular, to be synchronized, sent to server, received from server, received from client');
  io.Enums.Add<TioSynchroLevel>('incremental, full');
  io.Enums.Add<TioSynchroStatus>('0-initialization, 1-load from client, 2-save to server, 3-reload from client, 4-save to client, 5-finalization, 6-completed');
  io.Enums.Add<TioSynchroErrorState>(', NOT COMPLETED, CONFLICT, ERROR');

end.
