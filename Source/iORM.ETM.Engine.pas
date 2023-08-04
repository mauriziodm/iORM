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
  *************************************************************************************************************************************
  * NOTE: TioEtmCustomRepository base class for all EtmRepositories is declared in iORM.Attributes unit to avoid circular refeference *
  * NOTE: TioEtmCustomRepository base class for all EtmRepositories is declared in iORM.Attributes unit to avoid circular refeference *
  * NOTE: TioEtmCustomRepository base class for all EtmRepositories is declared in iORM.Attributes unit to avoid circular refeference *
  *************************************************************************************************************************************
}
unit iORM.ETM.Engine;

interface

uses
  System.Classes, System.Generics.Collections, iORM.Where.Interfaces,
  iORM.Context.Map.Interfaces, iORM.Attributes, System.JSON,
  iORM.ETM.Interfaces;

type

  TioEtmEngineRef = class of TioEtmEngine;

  TioEtmEngine = class
  private
    class function _InternalGetMap(const AEntityClassName: String): IioMap;
    class function _InternalBuildTimeLineWhere(const AEntityClassName: String): IioWhere<TioEtmCustomRepository>;
    class function _InternalTimeTravelFor(const AEntityClassName: String; const AEntityID: Integer; const AWhere: IioWhere = nil)
      : TObjectList<TioEtmCustomRepository>; overload;
    class function _InternalBuildRevertWhere(const AEntityClassName: String; const AEntityID: Integer; const AEntityVersion: Integer)
      : IioWhere<TioEtmCustomRepository>;
    class procedure _ObjVersionToNegative(const AObj: TObject);
    class procedure _CheckRepositoryItem(const AEtmRepositoryItem: TioEtmCustomRepository; const ATargetClassName: String = '');
    class function _InternalDiffAsJsonObject(const ANewestVersionObj, AOldestVersionObj: TObject; const ADiffMode: TioEtmDiffMode; const AIncludeInfo: Boolean = True): TJSONObject; overload;
  public
    // Fluent interface
    class function FluentTimeLineFor<T: class>: IioWhere<TioEtmCustomRepository>; overload;
    class function FluentTimeLineFor(const AClassName: String): IioWhere<TioEtmCustomRepository>; overload;
    class function FluentTimeLineFor(const AObj: TObject): IioWhere<TioEtmCustomRepository>; overload;
    class function FluentTimeLineFor(const AIntf: IInterface): IioWhere<TioEtmCustomRepository>; overload;
    // Non fluent interface
    class function TimeLineFor<T: class>(const AEntityID: Integer; const AWhere: IioWhere = nil): TObjectList<TioEtmCustomRepository>; overload;
    class function TimeLineFor(const AClassName: String; const AEntityID: Integer; const AWhere: IioWhere = nil)
      : TObjectList<TioEtmCustomRepository>; overload;
    class function TimeLineFor(const AObj: TObject; const AWhere: IioWhere = nil): TObjectList<TioEtmCustomRepository>; overload;
    class function TimeLineFor(const AIntf: IInterface; const AWhere: IioWhere = nil): TObjectList<TioEtmCustomRepository>; overload;
    // Revert
    class function RevertObject(const AEtmRepositoryItem: TioEtmCustomRepository; const APersistImmediately: Boolean = False): TObject; overload;
    class function RevertObject<T: class>(const AEtmRepositoryItem: TioEtmCustomRepository; const APersistImmediately: Boolean = False): T; overload;
    // RevertToObject
    class procedure RevertToObject(const ATargetObj: TObject; const AEtmRepositoryItem: TioEtmCustomRepository; const APersistImmediately: Boolean = False); overload;
    class procedure RevertToObject(const ATargetIntf: IInterface; const AEtmRepositoryItem: TioEtmCustomRepository; const APersistImmediately: Boolean = False); overload;
    // RevertToDB
    class procedure RevertToDB(const AEtmRepositoryItem: TioEtmCustomRepository); overload;
    // Trace
    class procedure TraceByMap(const AMap: IioMap; const AEtmRepositoryClass: TioEtmCustomRepositoryRef; const ATraceOnlyOnConnectionName: String = '');
    class procedure Trace<T: class>(const AEtmRepositoryClass: TioEtmCustomRepositoryRef; const ATraceOnlyOnConnectionName: String = '');
    // Untrace
    class procedure Untrace<T: class>(const ATraceOnlyOnConnectionName: String = '');
    // DiffAsJsonObject
    class function DiffAsJsonObject(const ANewestRepositoriItem, AOldestRepositoryItem: TioEtmCustomRepository; const ADiffMode: TioEtmDiffMode; const AIncludeInfo: Boolean = True): TJSONObject; overload;
    class function DiffAsJsonObject(const ANewestObj: TObject; const AOldestRepositoryItem: TioEtmCustomRepository; const ADiffMode: TioEtmDiffMode; const AIncludeInfo: Boolean = True): TJSONObject; overload;
    class function DiffAsJsonObject(const ANewestIntf: IInterface; const AOldestRepositoryItem: TioEtmCustomRepository; const ADiffMode: TioEtmDiffMode; const AIncludeInfo: Boolean = True): TJSONObject; overload;
    // DiffToStream
    class procedure DiffToStream(const ATargetStream: TStream; const ANewestRepositoryItem, AOldestRepositoryItem: TioEtmCustomRepository; const ADiffMode: TioEtmDiffMode; const AIncludeInfo: Boolean = True); overload;
    class procedure DiffToStream(const ATargetStream: TStream; const ANewestObj: TObject; const AOldestRepositoryItem: TioEtmCustomRepository; const ADiffMode: TioEtmDiffMode; const AIncludeInfo: Boolean = True); overload;
    class procedure DiffToStream(const ATargetStream: TStream; const ANewestIntf: IInterface; const AOldestRepositoryItem: TioEtmCustomRepository; const ADiffMode: TioEtmDiffMode; const AIncludeInfo: Boolean = True) overload;
    // DiffToFile
    class procedure DiffToFile(const AFileName: String; const ANewestRepositoryItem, AOldestRepositoryItem: TioEtmCustomRepository; const ADiffMode: TioEtmDiffMode; const AIncludeInfo: Boolean = True); overload;
    class procedure DiffToFile(const AFileName: String; const ANewestObj: TObject; const AOldestRepositoryItem: TioEtmCustomRepository; const ADiffMode: TioEtmDiffMode; const AIncludeInfo: Boolean = True); overload;
    class procedure DiffToFile(const AFileName: String; const ANewestIntf: IInterface; const AOldestRepositoryItem: TioEtmCustomRepository; const ADiffMode: TioEtmDiffMode; const AIncludeInfo: Boolean = True) overload;
    // Diff
    class function Diff(const ANewestRepositoriItem, AOldestRepositoryItem: TioEtmCustomRepository; const ADiffMode: TioEtmDiffMode; const AIncludeInfo: Boolean = True): String; overload;
    class function Diff(const ANewestObj: TObject; const AOldestRepositoryItem: TioEtmCustomRepository; const ADiffMode: TioEtmDiffMode; const AIncludeInfo: Boolean = True): String; overload;
    class function Diff(const ANewestIntf: IInterface; const AOldestRepositoryItem: TioEtmCustomRepository; const ADiffMode: TioEtmDiffMode; const AIncludeInfo: Boolean = True): String; overload;
  end;

implementation

uses
  iORM, iORM.Utilities, iORM.CommonTypes, iORM.Exceptions, System.SysUtils,
  iORM.ETM.Interceptor, iORM.Context.Factory, iORM.Context.Container, DJSON,
  iORM.Context.Interfaces, iORM.ETM.Factory;

{ TIoEtmEngine }

class function TioEtmEngine._InternalGetMap(const AEntityClassName: String): IioMap;
begin
  Result := TioMapContainer.GetMap(AEntityClassName);
  if not Assigned(Result.GetTable.GetEtmRepositoryClass) then
    raise EioEtmException.Create(ClassName, '_InternalGetMap',
      Format('Hi, I''m iORM, listen to me.' + #13#13'The class "%s" is not registered in the ETM (Entity Time Machine) subsystem.' +
      #13#13'You can register the class "%s" decorating its declaration with the attribute "[etmTrace(ARepositoryClass)]" or by code with a line like "io.etm.Trace<%s>(ARepositoryClass)".'
      + #13#13'The "ARepositoryClass" parameter is the repository class that you will need to have previously declared descending it from the "TioEtmCustomRepository" base class provided by me (iORM).'
      + #13#13'You''ll see it works.', [AEntityClassName, AEntityClassName, AEntityClassName]));
end;

class procedure TioEtmEngine._CheckRepositoryItem(const AEtmRepositoryItem: TioEtmCustomRepository; const ATargetClassName: String = '');
begin
  // Check repository class
  if not Assigned(AEtmRepositoryItem) then
    raise EioEtmException.Create(ClassName, 'Revert', '"AEtmRepositoryItem" parameter cannot be nil.');
  // Delete operation has no state
  if AEtmRepositoryItem.EventType = etDelete then
    raise EioEtmException.Create(ClassName, 'Revert', Format('Hi, I''m iORM, I have to tell you an important thing.' +
      #13#13'Revert is not allowed for "Delete" type operations because they have no information about the state to restore.' +
      #13#13'The attempt to restore the entity of type "%s" ID %d version %d has failed.', [AEtmRepositoryItem.EntityClassName, AEtmRepositoryItem.EntityID,
      AEtmRepositoryItem.EntityVersion]));
  // Type check
  if (not ATargetClassName.IsEmpty) and (AEtmRepositoryItem.EntityClassName <> ATargetClassName) then
    raise EioEtmException.Create(ClassName, 'Revert',
      Format('Houston we have a problem.' +
      #13#13'The type of the entity you asked me to revert and the one contained in the provided repositoryItem do not match.' +
      #13#13'I can''t restore the state of type "%s" ID %d version %d to an object of type "%s".', [AEtmRepositoryItem.EntityClassName,
      AEtmRepositoryItem.EntityID, AEtmRepositoryItem.EntityVersion, ATargetClassName]));
end;

class function TioEtmEngine._InternalBuildRevertWhere(const AEntityClassName: String; const AEntityID: Integer; const AEntityVersion: Integer)
  : IioWhere<TioEtmCustomRepository>;
var
  LMap: IioMap;
begin
  LMap := _InternalGetMap(AEntityClassName);
  Result := io.Where<TioEtmCustomRepository>('EntityClassName', coEquals, AEntityClassName)._And('EntityID', coEquals, AEntityID)
    ._And('EntityVersion', coEquals, AEntityVersion);
  Result.TypeName := LMap.GetTable.GetEtmRepositoryClass.ClassName;
end;

class function TioEtmEngine._InternalBuildTimeLineWhere(const AEntityClassName: String): IioWhere<TioEtmCustomRepository>;
var
  LMap: IioMap;
begin
  LMap := _InternalGetMap(AEntityClassName);
  Result := io.Where<TioEtmCustomRepository>('EntityClassName', coEquals, AEntityClassName)._OrderBy('[.EntityVersion]');
  Result.TypeName := LMap.GetTable.GetEtmRepositoryClass.ClassName;
end;

class function TioEtmEngine._InternalTimeTravelFor(const AEntityClassName: String; const AEntityID: Integer; const AWhere: IioWhere = nil)
  : TObjectList<TioEtmCustomRepository>;
var
  LWhere: IioWhere<TioEtmCustomRepository>;
begin
  LWhere := _InternalBuildTimeLineWhere(AEntityClassName);
  Result := LWhere._And(AWhere)._OrderBy('[.DateAndTime]').ToGenericList.OfType<TObjectList<TioEtmCustomRepository>>;
end;

class procedure TioEtmEngine._ObjVersionToNegative(const AObj: TObject);
var
  LContext: IioContext;
begin
  LContext := TioContextFactory.Context(AObj.ClassName, nil, AObj, nil, '', '');
  if LContext.ObjVersion > 0 then
    LContext.ObjVersion := -LContext.ObjVersion;
end;

class function TioEtmEngine.TimeLineFor(const AClassName: String; const AEntityID: Integer; const AWhere: IioWhere): TObjectList<TioEtmCustomRepository>;
begin
  Result := _InternalTimeTravelFor(AClassName, AEntityID, AWhere);
end;

class function TioEtmEngine.TimeLineFor<T>(const AEntityID: Integer; const AWhere: IioWhere): TObjectList<TioEtmCustomRepository>;
begin
  Result := _InternalTimeTravelFor(T.ClassName, AEntityID, AWhere);
end;

class function TioEtmEngine.TimeLineFor(const AIntf: IInterface; const AWhere: IioWhere): TObjectList<TioEtmCustomRepository>;
begin
  Result := _InternalTimeTravelFor((AIntf as TObject).ClassName, TioUtilities.ExtractOID(AIntf), AWhere);
end;

class function TioEtmEngine.TimeLineFor(const AObj: TObject; const AWhere: IioWhere): TObjectList<TioEtmCustomRepository>;
begin
  Result := _InternalTimeTravelFor(AObj.ClassName, TioUtilities.ExtractOID(AObj), AWhere);
end;

class function TioEtmEngine.FluentTimeLineFor(const AClassName: String): IioWhere<TioEtmCustomRepository>;
begin
  Result := _InternalBuildTimeLineWhere(AClassName);
end;

class function TioEtmEngine.FluentTimeLineFor<T>: IioWhere<TioEtmCustomRepository>;
begin
  Result := _InternalBuildTimeLineWhere(T.ClassName);
end;

class function TioEtmEngine.RevertObject(const AEtmRepositoryItem: TioEtmCustomRepository; const APersistImmediately: Boolean): TObject;
begin
  // Check repository item
  _CheckRepositoryItem(AEtmRepositoryItem, String.Empty);
  // Revert
  Result := dj.FromJson(AEtmRepositoryItem.EntityState).OpType(ssETM).byFields.ClearCollection.TypeAnnotationsON.ToObject;
  // The entity's ObjVersion property is reset with a negative value to indicate that it has been reset by the ETM
  _ObjVersionToNegative(Result);
  // Persist immediately
  if APersistImmediately then
    io.PersistObject(Result);
end;

class procedure TioEtmEngine.RevertToObject(const ATargetIntf: IInterface; const AEtmRepositoryItem: TioEtmCustomRepository;
  const APersistImmediately: Boolean);
begin
  RevertToObject(ATargetIntf as TObject, AEtmRepositoryItem);
end;

class function TioEtmEngine.RevertObject<T>(const AEtmRepositoryItem: TioEtmCustomRepository; const APersistImmediately: Boolean = False): T;
begin
  // Check repository item
  _CheckRepositoryItem(AEtmRepositoryItem, T.ClassName);
  // Revert
  Result := dj.FromJson(AEtmRepositoryItem.EntityState).OpType(ssETM).byFields.ClearCollection.TypeAnnotationsON.&To<T>;
  // The entity's ObjVersion property is reset with a negative value to indicate that it has been reset by the ETM
  _ObjVersionToNegative(Result);
  // Persist immediately
  if APersistImmediately then
    io.PersistObject(Result);
end;

class procedure TioEtmEngine.RevertToObject(const ATargetObj: TObject; const AEtmRepositoryItem: TioEtmCustomRepository; const APersistImmediately: Boolean);
begin
  // Check repository item
  _CheckRepositoryItem(AEtmRepositoryItem, ATargetObj.ClassName);
  // Revert
  dj.FromJson(AEtmRepositoryItem.EntityState).OpType(ssETM).byFields.ClearCollection.TypeAnnotationsON.&To(ATargetObj);
  // The entity's ObjVersion property is reset with a negative value to indicate that it has been reset by the ETM
  _ObjVersionToNegative(ATargetObj);
  // Persist immediately
  if APersistImmediately then
    io.PersistObject(ATargetObj);
end;

class procedure TioEtmEngine.RevertToDB(const AEtmRepositoryItem: TioEtmCustomRepository);
var
  LObj: TObject;
begin
  // Check repository item
  _CheckRepositoryItem(AEtmRepositoryItem);
  // Revert
  LObj := dj.FromJson(AEtmRepositoryItem.EntityState).OpType(ssETM).byFields.ClearCollection.TypeAnnotationsON.ToObject;
  try
    // The entity's ObjVersion property is reset with a negative value to indicate that it has been reset by the ETM
    _ObjVersionToNegative(LObj);
    // Persist immediately
    io.PersistObject(LObj);
  finally
    LObj.Free;
  end;
end;

class function TioEtmEngine._InternalDiffAsJsonObject(const ANewestVersionObj, AOldestVersionObj: TObject; const ADiffMode: TioEtmDiffMode; const AIncludeInfo: Boolean)
  : TJSONObject;
begin
  // Check instances
  if (not Assigned(ANewestVersionObj)) or (not Assigned(AOldestVersionObj)) then
    raise EioEtmException.Create(ClassName, 'DiffAsJsonObject', '"ANewestVersionObj" and "AOldestVersionObj" parameters must be assigned.');
  // Get the differences
  Result := TioEtmFactory.Diff(ADiffMode).Diff(AOldestVersionObj, ANewestVersionObj, AIncludeInfo);
end;

class function TioEtmEngine.DiffAsJsonObject(const ANewestRepositoriItem, AOldestRepositoryItem: TioEtmCustomRepository;
  const ADiffMode: TioEtmDiffMode; const AIncludeInfo: Boolean): TJSONObject;
var
  LNewestObject, LOldestObject: TObject;
begin
  // Init
  LNewestObject := nil;
  LOldestObject := nil;
  // Check repository items
  _CheckRepositoryItem(ANewestRepositoriItem);
  _CheckRepositoryItem(AOldestRepositoryItem);
  try
    // Get objects from the repository items
    LNewestObject := dj.FromJson(ANewestRepositoriItem.EntityState).OpType(ssETM).byFields.ClearCollection.TypeAnnotationsON.ToObject;
    LOldestObject := dj.FromJson(ANewestRepositoriItem.EntityState).OpType(ssETM).byFields.ClearCollection.TypeAnnotationsON.ToObject;
    // Diff
    Result := _InternalDiffAsJsonObject(LNewestObject, LOldestObject, ADiffMode, AIncludeInfo);
  finally
    if Assigned(LNewestObject) then
      LNewestObject.Free;
    if Assigned(LOldestObject) then
      LOldestObject.Free;
  end;
end;

class function TioEtmEngine.DiffAsJsonObject(const ANewestObj: TObject; const AOldestRepositoryItem: TioEtmCustomRepository; const ADiffMode: TioEtmDiffMode; const AIncludeInfo: Boolean = True): TJSONObject;
var
  LOldestObj: TObject;
begin
  // Init
  LOldestObj := nil;
  // Checks
  _CheckRepositoryItem(AOldestRepositoryItem);
  if not Assigned(ANewestObj) then
    raise EioEtmException.Create(ClassName, 'DiffAsJsonObject', '"ANewestVersionObj"  parameter must be assigned.');
  try
    // Get oldest object from the oldest repository item
    LOldestObj := dj.FromJson(AOldestRepositoryItem.EntityState).OpType(ssETM).byFields.ClearCollection.TypeAnnotationsON.ToObject;
    // Diff
    Result := _InternalDiffAsJsonObject(ANewestObj, LOldestObj, ADiffMode, AIncludeInfo);
  finally
    if Assigned(LOldestObj) then
      LOldestObj.Free;
  end;
end;

class function TioEtmEngine.Diff(const ANewestRepositoriItem, AOldestRepositoryItem: TioEtmCustomRepository; const ADiffMode: TioEtmDiffMode;
  const AIncludeInfo: Boolean): String;
var
  LDiffJsonObj: TJSONObject;
begin
  LDiffJsonObj := DiffAsJsonObject(ANewestRepositoriItem, AOldestRepositoryItem, ADiffMode, AIncludeInfo);
  try
    Result := LDiffJsonObj.Format;
  finally
    LDiffJsonObj.Free;
  end;
end;

class function TioEtmEngine.Diff(const ANewestObj: TObject; const AOldestRepositoryItem: TioEtmCustomRepository; const ADiffMode: TioEtmDiffMode;
  const AIncludeInfo: Boolean): String;
var
  LDiffJsonObj: TJSONObject;
begin
  LDiffJsonObj := DiffAsJsonObject(ANewestObj, AOldestRepositoryItem, ADiffMode, AIncludeInfo);
  try
    Result := LDiffJsonObj.Format;
  finally
    LDiffJsonObj.Free;
  end;
end;

class function TioEtmEngine.Diff(const ANewestIntf: IInterface; const AOldestRepositoryItem: TioEtmCustomRepository; const ADiffMode: TioEtmDiffMode;
  const AIncludeInfo: Boolean): String;
var
  LDiffJsonObj: TJSONObject;
begin
  LDiffJsonObj := DiffAsJsonObject(ANewestIntf, AOldestRepositoryItem, ADiffMode, AIncludeInfo);
  try
    Result := LDiffJsonObj.Format;
  finally
    LDiffJsonObj.Free;
  end;
end;

class function TioEtmEngine.DiffAsJsonObject(const ANewestIntf: IInterface; const AOldestRepositoryItem: TioEtmCustomRepository;
  const ADiffMode: TioEtmDiffMode; const AIncludeInfo: Boolean): TJSONObject;
begin
  Result := DiffAsJsonObject(ANewestIntf as TObject, AOldestRepositoryItem, ADiffMode, AIncludeInfo);
end;

class procedure TioEtmEngine.DiffToStream(const ATargetStream: TStream; const ANewestRepositoryItem, AOldestRepositoryItem: TioEtmCustomRepository; const ADiffMode: TioEtmDiffMode; const AIncludeInfo: Boolean);
var
  LDiff: String;
  LStringStream: TStringStream;
begin
  LDiff := Diff(ANewestRepositoryItem, AOldestRepositoryItem, ADiffMode, AIncludeInfo);
  LStringStream := TStringStream.Create(LDiff, TEncoding.UTF8);
  try
    ATargetStream.CopyFrom(LStringStream);
  finally
    LStringStream.Free;
  end;
end;

class procedure TioEtmEngine.DiffToStream(const ATargetStream: TStream; const ANewestObj: TObject; const AOldestRepositoryItem: TioEtmCustomRepository; const ADiffMode: TioEtmDiffMode; const AIncludeInfo: Boolean);
var
  LDiff: String;
  LStringStream: TStringStream;
begin
  LDiff := Diff(ANewestObj, AOldestRepositoryItem, ADiffMode, AIncludeInfo);
  LStringStream := TStringStream.Create(LDiff, TEncoding.UTF8);
  try
    ATargetStream.CopyFrom(LStringStream);
  finally
    LStringStream.Free;
  end;
end;

class procedure TioEtmEngine.DiffToFile(const AFileName: String; const ANewestRepositoryItem, AOldestRepositoryItem: TioEtmCustomRepository;
  const ADiffMode: TioEtmDiffMode; const AIncludeInfo: Boolean);
var
  LFileStream: TFileStream;
begin
  LFileStream := TFileStream.Create(AFileName, fmCreate);
  try
    DiffToStream(LFileStream, ANewestRepositoryItem, AOldestRepositoryItem, ADiffMode, AIncludeInfo);
  finally
    LFileStream.Free;
  end;
end;

class procedure TioEtmEngine.DiffToFile(const AFileName: String; const ANewestObj: TObject; const AOldestRepositoryItem: TioEtmCustomRepository;
  const ADiffMode: TioEtmDiffMode; const AIncludeInfo: Boolean);
var
  LFileStream: TFileStream;
begin
  LFileStream := TFileStream.Create(AFileName, fmCreate);
  try
    DiffToStream(LFileStream, ANewestObj, AOldestRepositoryItem, ADiffMode, AIncludeInfo);
  finally
    LFileStream.Free;
  end;
end;

class procedure TioEtmEngine.DiffToFile(const AFileName: String; const ANewestIntf: IInterface; const AOldestRepositoryItem: TioEtmCustomRepository;
  const ADiffMode: TioEtmDiffMode; const AIncludeInfo: Boolean);
var
  LFileStream: TFileStream;
begin
  LFileStream := TFileStream.Create(AFileName, fmCreate);
  try
    DiffToStream(LFileStream, ANewestIntf, AOldestRepositoryItem, ADiffMode, AIncludeInfo);
  finally
    LFileStream.Free;
  end;
end;

class procedure TioEtmEngine.DiffToStream(const ATargetStream: TStream; const ANewestIntf: IInterface; const AOldestRepositoryItem: TioEtmCustomRepository; const ADiffMode: TioEtmDiffMode; const AIncludeInfo: Boolean);
var
  LDiff: String;
  LStringStream: TStringStream;
begin
  LDiff := Diff(ANewestIntf, AOldestRepositoryItem, ADiffMode, AIncludeInfo);
  LStringStream := TStringStream.Create(LDiff, TEncoding.UTF8);
  try
    ATargetStream.CopyFrom(LStringStream);
  finally
    LStringStream.Free;
  end;
end;

class function TioEtmEngine.FluentTimeLineFor(const AIntf: IInterface): IioWhere<TioEtmCustomRepository>;
begin
  Result := _InternalBuildTimeLineWhere((AIntf as TObject).ClassName);
end;

class function TioEtmEngine.FluentTimeLineFor(const AObj: TObject): IioWhere<TioEtmCustomRepository>;
begin
  Result := _InternalBuildTimeLineWhere(AObj.ClassName);
end;

class procedure TioEtmEngine.TraceByMap(const AMap: IioMap; const AEtmRepositoryClass: TioEtmCustomRepositoryRef;
  const ATraceOnlyOnConnectionName: String = '');
begin
  // Check Map and EtmRepositoryClass
  if not Assigned(AMap) then
    raise EioEtmException.Create(ClassName, 'TraceByMap', '"AMap" parameter cannot be nil.');
  if not Assigned(AEtmRepositoryClass) then
    raise EioEtmException.Create(ClassName, 'TraceByMap', '"AEtmRepositoryClass" parameter cannot be nil.');
  // A TioObjVersion field is mandatory
  if not AMap.GetProperties.ObjVersionPropertyExist then
    raise EioEtmException.Create(ClassName, 'TraceByMap',
      Format('Hello, I''m iORM, I''m sorry but there is a problem.' +
      #13#13'I''m trying to register the class "%s" in the ETM (Entity Time Machine) subsystem but it doesn''t have a field of type "TioObjVersion".' +
      #13#13'Please add a field/property of type "TioObjVersion" and try again, everything will be fine.', [AMap.GetClassName]));
  // Set destination ETM repository into the map
  AMap.GetTable.EtmRepositoryClass := AEtmRepositoryClass;
  AMap.GetTable.EtmTraceOnlyOnConnectionName := ATraceOnlyOnConnectionName;
  // Register the ETMInterceptor for this class & connection
  io.CRUDInterceptors.RegisterInterceptor(TioEtmInterceptor, AMap.GetClassName, ATraceOnlyOnConnectionName);
end;

class procedure TioEtmEngine.Trace<T>(const AEtmRepositoryClass: TioEtmCustomRepositoryRef; const ATraceOnlyOnConnectionName: String = '');
begin
  TraceByMap(TioMapContainer.GetMap(T.ClassName), AEtmRepositoryClass, ATraceOnlyOnConnectionName);
end;

class procedure TioEtmEngine.Untrace<T>(const ATraceOnlyOnConnectionName: String);
begin
  io.CRUDInterceptors.UnregisterInterceptor(TioEtmInterceptor, TioUtilities.GenericToString<T>, ATraceOnlyOnConnectionName);
end;

end.
