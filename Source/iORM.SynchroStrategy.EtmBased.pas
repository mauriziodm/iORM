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
  iORM.SynchroStrategy.Interfaces, iORM.Where.Interfaces, System.Classes;

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

  TioEtmSynchroStrategy_Payload = class(TioCustomSynchroStrategy_Payload)
  strict private
    FEtmTimeSlotClassName: String;
    FPayloadData: TioEtmTimeline;
    procedure _BuildBlackAndWhiteListWhere(const AWhere: IioWhere);
    procedure _ClearPayloadData;
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
  iORM.CommonTypes, iORM, System.SysUtils, System.Generics.Collections,
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
end;

destructor TioEtmSynchroStrategy_Payload.Destroy;
begin
  FPayloadData.Free;
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
  // Where: last timeslot for any object only
  LWhere._And(Format('[.ID] = (SELECT MAX(SUB.ID) FROM [%s] SUB WHERE SUB.EntityClassName = [.EntityClassName] AND SUB.EntityID = [.EntityID])',
    [FEtmTimeSlotClassName]));
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
  // Loop for all TimeSlots to be synchronized and revert and finally persist each of them
  io.StartTransaction;
  try
    LObj := nil;
    for LEtmTimeSlot in FPayloadData do
    begin
      LObj := io.ETM.RevertObject(LEtmTimeSlot, False);
      try
        if LObj <> nil then
          io._PersistObject(LObj, itSynchro_PersistToClient, BL_SYNCHRO_PERSIST_PAYLOAD);
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
        if LObj <> nil then
          io._PersistObject(LObj, itSynchro_PersistToServer, BL_SYNCHRO_PERSIST_PAYLOAD);
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

end.
