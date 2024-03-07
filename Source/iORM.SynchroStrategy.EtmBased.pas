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
    FTimeSlotID_From: Integer;
    FTimeSlotID_To: Integer;
  public
    constructor Create; override;
    property EtmTimeSlotClassName: String read FEtmTimeSlotClassName write FEtmTimeSlotClassName;
    property TimeSlotID_From: Integer read FTimeSlotID_From write FTimeSlotID_From;
    property TimeSlotID_To: Integer read FTimeSlotID_To write FTimeSlotID_To;
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
    // ---------- Methods to override on descendant classes ----------
  public
    constructor Create; override;
    destructor Destroy; override;
    property EtmTimeSlotClassName: String read FEtmTimeSlotClassName write FEtmTimeSlotClassName;
  end;

  TioEtmSynchroStrategy = class(TioCustomSynchroStrategy)
  strict private
    FEtmTimeSlotClassName: String;
  strict protected
    // ---------- Synchro strategy methods to override on descendant classes ----------
    function _DoGenerateLocalID(const AContext: IioContext): Integer; override;
    function _DoPayload_Create: TioCustomSynchroStrategy_Payload; override;
    procedure _DoPayload_Initialize(const APayload: TioCustomSynchroStrategy_Payload); override;
    // ---------- Synchro strategy methods to override on descendant classes ----------
  public
    constructor Create(AOwner: TComponent); override;
  published
    property EtmTimeSlotClassName: String read FEtmTimeSlotClassName write FEtmTimeSlotClassName;
  end;

implementation

uses
  iORM.CommonTypes, iORM, System.SysUtils, System.Generics.Collections,
  iORM.DB.Interfaces, iORM.DB.Factory;

{ TioEtmBasetSynchroStrategy_LogItem }

constructor TioEtmSynchroStrategy_LogItem.Create;
begin
  inherited;
  FEtmTimeSlotClassName := String.Empty;
  FTimeSlotID_From := IO_INTEGER_NULL_VALUE;
  FTimeSlotID_To := IO_INTEGER_NULL_VALUE;
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
  LWhere._And('ID = (SELECT MAX(SUB.ID) FROM [TioEtmSynchroStrategy_LogItem] SUB WHERE SUB.SYNCHRONAME = SYNCHRONAME)');
  Self.SynchroLogItem_Old := io.LoadObject<TioEtmSynchroStrategy_LogItem>(LWhere);
end;

procedure TioEtmSynchroStrategy_Payload._DoLoadPayloadFromClient;
var
  LWhere: IioWhere;
begin
  inherited;
  // Build where
  LWhere := io.Where('ID', coLower, 0); // The ID of the TimeSlots created on the client device is always negative
  // Where: black & white class list
  _BuildBlackAndWhiteListWhere(LWhere);
  // Where: last timeslot for any object only
  LWhere._And(Format('ID = (SELECT MIN(SUB.ID) FROM [%s] SUB WHERE SUB.ID = ID)', [FEtmTimeSlotClassName]));
  // OrderBy (DESC because it load timeslots with negative ID)
  LWhere._OrderBy('ID DESC');
  // Load objects to be synchronized
  LWhere.TypeName := FEtmTimeSlotClassName;
  LWhere.ToList(FPayloadData);
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
    LSynchroLogItem_New.TimeSlotID_From := LSynchroLogItem_Old.TimeSlotID_To + 1
  else
    LSynchroLogItem_New.TimeSlotID_From := 1;
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
          io._PersistObject(LObj, TioPersistenceIntentType.itSynchronization, BL_SYNCHRO_PERSIST_PAYLOAD);
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
          io._PersistObject(LObj, TioPersistenceIntentType.itSynchronization, BL_SYNCHRO_PERSIST_PAYLOAD);
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

procedure TioEtmSynchroStrategy_Payload._DoReloadPayloadFromServer;
var
  LSynchroLogItem_New: TioEtmSynchroStrategy_LogItem;
  LWhere: IioWhere;
begin
  inherited;
  // Clear the payload data
  _ClearPayloadData;
  // Cast the SynchroLogItem to the specialized etm based class
  LSynchroLogItem_New := Self.SynchroLogItem_New as TioEtmSynchroStrategy_LogItem;
  // Build where
  LWhere := io.Where('ID', coGreaterOrEqual, LSynchroLogItem_New.TimeSlotID_From);
  // Where: black & white class list
  _BuildBlackAndWhiteListWhere(LWhere);
  // Where: last timeslot for any object only
  LWhere._And(Format('ID = (SELECT MAX(SUB.ID) FROM [%s] SUB WHERE SUB.ID = ID)', [FEtmTimeSlotClassName]));
  // OrderBy (DESC because it load timeslots with negative ID)
  LWhere._OrderBy('ID ASC');
  // Load objects to be synchronized
  LWhere.TypeName := FEtmTimeSlotClassName;
  LWhere.ToList(FPayloadData);
end;

{ TioEtmSynchroStrategy_Client }

constructor TioEtmSynchroStrategy.Create(AOwner: TComponent);
begin
  inherited;
  FEtmTimeSlotClassName := String.Empty;
end;

function TioEtmSynchroStrategy._DoGenerateLocalID(const AContext: IioContext): Integer;
var
  LQuery: IioQuery;
begin
  LQuery := TioDBFactory.QueryEngine.GetQueryMinID(AContext);
  try
    LQuery.Open;
    AContext.GetProperties.GetIdProperty.SetValue(AContext.DataObject, LQuery.Fields[0].AsInteger - 1);
  finally
    LQuery.Close;
  end;
end;

function TioEtmSynchroStrategy._DoPayload_Create: TioCustomSynchroStrategy_Payload;
begin
  Result := TioEtmSynchroStrategy_Payload.Create;
end;

procedure TioEtmSynchroStrategy._DoPayload_Initialize(const APayload: TioCustomSynchroStrategy_Payload);
var
  LPayload: TioEtmSynchroStrategy_Payload;
begin
  inherited;
  // Cast the payload to the specialized etm based class
  LPayload := APayload as TioEtmSynchroStrategy_Payload;
  // Initialize the new payload after its creation
  LPayload.EtmTimeSlotClassName := FEtmTimeSlotClassName;
end;

end.
