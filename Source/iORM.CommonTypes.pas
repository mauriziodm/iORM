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
unit iORM.CommonTypes;

interface

uses
  System.Rtti, System.Generics.Collections, System.SysUtils, DJSON.Params;

const
  // M.M. 11/08/18 Default length to 50 if no attribute is specified because Firebird has a length limit on index generation for columns of length 255.
  // Mauri 04/08/20 True, but if PageSize = 4096 (most common) the limit is 253.
  IO_DEFAULT_FIELD_LENGTH = 250;
  IO_DEFAULT_FIELD_PRECISION = 10;
  IO_DEFAULT_FIELD_SCALE = 3;

  IO_TRUECLASS_FIELDNAME = 'ClassInfo';
  IO_TRUECLASS_FIELDLENGTH = 250;

  IO_CONNECTIONDEF_DEFAULTNAME = 'NO_NAME';
  IO_INTEGER_NULL_VALUE = 0;

  IO_CURRENTUSERINFO_NAME_EMPTY = '';
  IO_CURRENTUSERINFO_ID_EMPTY = 0;

  IO_HASMANY_CHILD_VIRTUAL_PROPERTY_NAME = 'Master___ID';

  IO_USERNAME_LENGTH = 30;

  // TdjSkipScope = (ssMap, ssETM, ssHTTP, ssEmbeddeRelation, ssSUD, ssSaveRevertPoint, ssDJSON);
  ssMap = DJSON.Params.TdjSkipScope.ssMap;
  ssETM = DJSON.Params.TdjSkipScope.ssETM;
  ssHTTP = DJSON.Params.TdjSkipScope.ssHTTP;
  ssEmbeddeRelation = DJSON.Params.TdjSkipScope.ssEmbeddeRelation;
  ssSUD = DJSON.Params.TdjSkipScope.ssSUD;
  ssSaveRevertPoint = DJSON.Params.TdjSkipScope.ssSaveRevertPoint;
  ssDJSON = DJSON.Params.TdjSkipScope.ssDJSON;

type

  // SkipScope (vedi anche sopra (const) i valori)
  TioSkipScope = DJSON.Params.TdjSkipScope;
  TioSkipScopeSet = DJSON.Params.TdjSkipScopeSet;

  // Event handlers type
  TCloseQueryEvent = procedure(Sender: TObject; var CanClose: Boolean) of object;

  TioStdActionNewInstanceAsObjectEvent = procedure(const ASender: TObject; out NewInstance: TObject) of object;
  TioStdActionNewInstanceAsInterfaceEvent = procedure(const ASender: TObject; out NewInstance: IInterface) of object;

  TioStdAction_ETM_BeforeRevertEvent = procedure(const ASender: TObject; out ATargetObj: TObject) of object;
  TioStdAction_ETM_AfterRevertEvent = procedure(const ASender: TObject; const ARevertedObj: TObject) of object;

  // StdActions types
  TioStdAction_ETM_AutoExec_AfterRevert = (doNothing, doRefresh, doReload);

  // Compare operators
  TioCompareOp = (coEquals, coNotEquals, coGreater, coLower, coGreaterOrEqual, coLowerOrEqual, coLike, coNotLike, coIsNull, coIsNotNull);

  // Logical relations
  TioLogicOp = (loAnd, loOr, loNot, loOpenPar, loClosePar);

  // Object Status
  TioObjStatus = (osDirty = 0, osClean, osDeleted);

  // Object version
  TioObjVersion = type Integer;

  // Object creation and last update DateTime
  TioObjCreated = type TDateTime;
  TioObjCreatedUserID = type Integer;
  TioObjCreatedUserName = type String;
  TioObjUpdated = type TDateTime;
  TioObjUpdatedUserID = type Integer;
  TioObjUpdatedUserName = type String;

  // The property role
  TioPropertyRole = (prRegular, prObjID, prObjStatus, prObjVersion, prObjUpdated, prObjUpdatedUserID, prObjUpdatedUserName, prObjCreated, prObjCreatedUserID, prObjCreatedUserName);

  // Common ClassRef
  TioClassRef = class of TObject;

  // DB index orientation
  TioIndexOrientation = (ioAscending = 0, ioDescending);

  // FD monitor and trace mode
  TioMonitorMode = (mmDisabled = 0, mmRemote, mmFlatFile);

  // Anonimous methods for ShowWait & CloseWait
  TioShowWaitProc = reference to procedure;
  TioHideWaitProc = reference to procedure;

  TioTypeOfCollection = (tcSingleObject, tcList);

  // Selection Type for selector ActiveBindSourceAdapters
  TioSelectionType = (stAppend, stInsert);

  // LoadType property for BindSources:
  // ltManual:                  loading of the objects into the bind sources is fully manual, call the "SetDataObject" of a master bind source
  // ltAuto:                    iORM automatically generates all calls to the ORM to load objects and assign them to bind source
  // ltFromBSAsIs:              the bind source receives the object to bind from a source bind source AS IS, the object isn't reloaded
  // ltFromBSReload:            the bind source receives the object to bind from a source bind source and reloads it for any changes or lazy load
  // ltFromBSReloadNewInstance: the bind source receives the object to bind from a source bind source and reloads it AS A NEW INSTANCE for any changes or lazy load
  TioLoadType = (ltManual, ltCreate, ltFromBSAsIs, ltFromBSReload, ltFromBSReloadNewInstance, ltAuto);

  // ETM types
  // Note: Literal description for values added at the end of the "iORM.pas" unit (initialization)
  TioEtmEventType = (etInsert, etUpdate, etDelete, etSynchro);
  TioEtmConflictType = (ctNoConflict, ctMasterWin, ctSlaveWin, ctLastUpdatedWin, ctManual);

  // CloseQueryAction related types
  TioBSCloseQueryConfirmationRequestEvent = procedure(Sender: TObject; var CanClose: Boolean) of object;
  TioBSCloseQueryActionUpdateScope = (usLocal, usDisableIfChilds, usGlobal);
  TioBSCloseQueryOnEditingAction = (eaDisable, eaAutoPersist, eaAutoRevert);
  TioBSCloseQueryOnExecuteAction = (eaClose, eaTerminateApplication);
  TioBSCloseQueryRepeaterScope = (rsFirstLevelChilds, rsDeepChilds);

  // Some pointers to TValue
  PValue = ^TValue;

  // Nullables
  TioNullable<T> = record
  const
    ISNULL_VALUE = '$';
  private
    FValue: T;
    FIsNull: String;
    function GetValue: T;
    procedure SetValue(const Value: T);
    function GetHasValue: Boolean;
    function GetIsNull: Boolean;
  public
    procedure Clear;
    property Value: T read GetValue write SetValue;
    property IsNull: Boolean read GetIsNull;
    property HasValue: Boolean read GetHasValue;
  end;

  TioNullableString = TioNullable<String>;
  TioNullableInteger = TioNullable<Integer>;
  TioNullableFloat = TioNullable<Extended>;
  TioNullableBoolean = TioNullable<Boolean>;
  TioNullableDateTime = TioNullable<TDateTime>;


implementation

uses
  iORM.Exceptions, System.TypInfo;

{ ioNullable<T> }

procedure TioNullable<T>.Clear;
begin
  FIsNull := String.Empty;
end;

function TioNullable<T>.GetHasValue: Boolean;
begin
  result := (not IsNull);
end;

function TioNullable<T>.GetIsNull: Boolean;
begin
  result := (Length(FIsNull) = 0);
end;

function TioNullable<T>.GetValue: T;
begin
  if IsNull then
    raise EioException.Create('ioNullable: Value is null.');
  result := FValue;
end;

procedure TioNullable<T>.SetValue(const Value: T);
begin
  FValue := Value;
  FIsNull := ISNULL_VALUE;
end;

end.
