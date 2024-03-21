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
unit iORM.SynchroStrategy.EtmBased;

interface

uses
  iORM.SynchroStrategy.Custom, iORM.Context.Interfaces, iORM.Attributes,
  iORM.SynchroStrategy.Interfaces, iORM.Where.Interfaces, System.Classes,
  System.Generics.Collections;

type

  [ioEntity('SYNCHRO_LOG')]
  TioEtmSynchroStrategy_LogItem = class(TioCustomSynchroStrategy_LogItem)
  strict private
    FEtmTimeSlotClassName: String;
    // Count
    FCliToSrv_TimeSlotID_From: Integer;
    FCliToSrv_TimeSlotID_To: Integer;
    FSrvToCli_TimeSlotID_From: Integer;
    FSrvToCli_TimeSlotID_To: Integer;
  public
    constructor Create; override;
    property EtmTimeSlotClassName: String read FEtmTimeSlotClassName write FEtmTimeSlotClassName;
    // COunt
    property CliToSrv_TimeSlotID_From: Integer read FCliToSrv_TimeSlotID_From write FCliToSrv_TimeSlotID_From;
    property CliToSrv_TimeSlotID_To: Integer read FCliToSrv_TimeSlotID_To write FCliToSrv_TimeSlotID_To;
    property SrvToCli_TimeSlotID_From: Integer read FSrvToCli_TimeSlotID_From write FSrvToCli_TimeSlotID_From;
    property SrvToCli_TimeSlotID_To: Integer read FSrvToCli_TimeSlotID_To write FSrvToCli_TimeSlotID_To;
  end;

  TioEtmSynchroStrategy_TempIdContainerItem = class
  strict private
    FEntityClassName: String;
    FNewID: Integer;
    FOldID: Integer;
  public
    constructor Create(const AEntityClassName: String; const AOldID, ANewID: Integer);
    property EntityClassName: String read FEntityClassName;
    property NewID: Integer read FNewID write FNewID;
    property OldID: Integer read FOldID;
  end;

  TioEtmSynchroStrategy_TempIdContainer = class
  strict private
    FInternalContainer: TObjectList<TioEtmSynchroStrategy_TempIdContainerItem>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(const AEntityClassName: String; const AOldID, ANewID: Integer);
    function Contains(const AEntityClassName: String; const AOldID: Integer): Boolean;
    function GetNewID(const AEntityClassName: String; const AOldID: Integer): Integer;
    procedure DeleteObjectsWithTemporaryID;
    procedure UpdateEtmTimeSlotsWithTemporaryID(const AEtmTimeSlotClassname: String);
  end;

  TioEtmSynchroStrategy_Payload = class(TioCustomSynchroStrategy_Payload)
  strict private
    FEtmTimeSlotClassName: String;
    FPayloadData: TioEtmTimeline;
    FTempIdContainer: TioEtmSynchroStrategy_TempIdContainer;
    procedure _BuildBlackAndWhiteListWhere(const AWhere: IioWhere);
    procedure _ClearPayloadData;
    procedure _InternalPersistObjToServer(const AObj: TObject);
  strict protected
    // ---------- Methods to override on descendant classes ----------
    // SynchroLogItem
    procedure _DoOldSynchroLogItem_LoadFromClient; override;
    procedure _DoNewSynchroLogItem_Create; override;
    procedure _DoNewSynchroLogItem_Initialize; override;
    // Payload
    procedure _DoLoadPayloadFromClient; override;
    procedure _DoPersistPayloadToServer; override;
    procedure _DoReloadPayloadFromServer; override;
    procedure _DoPersistPayloadToClient; override;
    procedure _DoFinalizePayload; override;
    // ---------- Methods to override on descendant classes ----------
  public
    constructor Create; override;
    destructor Destroy; override;
    property EtmTimeSlotClassName: String read FEtmTimeSlotClassName write FEtmTimeSlotClassName;
  end;

  TioEtmSynchroStrategy_Client = class(TioCustomSynchroStrategy_Client)
  strict private
    FEtmTimeSlot_ClassName: String;
    procedure _CheckEtmTimeSlotClassName;
    // EtmTimeSlot_ClassName
    procedure SetEtmTimeSlot_ClassName(const Value: String);
  strict protected
    // ---------- Synchro strategy methods to override on descendant classes ----------
    function _DoGenerateLocalID(const AContext: IioContext): Integer; override;
    function _DoPayload_Create: TioCustomSynchroStrategy_Payload; override;
    procedure _DoPayload_Initialize(const APayload: TioCustomSynchroStrategy_Payload; const ASynchroLevel: TioSynchroLevel); override;
    // ---------- Synchro strategy methods to override on descendant classes ----------
  public
    constructor Create(AOwner: TComponent); override;
  published
    property Async;
    property Entities_BlackList;
    property Entities_WhiteList;
    property EtmTimeSlot_ClassName: String read FEtmTimeSlot_ClassName write SetEtmTimeSlot_ClassName;
    property EtmTimeSlot_Delete_SentToServer default True;
    property EtmTimeSlot_Persist_ReceivedFromServer default False;
    property EtmTimeSlot_Persist_Regular default False;
    property EtmTimeSlot_Persist_ToBeSynchronized default True;
    property EtmTimeSlot_Update_SentToServer default False;
    property SynchroName;
    property TargetConnectionDef;
  end;

implementation

uses
  iORM.CommonTypes, iORM, System.SysUtils,
  iORM.DB.Interfaces, iORM.DB.Factory, iORM.Exceptions,
  iORM.Context.Map.Interfaces, iORM.Context.Container,
  iORM.DB.ConnectionContainer;

{ TioEtmBasetSynchroStrategy_LogItem }

constructor TioEtmSynchroStrategy_LogItem.Create;
begin
  inherited;
  FEtmTimeSlotClassName := String.Empty;
  // Count
  FCliToSrv_TimeSlotID_From := IO_INTEGER_NULL_VALUE;
  FCliToSrv_TimeSlotID_To := IO_INTEGER_NULL_VALUE;
  FSrvToCli_TimeSlotID_From := IO_INTEGER_NULL_VALUE;
  FSrvToCli_TimeSlotID_To := IO_INTEGER_NULL_VALUE;
end;

{ TioEtmBasedSynchroStrategy_Payload }

constructor TioEtmSynchroStrategy_Payload.Create;
begin
  inherited;
  FEtmTimeSlotClassName := String.Empty;
  FPayloadData := TioEtmTimeline.Create;
  FTempIdContainer := TioEtmSynchroStrategy_TempIdContainer.Create;
end;

destructor TioEtmSynchroStrategy_Payload.Destroy;
begin
  FPayloadData.Free;
  FTempIdContainer.Free;
  inherited;
end;

procedure TioEtmSynchroStrategy_Payload._BuildBlackAndWhiteListWhere(const AWhere: IioWhere);
var
  LEntityClassName: String;
begin
  // WhiteList
  if ClassWhiteList.Count > 0 then
  begin
    AWhere._And._OpenPar;
    for LEntityClassName in ClassWhiteList do
      AWhere._Or('EntityClassName', coEquals, LEntityClassName);
    AWhere._ClosePar;
  end;
  // BlackList
  if ClassBlackList.Count > 0 then
  begin
    AWhere._And._OpenPar;
    for LEntityClassName in ClassBlackList do
      AWhere._And('EntityClassName', coNotEquals, LEntityClassName);
    AWhere._ClosePar;
  end;
end;

procedure TioEtmSynchroStrategy_Payload._InternalPersistObjToServer(const AObj: TObject);
var
  LMap: IioMap;
  LNewID, LOldID: Integer;
  procedure _CheckForTemporaryBelongsToID;
  var
    LChildMap: IioMap;
    LChildObj: TObject;
    LChildObjID: Integer;
    LProperty: IioProperty;
  begin
    // It loops through all the properties to search for the one with the BelongdsTo relationship,
    // if it finds one it extracts the child object and if it has a temporary ID it replaces it
    // with the one that should now be contained in the appropriate container for the temporary IDs.
    for LProperty in LMap.GetProperties do
    begin
      if LProperty.GetRelationType <> rtBelongsTo then
        Continue;
      LChildObj := LProperty.GetRelationChildObject(AObj);
      if LChildObj = nil then
        Continue;
      LChildMap := TioMapContainer.GetMap(LChildObj.ClassName);
      LChildObjID := LChildMap.GetProperties.GetIdProperty.GetValue(LChildObj).AsInteger;
      if LChildObjID < 0 then
      begin
        if FTempIdContainer.Contains(LChildObj.ClassName, LChildObjID) then
          LChildMap.GetProperties.GetIdProperty.SetValue(LChildObj, FTempIdContainer.GetNewID(LChildObj.ClassName, LChildObjID))
        else
          raise EioEtmException.Create(ClassName, '_InternalPersistObjToServer', Format('The new definitive ID cannot be negative (child class "%s", ID=%d).',
            [LChildObj.ClassName, LChildObjID]));
      end;
    end;
  end;

begin
  // Obj cannot be nil
  if AObj = nil then
    Exit;
  // Get map for the object
  LMap := TioMapContainer.GetMap(AObj.ClassName);
  // Check for temporary ID in properties with BelongsTo relation
  _CheckForTemporaryBelongsToID;
  // Extract the current ID
  LOldID := LMap.GetProperties.GetIdProperty.GetValue(AObj).AsInteger;
  // If the object ID is temporary (negative) then set it to NULL to ensure
  // that a new definitive one is assigned during persistence on the server.
  if LOldID < 0 then
    LMap.GetProperties.GetIdProperty.SetValue(AObj, IO_INTEGER_NULL_VALUE);
  // Persist the current object
  io._PersistObject(AObj, itSynchro_PersistToClient, BL_SYNCHRO_PERSIST_PAYLOAD);
  // At this point if the object's ID was temporary (negative) then during persistence
  // it must have been assigned a new one so it re-reads it and add it
  // in the appropriate temporary ID container.
  // NB: Obviously the new permanent ID can no longer be negative
  if LOldID < 0 then
  begin
    LNewID := LMap.GetProperties.GetIdProperty.GetValue(AObj).AsInteger;
    if LNewID < 0 then
      raise EioEtmException.Create(ClassName, '_InternalPersistObjToServer',
        Format('The new definitive ID cannot be negative (class "%s", OldID=%d, NewID=%d).', [AObj.ClassName, LOldID, LNewID]));
    FTempIdContainer.Add(AObj.ClassName, LOldID, LNewID);
  end;
end;

procedure TioEtmSynchroStrategy_Payload._ClearPayloadData;
begin
  FPayloadData.Count := 0;
end;

procedure TioEtmSynchroStrategy_Payload._DoOldSynchroLogItem_LoadFromClient;
var
  LWhere: IioWhere;
begin
  // Load last SynchroLogItem from the local client connection
  LWhere := io.Where('SynchroName', coEquals, SynchroName);
  LWhere._And('SynchroStatus', coEquals, TioSynchroStatus.ssCompleted);
  LWhere._And('[.ID] = (SELECT MAX(SUB.ID) FROM [TioEtmSynchroStrategy_LogItem] SUB WHERE SUB.SYNCHRONAME = [.SYNCHRONAME])');
  Self.SynchroLogItem_Old := io.LoadObject<TioEtmSynchroStrategy_LogItem>(LWhere);
end;

procedure TioEtmSynchroStrategy_Payload._DoFinalizePayload;
begin
  inherited;
  // Delete sent TimeSlots if enabled...
  if EtmTimeSlot_Delete_SentToServer then
    io.SQL(Format('DELETE FROM [%s] WHERE [.TimeSlotSynchroState] = %d', [FEtmTimeSlotClassName, Ord(tsToBeSynchronized)]))
      .SelfClass(FEtmTimeSlotClassName).Execute
  else
    // Change the TimeSlotSynchroState value of the synchronized TimeSlots from "tsToBeSynchronized" to "tsSynchronized_SentToServer" if enabled...
    if EtmTimeSlot_Update_SentToServer then
      io.SQL(Format('UPDATE [%s] SET [.TimeSlotSynchroState] = %d WHERE [.TimeSlotSynchroState] = %d', [FEtmTimeSlotClassName, Ord(tsSynchronized_SentToServer),
        Ord(tsToBeSynchronized)])).SelfClass(FEtmTimeSlotClassName).Execute;
end;

procedure TioEtmSynchroStrategy_Payload._DoLoadPayloadFromClient;
var
  LSynchroLogItem_New: TioEtmSynchroStrategy_LogItem;
  LWhere: IioWhere;
begin
  inherited;
  // Build where
  LWhere := io.Where('TimeSlotSynchroState', coEquals, tsToBeSynchronized);
  // Where: last timeslot for any object only and/or insert timeslot for the same entity
  LWhere._And._OpenPar;
  LWhere.Add(Format('[.ID] = (SELECT MAX(SUB.ID) FROM [%s] SUB WHERE SUB.EntityClassName = [.EntityClassName] AND SUB.EntityID = [.EntityID])',
    [FEtmTimeSlotClassName]));
  LWhere._Or('ActionType', coEquals, TioPersistenceActionType.atInsert);
  LWhere._ClosePar;
  // OrderBy (DESC because it load timeslots with negative ID)
  LWhere._OrderBy('[.ID] ASC');
  // Load objects to be synchronized
  LWhere.TypeName := FEtmTimeSlotClassName;
  LWhere.ToList(FPayloadData);
  // Update SynchroLogItem (cast the SynchroLogItem to the specialized etm based class)
  LSynchroLogItem_New := Self.SynchroLogItem_New as TioEtmSynchroStrategy_LogItem;
  LSynchroLogItem_New.CliToSrv_Count := FPayloadData.Count;
  if FPayloadData.Count > 0 then
  begin
    LSynchroLogItem_New.CliToSrv_TimeSlotID_From := FPayloadData.First.ID;
    LSynchroLogItem_New.CliToSrv_TimeSlotID_To := FPayloadData.Last.ID;
  end;
end;

procedure TioEtmSynchroStrategy_Payload._DoReloadPayloadFromServer;
var
  LSynchroLogItem_New: TioEtmSynchroStrategy_LogItem;
  LWhere: IioWhere;
begin
  inherited;
  // Clear the payload data
  _ClearPayloadData;
  // Cast the SynchroLogItem to the specialized Etm based one
  LSynchroLogItem_New := Self.SynchroLogItem_New as TioEtmSynchroStrategy_LogItem;
  // Build where
  LWhere := io.Where('ID', coGreaterOrEqual, LSynchroLogItem_New.SrvToCli_TimeSlotID_From);
  // Where: black & white class list
  _BuildBlackAndWhiteListWhere(LWhere);
  // Where: last timeslot for any object only
  LWhere._And(Format('[.ID] = (SELECT MAX(SUB.ID) FROM [%s] SUB WHERE SUB.EntityClassName = [.EntityClassName] AND SUB.EntityID = [.EntityID])',
    [FEtmTimeSlotClassName]));
  // OrderBy (DESC because it load timeslots with negative ID)
  LWhere._OrderBy('[.ID] ASC');
  // Load objects to be synchronized
  LWhere.TypeName := FEtmTimeSlotClassName;
  LWhere.ToList(FPayloadData);
  // Update SynchroLogItem (cast the SynchroLogItem to the specialized etm based class)
  LSynchroLogItem_New.SrvToCli_Count := FPayloadData.Count;
  if FPayloadData.Count > 0 then
    LSynchroLogItem_New.SrvToCli_TimeSlotID_To := FPayloadData.Last.ID
  else
    LSynchroLogItem_New.SrvToCli_TimeSlotID_To := LSynchroLogItem_New.SrvToCli_TimeSlotID_From;
end;

procedure TioEtmSynchroStrategy_Payload._DoNewSynchroLogItem_Create;
begin
  // Create a new instance as current SynchroLogItem of the right classs
  Self.SynchroLogItem_New := TioEtmSynchroStrategy_LogItem.Create;
end;

procedure TioEtmSynchroStrategy_Payload._DoNewSynchroLogItem_Initialize;
var
  LSynchroLogItem_New: TioEtmSynchroStrategy_LogItem;
  LSynchroLogItem_Old: TioEtmSynchroStrategy_LogItem;
begin
  inherited;
  // Cast the SynchroLogItem to the specialized etm based class
  LSynchroLogItem_New := Self.SynchroLogItem_New as TioEtmSynchroStrategy_LogItem;
  LSynchroLogItem_Old := Self.SynchroLogItem_Old as TioEtmSynchroStrategy_LogItem;
  // Initialize the new SynchroLogItem after its creation
  LSynchroLogItem_New.EtmTimeSlotClassName := FEtmTimeSlotClassName;
  if LSynchroLogItem_Old <> nil then
    LSynchroLogItem_New.SrvToCli_TimeSlotID_From := LSynchroLogItem_Old.SrvToCli_TimeSlotID_To + 1
  else
    LSynchroLogItem_New.SrvToCli_TimeSlotID_From := 1;
end;

procedure TioEtmSynchroStrategy_Payload._DoPersistPayloadToClient;
var
  LObj: TObject;
  LEtmTimeSlot: TioEtmCustomTimeSlot;
begin
  inherited;
  io.StartTransaction;
  try
    // Delete all temporary new inserted objects (negative ID)
    FTempIdContainer.DeleteObjectsWithTemporaryID;
    FTempIdContainer.UpdateEtmTimeSlotsWithTemporaryID(FEtmTimeSlotClassName);
    // Loop for all TimeSlots to be synchronized and revert and finally persist each of them
    for LEtmTimeSlot in FPayloadData do
    begin
      LObj := io.ETM.RevertObject(LEtmTimeSlot, False);
      try
        if LObj = nil then
          Continue;
        case LEtmTimeSlot.ActionType of
          atInsert, atUpdate:
            io._PersistObject(LObj, itSynchro_PersistToClient, BL_SYNCHRO_PERSIST_PAYLOAD);
          atDelete:
            io._DeleteObjectInternal(LObj, itSynchro_PersistToClient, BL_SYNCHRO_PERSIST_PAYLOAD);
        end;
      finally
        FreeAndNil(LObj);
      end;
    end;
    io.CommitTransaction;
  except
    io.RollbackTransaction;
    raise;
  end;
end;

procedure TioEtmSynchroStrategy_Payload._DoPersistPayloadToServer;
var
  LObj: TObject;
  LEtmTimeSlot: TioEtmCustomTimeSlot;
begin
  inherited;
  // Loop for all TimeSlots to be synchronized and revert and finally persist each of them
  io.StartTransaction;
  try
    LObj := nil;
    for LEtmTimeSlot in FPayloadData do
    begin
      LObj := io.ETM.RevertObject(LEtmTimeSlot, False);
      try
        if LObj = nil then
          Continue;
        case LEtmTimeSlot.ActionType of
          atInsert, atUpdate:
            _InternalPersistObjToServer(LObj);
          atDelete:
            io._DeleteObjectInternal(LObj, itSynchro_PersistToClient, BL_SYNCHRO_PERSIST_PAYLOAD);
        end;
      finally
        FreeAndNil(LObj);
      end;
    end;
    io.CommitTransaction;
  except
    io.RollbackTransaction;
    raise;
  end;
end;

{ TioEtmSynchroStrategy_Client }

constructor TioEtmSynchroStrategy_Client.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FEtmTimeSlot_ClassName := String.Empty;
  // Initialize TimeSlot persist/update/delete properties
  EtmTimeSlot_Delete_SentToServer := True;
  EtmTimeSlot_Persist_ReceivedFromServer := False;
  EtmTimeSlot_Persist_Regular := False;
  EtmTimeSlot_Persist_ToBeSynchronized := True;
  EtmTimeSlot_Update_SentToServer := False;
end;

procedure TioEtmSynchroStrategy_Client.SetEtmTimeSlot_ClassName(const Value: String);
begin
  FEtmTimeSlot_ClassName := Value.Trim;
end;

procedure TioEtmSynchroStrategy_Client._CheckEtmTimeSlotClassName;
var
  LMap: IioMap;
begin
  // Check property is not empty
  if FEtmTimeSlot_ClassName.Trim.IsEmpty then
    raise EioSynchroStrategyException.Create(ClassName, '_CheckEtmTimeSlotClassName',
      Format('Hi, I''m iORM and I have something to tell you.' +
      #13#13'The "EtmTimeSlot_ClassName" property of the SynchroStrategy component called "%s" was not set.' +
      #13#13'Please Set the property to an ETM Repository/Timeslot class name and try again.' + #13#13'It will work.', [Name]));
  // Check if the FEtmTimeSlotClassName is mapped
  if not TioMapContainer.Exist(FEtmTimeSlot_ClassName) then
    raise EioException.Create(ClassName, '_CheckEtmTimeSlotClassName',
      Format('Hi, I''m iORM and I have something to tell you.' +
      #13#13'I cannot find the map of the ETM Repository/TimeSlot class named "%s" specified in the "EtmTimeSlot_ClassName" property of the SynchroStrategy component called "%s".'
      + #13#13'May be that you forgot to decorate the class with the "[etmRepository]" attribute on it.' +
      #13#13'Also make sure that you have put "iORM" and/or "iORM.Attributes" in the "uses" section of the unit where the class is declared.' +
      #13#13'Check and try again please, it will work.', [FEtmTimeSlot_ClassName, Name]));
  // Check if the property is set to a EtmTimeSlotClass
  LMap := TioMapContainer.GetMap(FEtmTimeSlot_ClassName);
  if not LMap.GetTable.GetRttiType.MetaclassType.InheritsFrom(TioEtmCustomTimeSlot) then
    raise EioException.Create(ClassName, '_CheckEtmTimeSlotClassName',
      Format('Hi, I''m iORM and I have something to tell you.' +
      #13#13'The class "%s" specified in the "EtmTimeSlot_ClassName" property of the SynchroStrategy component named "%s" is not an ETM Repository/TimeSlot class.'
      + #13#13'Make sure that the property is set to an ETM Repository/TimeSlot class name and try again.' + #13#13'It will work.',
      [FEtmTimeSlot_ClassName, Name]));
end;

function TioEtmSynchroStrategy_Client._DoGenerateLocalID(const AContext: IioContext): Integer;
var
  LQuery: IioQuery;
begin
  inherited;
  // Generate negative ID as local temporary ID (tonbe changed during synchronization process)
  LQuery := TioDBFactory.QueryEngine.GetQueryMinID(AContext);
  try
    LQuery.Open;
    Result := LQuery.Fields[0].AsInteger - 1;
    if Result > -1 then
      Result := -1;
  finally
    LQuery.Close;
  end;
end;

function TioEtmSynchroStrategy_Client._DoPayload_Create: TioCustomSynchroStrategy_Payload;
begin
  Result := TioEtmSynchroStrategy_Payload.Create;
end;

procedure TioEtmSynchroStrategy_Client._DoPayload_Initialize(const APayload: TioCustomSynchroStrategy_Payload; const ASynchroLevel: TioSynchroLevel);
var
  LPayload: TioEtmSynchroStrategy_Payload;
begin
  inherited;
  // Cast the payload to the specialized etm based class
  LPayload := APayload as TioEtmSynchroStrategy_Payload;
  // Initialize the new payload after its creation
  _CheckEtmTimeSlotClassName;
  LPayload.EtmTimeSlotClassName := FEtmTimeSlot_ClassName
end;

{ TioEtmSynchroStrategy_TempIdContainer }

constructor TioEtmSynchroStrategy_TempIdContainer.Create;
begin
  FInternalContainer := TObjectList<TioEtmSynchroStrategy_TempIdContainerItem>.Create;
end;

procedure TioEtmSynchroStrategy_TempIdContainer.DeleteObjectsWithTemporaryID;
var
  I: Integer;
begin
  for I := FInternalContainer.Count - 1 downto 0 do
    io.RefTo(FInternalContainer[I].EntityClassName).ByID(FInternalContainer[I].OldID).Delete;
end;

destructor TioEtmSynchroStrategy_TempIdContainer.Destroy;
begin
  FInternalContainer.Free;
  inherited;
end;

function TioEtmSynchroStrategy_TempIdContainer.Contains(const AEntityClassName: String; const AOldID: Integer): Boolean;
var
  LTempIdContainer: TioEtmSynchroStrategy_TempIdContainerItem;
begin
  for LTempIdContainer in FInternalContainer do
    if (LTempIdContainer.EntityClassName = AEntityClassName) and (LTempIdContainer.OldID = AOldID) then
      Exit(True);
  Result := False;
end;

procedure TioEtmSynchroStrategy_TempIdContainer.Add(const AEntityClassName: String; const AOldID, ANewID: Integer);
begin
  if Contains(AEntityClassName, AOldID) then
    raise EioEtmException.Create(ClassName, 'Add', Format('Object of class "%s" with ID = %d is already extsts in the container.', [AEntityClassName, AOldID]));
  FInternalContainer.Add(TioEtmSynchroStrategy_TempIdContainerItem.Create(AEntityClassName, AOldID, ANewID));
end;

function TioEtmSynchroStrategy_TempIdContainer.GetNewID(const AEntityClassName: String; const AOldID: Integer): Integer;
var
  LTempIdContainer: TioEtmSynchroStrategy_TempIdContainerItem;
begin
  for LTempIdContainer in FInternalContainer do
    if (LTempIdContainer.EntityClassName = AEntityClassName) and (LTempIdContainer.OldID = AOldID) then
      Exit(LTempIdContainer.NewID);
  raise EioEtmException.Create(ClassName, 'GetNewID', Format('Object of class "%s" with ID = %d not found in the container.', [AEntityClassName, AOldID]));
end;

procedure TioEtmSynchroStrategy_TempIdContainer.UpdateEtmTimeSlotsWithTemporaryID(const AEtmTimeSlotClassname: String);
var
  LTempIdContainer: TioEtmSynchroStrategy_TempIdContainerItem;
begin
  for LTempIdContainer in FInternalContainer do
    io.SQL(Format('UPDATE [%s] SET [.EntityID] = %d WHERE [.EntityClassName] = ''%s'' AND [.EntityID] = %d', [AEtmTimeSlotClassname, LTempIdContainer.NewID,
      LTempIdContainer.EntityClassName, LTempIdContainer.OldID])).SelfClass(AEtmTimeSlotClassname).Execute;
end;

{ TioEtmSynchroStrategy_TempIdContainerItem }

constructor TioEtmSynchroStrategy_TempIdContainerItem.Create(const AEntityClassName: String; const AOldID, ANewID: Integer);
begin
  FEntityClassName := AEntityClassName;
  FNewID := ANewID;
  FOldID := AOldID;
end;

end.
