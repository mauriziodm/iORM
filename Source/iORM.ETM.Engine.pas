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
{
  ********************************************************************************************************************************
  * NOTE: TioEtmCustomTimeSlot base class for all EtmTimeSlots is declared in iORM.Attributes unit to avoid circular refeference *
  * NOTE: TioEtmCustomTimeSlot base class for all EtmTimeSlots is declared in iORM.Attributes unit to avoid circular refeference *
  * NOTE: TioEtmCustomTimeSlot base class for all EtmTimeSlots is declared in iORM.Attributes unit to avoid circular refeference *
  ********************************************************************************************************************************
}
unit iORM.ETM.Engine;

interface

uses
  System.Classes, System.Generics.Collections, iORM.Where.Interfaces,
  iORM.Context.Map.Interfaces, iORM.Attributes, System.JSON,
  iORM.ETM.Interfaces, iORM.LiveBindings.BSPersistence;

type

  TioEtmEngineRef = class of TioEtmEngine;

  TioEtmEngine = class
  private
    class function _InternalGetMap(const AEntityClassName: String): IioMap;
    class function _InternalBuildTimeLineWhere(const AEntityClassName: String; const AEntityID: Integer = 0): IioWhere<TioEtmCustomTimeSlot>;
    class function _InternalTimeLineFor(const AEntityClassName: String; const AEntityID: Integer; const AWhere: IioWhere = nil)
      : TioEtmTimeline; overload;
    class procedure _ObjVersionToNegativeRevertIntent(const AObj: TObject);
    class procedure _CheckTimeSlot(const ATimeSlot: TioEtmCustomTimeSlot; const ATargetClassName: String = '');
    class function _InternalDiffAsJsonObject(const ANewestVersionObj, AOldestVersionObj: TObject; const ADiffMode: TioEtmDiffMode; const AMoreInfo: Boolean): TJSONObject; overload;
  public
    // Used by TioWhere.GetSql
    class function _InternalBuildWhereTextFor(const AObj: TObject): String;
    // Fluent interface
    class function FluentTimelineFor<T: class>: IioWhere<TioEtmCustomTimeSlot>; overload;
    class function FluentTimeiineFor(const AClassName: String): IioWhere<TioEtmCustomTimeSlot>; overload;
    class function FluentTimelineFor(const AObj: TObject): IioWhere<TioEtmCustomTimeSlot>; overload;
    class function FluentTimelineFor(const AIntf: IInterface): IioWhere<TioEtmCustomTimeSlot>; overload;
    // Non fluent interface
    class function TimelineFor<T: class>(const AEntityID: Integer; const AWhere: IioWhere = nil): TioEtmTimeline; overload;
    class function TimelineFor(const AClassName: String; const AEntityID: Integer; const AWhere: IioWhere = nil)
      : TioEtmTimeline; overload;
    class function TimelineFor(const AObj: TObject; const AWhere: IioWhere = nil): TioEtmTimeline; overload;
    class function TimelineFor(const AIntf: IInterface; const AWhere: IioWhere = nil): TioEtmTimeline; overload;
    // Revert
    class function RevertObject(const ATimeSlot: TioEtmCustomTimeSlot; const APersistImmediately: Boolean = False): TObject; overload;
    class function RevertObject<T: class>(const ATimeSlot: TioEtmCustomTimeSlot; const APersistImmediately: Boolean = False): T; overload;
    // RevertToObject
    class procedure RevertToObject(const ATargetObj: TObject; const ATimeSlot: TioEtmCustomTimeSlot; const APersistImmediately: Boolean = False); overload;
    class procedure RevertToObject(const ATargetIntf: IInterface; const ATimeSlot: TioEtmCustomTimeSlot; const APersistImmediately: Boolean = False); overload;
    // RevertToDB
    class procedure RevertToDB(const ATimeSlot: TioEtmCustomTimeSlot);
    // RevertToBindSource
    class procedure RevertToBindSource(const ATimeSlot: TioEtmCustomTimeSlot; const ATargetBindSource: IioMasterBindSource; const APersistImmediately: Boolean = False);
    // Trace
    class procedure TraceByMap(const AMap: IioMap; const AEtmTimeSlotClass: TioEtmTimeSlotRef; const ATraceOnlyOnConnectionName: String = '');
    class procedure Trace<T: class>(const AEtmTimeSlotClass: TioEtmTimeSlotRef; const ATraceOnlyOnConnectionName: String = '');
    // Untrace
    class procedure Untrace<T: class>(const ATraceOnlyOnConnectionName: String = '');
    // DiffAsJsonObject
    class function DiffAsJsonObject(const ANewestTimeSlot, AOldestTimeSlot: TioEtmCustomTimeSlot; const ADiffMode: TioEtmDiffMode = dmOneway; const AMoreInfo: Boolean = False): TJSONObject; overload;
    class function DiffAsJsonObject(const ANewestObj: TObject; const AOldestTimeSlot: TioEtmCustomTimeSlot; const ADiffMode: TioEtmDiffMode = dmOneway; const AMoreInfo: Boolean = False): TJSONObject; overload;
    class function DiffAsJsonObject(const ANewestIntf: IInterface; const AOldestTimeSlot: TioEtmCustomTimeSlot; const ADiffMode: TioEtmDiffMode = dmOneway; const AMoreInfo: Boolean = False): TJSONObject; overload;
    // DiffToStream
    class procedure DiffToStream(const ATargetStream: TStream; const ANewestTimeSlot, AOldestTimeSlot: TioEtmCustomTimeSlot; const ADiffMode: TioEtmDiffMode = dmOneway; const AMoreInfo: Boolean = False); overload;
    class procedure DiffToStream(const ATargetStream: TStream; const ANewestObj: TObject; const AOldestTimeSlot: TioEtmCustomTimeSlot; const ADiffMode: TioEtmDiffMode = dmOneway; const AMoreInfo: Boolean = False); overload;
    class procedure DiffToStream(const ATargetStream: TStream; const ANewestIntf: IInterface; const AOldestTimeSlot: TioEtmCustomTimeSlot; const ADiffMode: TioEtmDiffMode = dmOneway; const AMoreInfo: Boolean = False) overload;
    // DiffToFile
    class procedure DiffToFile(const AFileName: String; const ANewestTimeSlot, AOldestTimeSlot: TioEtmCustomTimeSlot; const ADiffMode: TioEtmDiffMode = dmOneway; const AMoreInfo: Boolean = False); overload;
    class procedure DiffToFile(const AFileName: String; const ANewestObj: TObject; const AOldestTimeSlot: TioEtmCustomTimeSlot; const ADiffMode: TioEtmDiffMode = dmOneway; const AMoreInfo: Boolean = False); overload;
    class procedure DiffToFile(const AFileName: String; const ANewestIntf: IInterface; const AOldestTimeSlot: TioEtmCustomTimeSlot; const ADiffMode: TioEtmDiffMode = dmOneway; const AMoreInfo: Boolean = False) overload;
    // Diff
    class function Diff(const ANewestTimeSlot, AOldestTimeSlot: TioEtmCustomTimeSlot; const ADiffMode: TioEtmDiffMode = dmOneway; const AMoreInfo: Boolean = False): String; overload;
    class function Diff(const ANewestObj: TObject; const AOldestTimeSlot: TioEtmCustomTimeSlot; const ADiffMode: TioEtmDiffMode = dmOneway; const AMoreInfo: Boolean = False): String; overload;
    class function Diff(const ANewestIntf: IInterface; const AOldestTimeSlot: TioEtmCustomTimeSlot; const ADiffMode: TioEtmDiffMode = dmOneway; const AMoreInfo: Boolean = False): String; overload;
  end;

implementation

uses
  iORM, iORM.Utilities, iORM.CommonTypes, iORM.Exceptions, System.SysUtils,
  iORM.ETM.Interceptor, iORM.Context.Factory, iORM.Context.Container, DJSON,
  iORM.Context.Interfaces, iORM.ETM.Factory, iORM.SqlTranslator;

{ TIoEtmEngine }

class function TioEtmEngine._InternalGetMap(const AEntityClassName: String): IioMap;
begin
  Result := TioMapContainer.GetMap(AEntityClassName);
  if not Assigned(Result.GetTable.GetEtmTimeSlotClass) then
    raise EioEtmException.Create(ClassName, '_InternalGetMap',
      Format('Hi, I''m iORM, listen to me.' + #13#13'The class "%s" is not registered in the ETM (Entity Time Machine) subsystem.' +
      #13#13'You can register the class "%s" decorating its declaration with the attribute "[etmTrace(ATimeSlotClass)]" or by code with a line like "io.etm.Trace<%s>(ATimeSlotClass)".'
      + #13#13'The "ATimeSlotClass" parameter is the TimeSlot (the repository item) class that you will need to have previously declared descending it from the "TioEtmCustomTimeSlot" base class provided by me (iORM).'
      + #13#13'You''ll see it works.', [AEntityClassName, AEntityClassName, AEntityClassName]));
end;

class procedure TioEtmEngine._CheckTimeSlot(const ATimeSlot: TioEtmCustomTimeSlot; const ATargetClassName: String = '');
begin
  // Check TimeSlot
  if not Assigned(ATimeSlot) then
    raise EioEtmException.Create(ClassName, 'Revert', '"ATimeSlot" parameter cannot be nil.');
  // Delete operation has no state
  if ATimeSlot.ActionType = atDelete then
    raise EioEtmException.Create(ClassName, 'Revert', Format('Hi, I''m iORM, I have to tell you an important thing.' +
      #13#13'Revert is not allowed for "Delete" type operations because they have no information about the state to restore.' +
      #13#13'The attempt to restore the entity of type "%s" ID %d version %d has failed.', [ATimeSlot.EntityClassName, ATimeSlot.EntityID,
      ATimeSlot.EntityVersion]));
  // Type check
  if (not ATargetClassName.IsEmpty) and (ATimeSlot.EntityClassName <> ATargetClassName) then
    raise EioEtmException.Create(ClassName, 'Revert',
      Format('Houston we have a problem.' +
      #13#13'The type of the entity you asked me to revert and the one contained in the provided TimeSlot do not match.' +
      #13#13'I can''t restore the state of type "%s" ID %d version %d to an object of type "%s".', [ATimeSlot.EntityClassName,
      ATimeSlot.EntityID, ATimeSlot.EntityVersion, ATargetClassName]));
end;

class function TioEtmEngine._InternalBuildTimeLineWhere(const AEntityClassName: String; const AEntityID: Integer = 0): IioWhere<TioEtmCustomTimeSlot>;
var
  LMap: IioMap;
begin
  Result := io.Where<TioEtmCustomTimeSlot>('EntityClassName', coEquals, AEntityClassName)._OrderBy('[.EntityVersion]');
  if AEntityID <> 0 then
    Result._And('EntityID', coEquals, AEntityID);
  Result._OrderBy('[.EntityVersion]');
  LMap := _InternalGetMap(AEntityClassName);
  Result.TypeName := LMap.GetTable.GetEtmTimeSlotClass.ClassName;
end;

class function TioEtmEngine._InternalTimeLineFor(const AEntityClassName: String; const AEntityID: Integer; const AWhere: IioWhere = nil)
  : TioEtmTimeline;
var
  LWhere: IioWhere<TioEtmCustomTimeSlot>;
begin
  LWhere := _InternalBuildTimeLineWhere(AEntityClassName, AEntityID);
  Result := LWhere._And(AWhere).ToGenericList.OfType<TioEtmTimeline>;
end;

class procedure TioEtmEngine._ObjVersionToNegativeRevertIntent(const AObj: TObject);
var
  LContext: IioContext;
begin
  LContext := TioContextFactory.Context(itRevert, AObj.ClassName, nil, AObj, nil, '', '', BL_DEFAULT);
  if LContext.ObjVersion > 0 then
    LContext.ObjVersion := -LContext.ObjVersion;
end;

class function TioEtmEngine.TimelineFor(const AClassName: String; const AEntityID: Integer; const AWhere: IioWhere): TioEtmTimeline;
begin
  Result := _InternalTimeLineFor(AClassName, AEntityID, AWhere);
end;

class function TioEtmEngine.TimelineFor<T>(const AEntityID: Integer; const AWhere: IioWhere): TioEtmTimeline;
begin
  Result := _InternalTimeLineFor(T.ClassName, AEntityID, AWhere);
end;

class function TioEtmEngine.TimelineFor(const AIntf: IInterface; const AWhere: IioWhere): TioEtmTimeline;
begin
  Result := _InternalTimeLineFor((AIntf as TObject).ClassName, TioUtilities.ExtractOID(AIntf), AWhere);
end;

class function TioEtmEngine.TimelineFor(const AObj: TObject; const AWhere: IioWhere): TioEtmTimeline;
begin
  Result := _InternalTimeLineFor(AObj.ClassName, TioUtilities.ExtractOID(AObj), AWhere);
end;

class function TioEtmEngine.FluentTimeiineFor(const AClassName: String): IioWhere<TioEtmCustomTimeSlot>;
begin
  Result := _InternalBuildTimeLineWhere(AClassName);
end;

class function TioEtmEngine.FluentTimelineFor<T>: IioWhere<TioEtmCustomTimeSlot>;
begin
  Result := _InternalBuildTimeLineWhere(T.ClassName);
end;

class function TioEtmEngine.RevertObject(const ATimeSlot: TioEtmCustomTimeSlot; const APersistImmediately: Boolean): TObject;
begin
  // Check TimeSlot
  _CheckTimeSlot(ATimeSlot, String.Empty);
  // Revert
  Result := dj.FromJson(ATimeSlot.EntityState, TioEtmFactory.djParamsEngine).ToObject;
  // The entity's ObjVersion property is reset with a negative value to indicate that it has been reset by the ETM
  _ObjVersionToNegativeRevertIntent(Result);
  // Persist immediately
  if APersistImmediately then
    io._PersistObject(Result, itRevert, BL_ETM_REVERT_TO_OBJ);
end;

class procedure TioEtmEngine.RevertToObject(const ATargetIntf: IInterface; const ATimeSlot: TioEtmCustomTimeSlot;
  const APersistImmediately: Boolean);
begin
  RevertToObject(ATargetIntf as TObject, ATimeSlot);
end;

class function TioEtmEngine.RevertObject<T>(const ATimeSlot: TioEtmCustomTimeSlot; const APersistImmediately: Boolean = False): T;
begin
  // Check TimeSlot
  _CheckTimeSlot(ATimeSlot, T.ClassName);
  // Revert
  Result := dj.FromJson(ATimeSlot.EntityState, TioEtmFactory.djParamsEngine).&To<T>;
  // The entity's ObjVersion property is reset with a negative value to indicate that it has been reset by the ETM
  _ObjVersionToNegativeRevertIntent(Result);
  // Persist immediately
  if APersistImmediately then
    io._PersistObject(Result, itRevert, BL_ETM_REVERT_TO_OBJ);
end;

class procedure TioEtmEngine.RevertToObject(const ATargetObj: TObject; const ATimeSlot: TioEtmCustomTimeSlot; const APersistImmediately: Boolean);
begin
  // Check TimeSlot
  _CheckTimeSlot(ATimeSlot, ATargetObj.ClassName);
  // Revert
  dj.FromJson(ATimeSlot.EntityState, TioEtmFactory.djParamsEngine).&To(ATargetObj);
  // The entity's ObjVersion property is reset with a negative value to indicate that it has been reset by the ETM
  _ObjVersionToNegativeRevertIntent(ATargetObj);
  // Persist immediately
  if APersistImmediately then
    io._PersistObject(ATargetObj, itRevert, BL_ETM_REVERT_TO_OBJ);
end;

class procedure TioEtmEngine.RevertToBindSource(const ATimeSlot: TioEtmCustomTimeSlot; const ATargetBindSource: IioMasterBindSource; const APersistImmediately: Boolean = False);
begin
  // Check ATargetBindSource
  if (not Assigned(ATargetBindSource)) or (not ATargetBindSource.IsActive) then
    raise EioEtmException.Create(ClassName, 'RevertToBindSource', '"ATargetBindSource" parameter must be assigned and activated.');
  if ATargetBindSource.Current = nil then
    raise EioEtmException.Create(ClassName, 'RevertToBindSource', 'Current object of the TargetBindSource is nil.');
  // Check ATargetBindSource.ETMfor bind source
  if (not Assigned(ATargetBindSource.ETMfor)) or (not ATargetBindSource.ETMfor.IsActive) then
    raise EioEtmException.Create(ClassName, 'RevertToBindSource', '"ATargetBindSource.ETMfor" bind source must be assigned and activated.');
  if ATargetBindSource.ETMfor.Current = nil then
    raise EioEtmException.Create(ClassName, 'RevertToBindSource', 'Current object of the ATargetBindSource.ETMfor bind source is nil.');
  // Execute the revert operation
  RevertToObject(ATargetBindSource.ETMfor.Current, ATimeSloT, APersistImmediately);
end;

class procedure TioEtmEngine.RevertToDB(const ATimeSlot: TioEtmCustomTimeSlot);
var
  LObj: TObject;
begin
  // Check TimeSlot
  _CheckTimeSlot(ATimeSlot);
  // Revert
  LObj := dj.FromJson(ATimeSlot.EntityState, TioEtmFactory.djParamsEngine).ToObject;
  try
    // The entity's ObjVersion property is reset with a negative value to indicate that it has been reset by the ETM
    _ObjVersionToNegativeRevertIntent(LObj);
    // Persist immediately
    io._PersistObject(LObj, itRevert, BL_ETM_REVERT_TO_DB);
  finally
    LObj.Free;
  end;
end;

class function TioEtmEngine._InternalDiffAsJsonObject(const ANewestVersionObj, AOldestVersionObj: TObject; const ADiffMode: TioEtmDiffMode; const AMoreInfo: Boolean)
  : TJSONObject;
begin
  // Check instances
  if (not Assigned(ANewestVersionObj)) or (not Assigned(AOldestVersionObj)) then
    raise EioEtmException.Create(ClassName, 'DiffAsJsonObject', '"ANewestVersionObj" and "AOldestVersionObj" parameters must be assigned.');
  // Get the differences
  Result := TioEtmFactory.Diff(ADiffMode).Diff(AOldestVersionObj, ANewestVersionObj, AMoreInfo);
end;

class function TioEtmEngine.DiffAsJsonObject(const ANewestTimeSlot, AOldestTimeSlot: TioEtmCustomTimeSlot;
  const ADiffMode: TioEtmDiffMode; const AMoreInfo: Boolean): TJSONObject;
var
  LNewestObject, LOldestObject: TObject;
begin
  // Init
  LNewestObject := nil;
  LOldestObject := nil;
  // Check TimeSlot
  _CheckTimeSlot(ANewestTimeSlot);
  _CheckTimeSlot(AOldestTimeSlot);
  try
    // Get objects from the TimeSlot
    LNewestObject := dj.FromJson(ANewestTimeSlot.EntityState, TioEtmFactory.djParamsEngine).ToObject;
    LOldestObject := dj.FromJson(ANewestTimeSlot.EntityState, TioEtmFactory.djParamsEngine).ToObject;
    // Diff
    Result := _InternalDiffAsJsonObject(LNewestObject, LOldestObject, ADiffMode, AMoreInfo);
  finally
    if Assigned(LNewestObject) then
      LNewestObject.Free;
    if Assigned(LOldestObject) then
      LOldestObject.Free;
  end;
end;

class function TioEtmEngine.DiffAsJsonObject(const ANewestObj: TObject; const AOldestTimeSlot: TioEtmCustomTimeSlot; const ADiffMode: TioEtmDiffMode; const AMoreInfo: Boolean): TJSONObject;
var
  LOldestObj: TObject;
begin
  // Init
  LOldestObj := nil;
  // Checks
  _CheckTimeSlot(AOldestTimeSlot);
  if not Assigned(ANewestObj) then
    raise EioEtmException.Create(ClassName, 'DiffAsJsonObject', '"ANewestVersionObj"  parameter must be assigned.');
  try
    // Get oldest object from the oldest TimeSlot
    LOldestObj := dj.FromJson(AOldestTimeSlot.EntityState, TioEtmFactory.djParamsEngine).ToObject;
    // Diff
    Result := _InternalDiffAsJsonObject(ANewestObj, LOldestObj, ADiffMode, AMoreInfo);
  finally
    if Assigned(LOldestObj) then
      LOldestObj.Free;
  end;
end;

class function TioEtmEngine.Diff(const ANewestTimeSlot, AOldestTimeSlot: TioEtmCustomTimeSlot; const ADiffMode: TioEtmDiffMode;
  const AMoreInfo: Boolean): String;
var
  LDiffJsonObj: TJSONObject;
begin
  LDiffJsonObj := DiffAsJsonObject(ANewestTimeSlot, AOldestTimeSlot, ADiffMode, AMoreInfo);
  try
    Result := LDiffJsonObj.Format;
  finally
    LDiffJsonObj.Free;
  end;
end;

class function TioEtmEngine.Diff(const ANewestObj: TObject; const AOldestTimeSlot: TioEtmCustomTimeSlot; const ADiffMode: TioEtmDiffMode;
  const AMoreInfo: Boolean): String;
var
  LDiffJsonObj: TJSONObject;
begin
  LDiffJsonObj := DiffAsJsonObject(ANewestObj, AOldestTimeSlot, ADiffMode, AMoreInfo);
  try
    Result := LDiffJsonObj.Format;
  finally
    LDiffJsonObj.Free;
  end;
end;

class function TioEtmEngine._InternalBuildWhereTextFor(const AObj: TObject): String;
var
  LMap: IioMap;
  LTimeSlotClass: TioEtmTimeSlotRef;
begin
  Result := String.Empty;
  // Check if the AObj is asigned
  if not Assigned(AObj) then
    raise EioEtmException.Create(ClassName, 'BuildETMfor', '"AObj" parameter is not assigned.');
  // Get the map for the object (entity) and check if a TimeSlotClass is defined for it
  LMap := TioMapContainer.GetMap(AObj.ClassName);
  // Get the time slot class for the entity
  LTimeSlotClass := LMap.GetTable.EtmTimeSlotClass;
  if not Assigned(LTimeSlotClass) then
    raise EioEtmException.Create(ClassName, 'BuildETMfor', Format('Hi, I''m iORM and we have a problem.' +
      #13#13'You asked me a TimeLine for the class "%s" but this is not set to be traced by the ETM (Entity Time Machine) subsystem.' +
      #13#13'Maybe you forgot to tell iORM to trace the class by an EntityTimeMachine (ETM) repository.' +
      #13#13'Let me explain:' +
      #13#13'1) You need to declare an ETM repository by deriving your time slot class from "TioEtmCustomTimeSlot" and decorate it with "[etmRepository(...)]" attribute, thus you have created a repository.' +
      #13#13'2) You have to tell iORM to trace your entity class by decorating its declaration with the "[etmTrace(YourTimeSlotClass...)]" attribute indicating in the parameter the repository class on which it has to be traced.' +
      #13'Alternatively, if you don''t want to use the attribute, you can also write a line of code like this: "io.etm.Trace<TMyEntityClass>(TMyTimeSlotClass...)".',
      [AObj.ClassName]));
  // Build the where text
  Result := Format('[.EntityClassName] LIKE ''%s'' AND  [.EntityID] = %d', [AObj.ClassName, LMap.GetProperties.GetIdProperty.GetValue(AObj).AsInteger]);
  Result := TioSqlTranslator.Translate(Result, LTimeSlotClass.ClassName, False);
end;

class function TioEtmEngine.Diff(const ANewestIntf: IInterface; const AOldestTimeSlot: TioEtmCustomTimeSlot; const ADiffMode: TioEtmDiffMode;
  const AMoreInfo: Boolean): String;
var
  LDiffJsonObj: TJSONObject;
begin
  LDiffJsonObj := DiffAsJsonObject(ANewestIntf, AOldestTimeSlot, ADiffMode, AMoreInfo);
  try
    Result := LDiffJsonObj.Format;
  finally
    LDiffJsonObj.Free;
  end;
end;

class function TioEtmEngine.DiffAsJsonObject(const ANewestIntf: IInterface; const AOldestTimeSlot: TioEtmCustomTimeSlot;
  const ADiffMode: TioEtmDiffMode; const AMoreInfo: Boolean): TJSONObject;
begin
  Result := DiffAsJsonObject(ANewestIntf as TObject, AOldestTimeSlot, ADiffMode, AMoreInfo);
end;

class procedure TioEtmEngine.DiffToStream(const ATargetStream: TStream; const ANewestTimeSlot, AOldestTimeSlot: TioEtmCustomTimeSlot; const ADiffMode: TioEtmDiffMode; const AMoreInfo: Boolean);
var
  LDiff: String;
  LStringStream: TStringStream;
begin
  LDiff := Diff(ANewestTimeSlot, AOldestTimeSlot, ADiffMode, AMoreInfo);
  LStringStream := TStringStream.Create(LDiff, TEncoding.UTF8);
  try
    ATargetStream.CopyFrom(LStringStream);
  finally
    LStringStream.Free;
  end;
end;

class procedure TioEtmEngine.DiffToStream(const ATargetStream: TStream; const ANewestObj: TObject; const AOldestTimeSlot: TioEtmCustomTimeSlot; const ADiffMode: TioEtmDiffMode; const AMoreInfo: Boolean);
var
  LDiff: String;
  LStringStream: TStringStream;
begin
  LDiff := Diff(ANewestObj, AOldestTimeSlot, ADiffMode, AMoreInfo);
  LStringStream := TStringStream.Create(LDiff, TEncoding.UTF8);
  try
    ATargetStream.CopyFrom(LStringStream);
  finally
    LStringStream.Free;
  end;
end;

class procedure TioEtmEngine.DiffToFile(const AFileName: String; const ANewestTimeSlot, AOldestTimeSlot: TioEtmCustomTimeSlot;
  const ADiffMode: TioEtmDiffMode; const AMoreInfo: Boolean);
var
  LFileStream: TFileStream;
begin
  LFileStream := TFileStream.Create(AFileName, fmCreate);
  try
    DiffToStream(LFileStream, ANewestTimeSlot, AOldestTimeSlot, ADiffMode, AMoreInfo);
  finally
    LFileStream.Free;
  end;
end;

class procedure TioEtmEngine.DiffToFile(const AFileName: String; const ANewestObj: TObject; const AOldestTimeSlot: TioEtmCustomTimeSlot;
  const ADiffMode: TioEtmDiffMode; const AMoreInfo: Boolean);
var
  LFileStream: TFileStream;
begin
  LFileStream := TFileStream.Create(AFileName, fmCreate);
  try
    DiffToStream(LFileStream, ANewestObj, AOldestTimeSlot, ADiffMode, AMoreInfo);
  finally
    LFileStream.Free;
  end;
end;

class procedure TioEtmEngine.DiffToFile(const AFileName: String; const ANewestIntf: IInterface; const AOldestTimeSlot: TioEtmCustomTimeSlot;
  const ADiffMode: TioEtmDiffMode; const AMoreInfo: Boolean);
var
  LFileStream: TFileStream;
begin
  LFileStream := TFileStream.Create(AFileName, fmCreate);
  try
    DiffToStream(LFileStream, ANewestIntf, AOldestTimeSlot, ADiffMode, AMoreInfo);
  finally
    LFileStream.Free;
  end;
end;

class procedure TioEtmEngine.DiffToStream(const ATargetStream: TStream; const ANewestIntf: IInterface; const AOldestTimeSlot: TioEtmCustomTimeSlot; const ADiffMode: TioEtmDiffMode; const AMoreInfo: Boolean);
var
  LDiff: String;
  LStringStream: TStringStream;
begin
  LDiff := Diff(ANewestIntf, AOldestTimeSlot, ADiffMode, AMoreInfo);
  LStringStream := TStringStream.Create(LDiff, TEncoding.UTF8);
  try
    ATargetStream.CopyFrom(LStringStream);
  finally
    LStringStream.Free;
  end;
end;

class function TioEtmEngine.FluentTimelineFor(const AIntf: IInterface): IioWhere<TioEtmCustomTimeSlot>;
begin
  Result := _InternalBuildTimeLineWhere((AIntf as TObject).ClassName);
end;

class function TioEtmEngine.FluentTimelineFor(const AObj: TObject): IioWhere<TioEtmCustomTimeSlot>;
begin
  Result := _InternalBuildTimeLineWhere(AObj.ClassName);
end;

class procedure TioEtmEngine.TraceByMap(const AMap: IioMap; const AEtmTimeSlotClass: TioEtmTimeSlotRef; const ATraceOnlyOnConnectionName: String = '');
begin
  // Check Map and TimeSlot class
  if not Assigned(AMap) then
    raise EioEtmException.Create(ClassName, 'TraceByMap', '"AMap" parameter cannot be nil.');
  if not Assigned(AEtmTimeSlotClass) then
    raise EioEtmException.Create(ClassName, 'TraceByMap', '"AEtmTimeSlotClass" parameter cannot be nil.');
  // A TioObjVersion field is mandatory
  if not AMap.GetProperties.ObjVersionPropertyExist then
    raise EioEtmException.Create(ClassName, 'TraceByMap',
      Format('Hello, I''m iORM, I''m sorry but there is a problem.' +
      #13#13'I''m trying to register the class "%s" in the ETM (Entity Time Machine) subsystem but it doesn''t have a field of type "TioObjVersion".' +
      #13#13'Please add a field/property of type "TioObjVersion" and try again, everything will be fine.', [AMap.GetClassName]));
  // Set destination ETM TimeSlot into the map
  AMap.GetTable.EtmTimeSlotClass := AEtmTimeSlotClass;
  AMap.GetTable.EtmTraceOnlyOnConnectionName := ATraceOnlyOnConnectionName;
  // Register the ETMInterceptor for this class & connection
  io.CRUDInterceptors.RegisterInterceptor(TioEtmInterceptor, AMap.GetClassName, ATraceOnlyOnConnectionName);
end;

class procedure TioEtmEngine.Trace<T>(const AEtmTimeSlotClass: TioEtmTimeSlotRef; const ATraceOnlyOnConnectionName: String = '');
begin
  TraceByMap(TioMapContainer.GetMap(T.ClassName), AEtmTimeSlotClass, ATraceOnlyOnConnectionName);
end;

class procedure TioEtmEngine.Untrace<T>(const ATraceOnlyOnConnectionName: String);
begin
  io.CRUDInterceptors.UnregisterInterceptor(TioEtmInterceptor, TioUtilities.GenericToString<T>, ATraceOnlyOnConnectionName);
end;

end.

