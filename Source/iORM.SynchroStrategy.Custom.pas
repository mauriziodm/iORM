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
unit iORM.SynchroStrategy.Custom;

interface

uses
  System.Classes, iORM.Context.Interfaces, iORM.SynchroStrategy.Interfaces, iORM.Attributes, DJSON.Attributes,
  System.SysUtils;

type

  // This class contains and persists information on the synchronization operations that have
  //   taken place over time and is used for two things:
  //   1) on the client side as a reference
  //      to when the last synchronization was performed and at what point it has reached
  //      (e.g. which EtmTimeSlot was the last one synchronized)
  //   2) on the server side as a history of the synchronizations that occurred over time
  //      (also on the client side if desired).
  [ioEntity('SYNCHRO_LOG')]
  TioCustomSynchroStrategy_LogItem = class
  strict private
    FID: Integer;
    FSynchroLevel: TioSynchroLevel;
    FSynchroName: String;
    FSynchroStatus: TioSynchroStatus;
    FUserID: Integer;
    FUserName: String;
    // Timing
    FStart: TDateTime;
    FLoadFromClient: TDateTime;
    FPersistToServer: TDateTime;
    FReloadFromServer: TDateTime;
    FPersistToClient: TDateTime;
    FCompleted: TDateTime;
  public
    constructor Create; virtual;
    property ID: Integer read FID write FID;
    property SynchroLevel: TioSynchroLevel read FSynchroLevel write FSynchroLevel;
    property SynchroName: String read FSynchroName write FSynchroName;
    property SynchroStatus: TioSynchroStatus read FSynchroStatus write FSynchroStatus;
    property UserID: Integer read FUserID write FUserID;
    property UserName: String read FUserName write FUserName;
    // Timing
    property Start: TDateTime read FStart write FStart;
    property LoadFromClient: TDateTime read FLoadFromClient write FLoadFromClient;
    property PersistToServer: TDateTime read FPersistToServer write FPersistToServer;
    property ReloadFromServer: TDateTime read FReloadFromServer write FReloadFromServer;
    property PersistToClient: TDateTime read FPersistToClient write FPersistToClient;
    property Completed: TDateTime read FCompleted write FCompleted;
  end;

  // This class represents the payload of the synchronization operation in the sense that
  //   it is responsible for "transporting" the objects and information that must be synchronized
  //   from the client to the server and vice versa. However, this class also implements the
  //   behavioral and executive part of the synchronization through a whole series of methods
  //   that must/can be overridden in the concrete classes that will derive from it;
  //   in this way, especially if the target connection is an http connection,
  //   it will be this class (with the SynchroLogItem inside) that will be serialized and
  //   sent/received from the client to the server and vice versa and will carry out the various
  //   synchronization phases through its methods on the right side.
  // Note: In this class I wanted to use a generics so as to be able to abstract from the real
  //        SynchroLogItem class, in fact both will have to be derived (therefore changed)
  //        to create a concrete synchro strategy. But I already use a generics in the
  //        SynchroStrategy_Client<T: TioCustomSynchroStrategy_Payload> component which already
  //        has a constraint so I would then have had to use a double generics here with
  //        two different constraints and Delphi doesn't allow this or at least I haven't found
  //        a way to do it. So I decided not to use generics on the Payload class and to declare
  //        on it a whole series of virtual methods that can be overridden to create and manage
  //        different types of SynchroLogItem which however must be derived from the
  //        TioCustomSynchroStrategy_LogItem base class
  TioCustomSynchroStrategy_Payload = class abstract
  strict private
    FClassBlackList: TioSynchroStrategy_ClassList; // TList because it will be serialized by djson
    FClassWhiteList: TioSynchroStrategy_ClassList; // TList because it will be serialized by djson
    FSynchroLevel: TioSynchroLevel;
    FSynchroLogItem_New: TioCustomSynchroStrategy_LogItem;
    FSynchroLogItem_Old: TioCustomSynchroStrategy_LogItem;
    FSynchroName: String;
    FUserID: Integer;
    FUserName: String;
    [djSkip] // Non viene serializzato (in caso di connessione HTTP) in questo modo poi capisco se siamo remotizzati e quindi se devo fare lo "use" o no.
    FTargetConnectionDefName: String;
  strict protected
    // ---------- Methods to override on descendant classes ----------
    // Connection
    procedure _SwitchToTargetConnection; virtual;
    procedure _ReturnToLocalConnection; virtual;
    // SynchroLogItem
    procedure _DoOldSynchroLogItem_LoadFromClient; virtual;
    procedure _DoNewSynchroLogItem_Create; virtual;
    procedure _DoNewSynchroLogItem_Initialize; virtual;
    procedure _DoNewSynchroLogItem_SetStatus_LoadFromClient; virtual;
    procedure _DoNewSynchroLogItem_SetStatus_PersistToServer; virtual;
    procedure _DoNewSynchroLogItem_SetStatus_ReloadFromServer; virtual;
    procedure _DoNewSynchroLogItem_SetStatus_PersistToClient; virtual;
    procedure _DoNewSynchroLogItem_SetStatus_Completed; virtual;
    procedure _DoNewSynchroLogItem_Persist; virtual;
    // Payload
    procedure _DoLoadPayloadFromClient; virtual; abstract;
    procedure _DoPersistPayloadToServer; virtual; abstract;
    procedure _DoReloadPayloadFromServer; virtual; abstract;
    procedure _DoPersistPayloadToClient; virtual; abstract;
    // ---------- Methods to override on descendant classes ----------
    property SynchroLogItem_New: TioCustomSynchroStrategy_LogItem read FSynchroLogItem_New write FSynchroLogItem_New;
    property SynchroLogItem_Old: TioCustomSynchroStrategy_LogItem read FSynchroLogItem_Old write FSynchroLogItem_Old;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    // ---------- Methods to be called by the persistence strategy ----------
    procedure Initialize;
    procedure LoadFromClient;
    procedure PersistAndReloadFromServer;
    procedure PersistToClient;
    procedure Finalize;
    // ---------- Methods to be called by the persistence strategy ----------
    property ClassBlackList: TioSynchroStrategy_ClassList read FClassBlackList; // TList because it will be serialized by djson
    property ClassWhiteList: TioSynchroStrategy_ClassList read FClassWhiteList; // TList because it will be serialized by djson
    property SynchroLevel: TioSynchroLevel read FSynchroLevel write FSynchroLevel;
    property SynchroName: String read FSynchroName write FSynchroName;
    property TargetConnectionDefName: String read FTargetConnectionDefName write FTargetConnectionDefName;
    property UserID: Integer read FUserID write FUserID;
    property UserName: String read FUserName write FUserName;
  end;

  TioCustomSynchroStrategy_Client = class abstract(TComponent, IioSynchroStrategy_Client)
  strict private
    FAsync: Boolean;
    FEntities_BlackList: TStrings;
    FEntities_WhiteList: TStrings;
    FEtmTimeSlot_Delete_SentToServer: Boolean;
    FEtmTimeSlot_Persist_ReceivedFromServer: Boolean;
    FEtmTimeSlot_Persist_Regular: Boolean;
    FEtmTimeSlot_Persist_ToBeSynchronized: Boolean;
    FEtmTimeSlot_Update_SentToServer: Boolean;
    FSynchroName: String;
    FTargetConnectionDef: IioSynchroStrategy_TargetConnectionDef; // IioSynchroStrategy_TargetConnectionDef instead of TioPersistenceStrategyRef to avoid circular reference
    procedure _SyncExecute(AExecuteMethod: TProc; ATerminateMethod: TProc);
    procedure _AsyncExecute(AExecuteMethod: TProc; ATerminateMethod: TProc);
    procedure SetTargetConnectionDef(const ATargetConnectionDef: IioSynchroStrategy_TargetConnectionDef);
    procedure SetEntities_BlackList(const Value: TStrings);
    procedure SetEntities_WhiteList(const Value: TStrings);
    strict protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    function IsToBeSynchronized(const AContext: IioContext): Boolean; virtual;
    // EtmTimeSlot_Delete_SentToServer
    procedure SetEtmTimeSlot_Delete_SentToServer(const Value: Boolean);
    function GetEtmTimeSlot_Delete_SentToServer: Boolean;
    // EtmTimeSlot_Persist_Received
    procedure SetEtmTimeSlot_Persist_ReceivedFromServer(const Value: Boolean);
    function GetEtmTimeSlot_Persist_ReceivedFromServer: Boolean;
    // EtmTimeSlot_Persist_Regular
    procedure SetEtmTimeSlot_Persist_Regular(const Value: Boolean);
    function GetEtmTimeSlot_Persist_Regular: Boolean;
    // EtmTimeSlot_Persist_ToBeSynchronized
    procedure SetEtmTimeSlot_Persist_ToBeSynchronized(const Value: Boolean);
    function GetEtmTimeSlot_Persist_ToBeSynchronized: Boolean;
    // EtmTimeSlot_Update_Sent
    procedure SetEtmTimeSlot_Update_SentToServer(const Value: Boolean);
    function GetEtmTimeSlot_Update_SentToServer: Boolean;
    // ---------- Synchro strategy methods to override on descendant classes ----------
    function _DoGenerateLocalID(const AContext: IioContext): Integer; virtual; abstract;
    function _DoPayload_Create: TioCustomSynchroStrategy_Payload; virtual; abstract;
    procedure _DoPayload_Initialize(const APayload: TioCustomSynchroStrategy_Payload; const ASynchroLevel: TioSynchroLevel); virtual;
    // ---------- Synchro strategy methods to override on descendant classes ----------
  strict protected
    property EtmTimeSlot_Delete_SentToServer: Boolean read GetEtmTimeSlot_Delete_SentToServer write SetEtmTimeSlot_Delete_SentToServer default False;
    property EtmTimeSlot_Persist_ReceivedFromServer: Boolean read GetEtmTimeSlot_Persist_ReceivedFromServer write SetEtmTimeSlot_Persist_ReceivedFromServer default False;
    property EtmTimeSlot_Persist_Regular: Boolean read GetEtmTimeSlot_Persist_Regular write SetEtmTimeSlot_Persist_Regular default False;
    property EtmTimeSlot_Persist_ToBeSynchronized: Boolean read GetEtmTimeSlot_Persist_ToBeSynchronized write SetEtmTimeSlot_Persist_ToBeSynchronized default False;
    property EtmTimeSlot_Update_SentToServer: Boolean read GetEtmTimeSlot_Update_SentToServer write SetEtmTimeSlot_Update_SentToServer default False;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DoSynchronization(const ASynchroLevel: TioSynchroLevel);
    function GenerateLocalID(const AContext: IioContext): Integer;
  published
    property Async: Boolean read FAsync write FAsync default False;
    // TODO: Togliere la parte write
    property Entities_BlackList: TStrings read FEntities_BlackList write SetEntities_BlackList;
    property Entities_WhiteList: TStrings read FEntities_WhiteList write SetEntities_WhiteList;
    property SynchroName: String read FSynchroName write FSynchroName;
    property TargetConnectionDef: IioSynchroStrategy_TargetConnectionDef read FTargetConnectionDef write SetTargetConnectionDef default nil;
  end;

  TioCustomSynchroStrategy_Thread = class(TThread)
  strict private
    FExceptionMessage: String;
    FExecuteMethod: TProc;
    FTerminateMethod: TProc;
  strict protected
    procedure Execute; override;
    procedure OnTerminateEventHandler(Sender: TObject);
  public
    constructor Create(AExecuteMethod: TProc; ATerminateMethod: TProc); overload;
  end;

implementation

uses
  iORM, iORM.PersistenceStrategy.Factory, iORM.DB.Interfaces, iORM.Abstraction,
  iORM.Exceptions;

{ TioCustomSynchroStrategy_Client }

constructor TioCustomSynchroStrategy_Client.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAsync := False;
  FEntities_BlackList := TStringList.Create;
  FEntities_WhiteList := TStringList.Create;
  FEtmTimeSlot_Delete_SentToServer := False;
  FEtmTimeSlot_Persist_ReceivedFromServer := False;
  FEtmTimeSlot_Persist_Regular := False;
  FEtmTimeSlot_Persist_ToBeSynchronized := False;
  FEtmTimeSlot_Update_SentToServer := False;
  FSynchroName := IO_STRING_NULL_VALUE;
  FTargetConnectionDef := nil;
end;

destructor TioCustomSynchroStrategy_Client.Destroy;
begin
  FEntities_BlackList.Free;
  FEntities_WhiteList.Free;
  inherited;
end;

function TioCustomSynchroStrategy_Client.GenerateLocalID(const AContext: IioContext): Integer;
begin
  Result := _DoGenerateLocalID(AContext);
end;

function TioCustomSynchroStrategy_Client.GetEtmTimeSlot_Delete_SentToServer: Boolean;
begin
  Result := FEtmTimeSlot_Delete_SentToServer;
end;

function TioCustomSynchroStrategy_Client.GetEtmTimeSlot_Persist_ReceivedFromServer: Boolean;
begin
  Result := FEtmTimeSlot_Persist_ReceivedFromServer;
end;

function TioCustomSynchroStrategy_Client.GetEtmTimeSlot_Persist_Regular: Boolean;
begin
  Result := FEtmTimeSlot_Persist_Regular;
end;

function TioCustomSynchroStrategy_Client.GetEtmTimeSlot_Persist_ToBeSynchronized: Boolean;
begin
  Result := FEtmTimeSlot_Persist_ToBeSynchronized;
end;

function TioCustomSynchroStrategy_Client.GetEtmTimeSlot_Update_SentToServer: Boolean;
begin
  Result := FEtmTimeSlot_Update_SentToServer;
end;

procedure TioCustomSynchroStrategy_Client.SetEntities_BlackList(const Value: TStrings);
begin
  FEntities_BlackList.Text := Value.Text.Trim;
//  FClassBlackList.Assign(Value);
end;

procedure TioCustomSynchroStrategy_Client.SetEntities_WhiteList(const Value: TStrings);
begin
  FEntities_WhiteList.Text := Value.Text.Trim;
//  FClassWhiteList.Assign(Value);
end;

procedure TioCustomSynchroStrategy_Client.SetEtmTimeSlot_Delete_SentToServer(const Value: Boolean);
begin
  FEtmTimeSlot_Delete_SentToServer := Value;
end;

procedure TioCustomSynchroStrategy_Client.SetEtmTimeSlot_Persist_ReceivedFromServer(const Value: Boolean);
begin
  FEtmTimeSlot_Persist_ReceivedFromServer := Value;
end;

procedure TioCustomSynchroStrategy_Client.SetEtmTimeSlot_Persist_Regular(const Value: Boolean);
begin
  FEtmTimeSlot_Persist_Regular := Value;
end;

procedure TioCustomSynchroStrategy_Client.SetEtmTimeSlot_Persist_ToBeSynchronized(const Value: Boolean);
begin
  FEtmTimeSlot_Persist_ToBeSynchronized := Value;
end;

procedure TioCustomSynchroStrategy_Client.SetEtmTimeSlot_Update_SentToServer(const Value: Boolean);
begin
  FEtmTimeSlot_Update_SentToServer := Value;
end;

procedure TioCustomSynchroStrategy_Client.SetTargetConnectionDef(const ATargetConnectionDef: IioSynchroStrategy_TargetConnectionDef);
begin
  if ATargetConnectionDef <> FTargetConnectionDef then
  begin
    if FTargetConnectionDef <> nil then
      FTargetConnectionDef.RemoveFreeNotification(Self);

    FTargetConnectionDef := ATargetConnectionDef;

    if FTargetConnectionDef <> nil then
      FTargetConnectionDef.FreeNotification(Self);
  end;
end;

procedure TioCustomSynchroStrategy_Client._DoPayload_Initialize(const APayload: TioCustomSynchroStrategy_Payload; const ASynchroLevel: TioSynchroLevel);
var
  LClassName: String;
begin
  APayload.SynchroLevel := ASynchroLevel;
  APayload.SynchroName := FSynchroName;
  // Black & White class list
  for LClassName in FEntities_BlackList do
    APayload.ClassBlackList.Add(LClassName);
  for LClassName in FEntities_WhiteList do
    APayload.ClassWhiteList.Add(LClassName);
  // TargetConnectionDef
  if Assigned(FTargetConnectionDef) then
    APayload.TargetConnectionDefName := FTargetConnectionDef.GetName
  else
    raise EioSynchroStrategyException.Create(ClassName, '_DoPayload_Initialize',
      Format('The "TargetConnectionDef" property of the "%s" component is not set correctly.', [Name]));
//  LPayLoad.UserID :=
//  LPayLoad.UserName :=
end;

procedure TioCustomSynchroStrategy_Client._AsyncExecute(AExecuteMethod, ATerminateMethod: TProc);
begin
  io.ShowWait;
  // Create and execute the thread
  TioCustomSynchroStrategy_Thread.Create(AExecuteMethod, ATerminateMethod).Start;
end;

function TioCustomSynchroStrategy_Client.IsToBeSynchronized(const AContext: IioContext): Boolean;
var
  LClassName: String;
begin
  // If we are persisting a TimeSlot then to understand if it needs to be synchronized
  //  (which for EtmSynchroStrategy simply means that it must assign a negative ID)
  //  is based on the name of the class of the entity to which the TimeSlot refers;
  //  otherwise it is based on the name of the class that is being persisted.
// TODO: Eliminare le parti commentate perchè con il nuovo modo con id dei timeslots sempre positivi probabilmente non serve più
//  if AContext.DataObject is TioEtmCustomTimeSlot then
//    LClassName := TioEtmCustomTimeSlot(AContext.DataObject).EntityClassName
//  else
    LClassName := AContext.DataObject.ClassName;
  // Detect if the current DataObject is to be synchronized or not (Black & White class list)
  Result := ( (FEntities_WhiteList.Count = 0) or (FEntities_WhiteList.IndexOf(LClassName) <> -1) )
        and ( (FEntities_BlackList.Count = 0) or (FEntities_BlackList.IndexOf(LClassName) = -1) );
end;

procedure TioCustomSynchroStrategy_Client.Notification(AComponent: TComponent; Operation: TOperation);
var
  LTargetConnectionDef: IioSynchroStrategy_TargetConnectionDef;
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and Supports(AComponent, IioSynchroStrategy_TargetConnectionDef, LTargetConnectionDef) and (LTargetConnectionDef = FTargetConnectionDef) then
    SetTargetConnectionDef(nil);
end;

procedure TioCustomSynchroStrategy_Client._SyncExecute(AExecuteMethod, ATerminateMethod: TProc);
begin
  io.ShowWait;
  try
    // Execute core code
    AExecuteMethod;
    // Execute OnTerminate code
    if Assigned(ATerminateMethod) then
      ATerminateMethod;
  finally
    io.HideWait;
  end;
end;

procedure TioCustomSynchroStrategy_Client.DoSynchronization(const ASynchroLevel: TioSynchroLevel);
var
  LPayload: TioCustomSynchroStrategy_Payload;
  LPersistenceStrategy: TioPersistenceStrategyRef;
  LExecuteMethod: TProc;
  LTerminateMethod: TProc;
begin
  // Create the payload and initialize it
  // Note: Use a local variable and not a global one for the component because
  //        the synchronization must also be possible to perform asynchronously.
  LPayload := _DoPayload_Create;
  _DoPayload_Initialize(LPayload, ASynchroLevel);
  // Get the right target persistence strategy
  LPersistenceStrategy := TioPersistenceStrategyFactory.GetStrategy(FTargetConnectionDef.GetName);
  // Build the execute method that start the synchronization
  LExecuteMethod := procedure
  begin
    LPersistenceStrategy.DoSynchronization(LPayload);
  end;
  // Build the terminate method
  LTerminateMethod := procedure
  begin
    LPayload.Free;
    io.HideWait;
  end;
  // Execute the synchronization
  if FASync then
    _AsyncExecute(LExecuteMethod, LTerminateMethod)
  else
    _SyncExecute(LExecuteMethod, LTerminateMethod);
end;

{ TioCustomSynchroStrategy_Payload }

constructor TioCustomSynchroStrategy_Payload.Create;
begin
  FClassWhiteList := TioSynchroStrategy_ClassList.Create;
  FClassBlackList := TioSynchroStrategy_ClassList.Create;
  FSynchroLogItem_Old := nil;
  FSynchroLogItem_New := nil;
  FSynchroLevel := TioSynchroLevel.slIncremental;
  FSynchroName := String.Empty;
  FTargetConnectionDefName := String.Empty;
  FUserID := IO_INTEGER_NULL_VALUE;
  FUserName := IO_STRING_NULL_VALUE;
end;

destructor TioCustomSynchroStrategy_Payload.Destroy;
begin
  FClassWhiteList.Free;
  FClassBlackList.Free;
  if Assigned(FSynchroLogItem_Old) then
    FSynchroLogItem_Old.Free;
  if Assigned(FSynchroLogItem_New) then
    FSynchroLogItem_New.Free;
  inherited;
end;

procedure TioCustomSynchroStrategy_Payload.Finalize;
begin
  // Set the new SynchroLogitem progress status and persist it server side,
  //  it will be persisted on the client only when the operation is completed successfully
  _DoNewSynchroLogItem_SetStatus_Completed;
  _SwitchToTargetConnection;
  try
    _DoNewSynchroLogItem_Persist;
  finally
    _ReturnToLocalConnection;
  end;
  // Persist even locally
  _DoNewSynchroLogItem_Persist;
end;

procedure TioCustomSynchroStrategy_Payload.Initialize;
begin
  // Load the last SynchroLogItem from which to obtain information on the last synchronization operation performed
  _DoOldSynchroLogItem_LoadFromClient;
  // Create and initialize a new SynchroLogitem on which to store the information and status of the synchronization in progress
  _DoNewSynchroLogItem_Create;
  _DoNewSynchroLogItem_Initialize;
  // Set the new SynchroLogitem progress status and persist it to the server,
  //  it will be persisted on the client only when the operation is completed successfully
  _SwitchToTargetConnection;
  try
    _DoNewSynchroLogItem_Persist;
  finally
    _ReturnToLocalConnection;
  end;
end;

procedure TioCustomSynchroStrategy_Payload.LoadFromClient;
begin
  // Set the new SynchroLogitem progress status and persist it server side,
  //  it will be persisted on the client only when the operation is completed successfully
  _DoNewSynchroLogItem_SetStatus_LoadFromClient;
  _SwitchToTargetConnection;
  try
    _DoNewSynchroLogItem_Persist;
  finally
    _ReturnToLocalConnection;
  end;
  // Load the payload from the client
  _DoLoadPayloadFromClient;
end;

procedure TioCustomSynchroStrategy_Payload.PersistAndReloadFromServer;
begin
  // This entire part of the operation must be performed server side
  //  so swith to che server connection
  _SwitchToTargetConnection;
  try
    // Set the new SynchroLogitem progress status and persist it server side,
    //  it will be persisted on the client only when the operation is completed successfully
    _DoNewSynchroLogItem_SetStatus_PersistToServer;
    _DoNewSynchroLogItem_Persist;
    // Persist the payload to server
    _DoPersistPayloadToServer;
    // Set the new SynchroLogitem progress status and persist it server side,
    //  it will be persisted on the client only when the operation is completed successfully
    _DoNewSynchroLogItem_SetStatus_ReloadFromServer;
    _DoNewSynchroLogItem_Persist;
    // Reload payload from the server
    _DoReloadPayloadFromServer;
  finally
    _ReturnToLocalConnection;
  end;
end;

procedure TioCustomSynchroStrategy_Payload.PersistToClient;
begin
  // Set the new SynchroLogitem progress status and persist it server side,
  //  it will be persisted on the client only when the operation is completed successfully
  _DoNewSynchroLogItem_SetStatus_PersistToClient;
  _SwitchToTargetConnection;
  try
    _DoNewSynchroLogItem_Persist;
  finally
    _ReturnToLocalConnection;
  end;
  // Persist the payload to the client
  _DoPersistPayloadToClient;
end;

procedure TioCustomSynchroStrategy_Payload._DoNewSynchroLogItem_Create;
begin
  // Create a new instance as current SynchroLogItem of the right classs
  FSynchroLogItem_New := TioCustomSynchroStrategy_LogItem.Create;
end;

procedure TioCustomSynchroStrategy_Payload._DoNewSynchroLogItem_Initialize;
begin
  // Initialize the new SynchroLogItem after its creation
  FSynchroLogItem_New.Start := Now;
  FSynchroLogItem_New.SynchroStatus := TioSynchroStatus.ssInitialization;
  FSynchroLogItem_New.SynchroLevel := FSynchroLevel;
  FSynchroLogItem_New.SynchroName := FSynchroName;
end;

procedure TioCustomSynchroStrategy_Payload._DoOldSynchroLogItem_LoadFromClient;
var
  LWhere: IioWhere;
begin
  // Load last SynchroLogItem from the local client connection
  LWhere := io.Where('SynchroName', coEquals, SynchroName);
  LWhere._And('SynchroStatus', coEquals, TioSynchroStatus.ssCompleted);
  LWhere._And('ID = SELECT MAX(SUB.ID) FROM [TioCustomSynchroStrategy_LogItem] SUB WHERE SUB.SYNCHRONAME = SYNCHRONAME');
  FSynchroLogItem_Old := io.LoadObject<TioCustomSynchroStrategy_LogItem>(LWhere);
end;

procedure TioCustomSynchroStrategy_Payload._DoNewSynchroLogItem_Persist;
begin
  // Persist the new SynchroLogItem
  io.PersistObject(FSynchroLogItem_New);
end;

procedure TioCustomSynchroStrategy_Payload._DoNewSynchroLogItem_SetStatus_Completed;
begin
  // Set the new SynchroLogitem progress status
  FSynchroLogItem_New.SynchroStatus := TioSynchroStatus.ssCompleted;
  FSynchroLogItem_New.Completed := Now;
end;

procedure TioCustomSynchroStrategy_Payload._DoNewSynchroLogItem_SetStatus_LoadFromClient;
begin
  // Set the new SynchroLogitem progress status
  FSynchroLogItem_New.SynchroStatus := TioSynchroStatus.ssLoadFromClient;
  FSynchroLogItem_New.LoadFromClient := Now;
end;

procedure TioCustomSynchroStrategy_Payload._DoNewSynchroLogItem_SetStatus_PersistToClient;
begin
  // Set the new SynchroLogitem progress status
  FSynchroLogItem_New.SynchroStatus := TioSynchroStatus.ssPersistToClient;
  FSynchroLogItem_New.PersistToClient := Now;
end;

procedure TioCustomSynchroStrategy_Payload._DoNewSynchroLogItem_SetStatus_PersistToServer;
begin
  // Set the new SynchroLogitem progress status
  FSynchroLogItem_New.SynchroStatus := TioSynchroStatus.ssPersistToServer;
  FSynchroLogItem_New.PersistToServer := Now;
end;

procedure TioCustomSynchroStrategy_Payload._DoNewSynchroLogItem_SetStatus_ReloadFromServer;
begin
  // Set the new SynchroLogitem progress status
  FSynchroLogItem_New.SynchroStatus := TioSynchroStatus.ssReloadFromServer;
  FSynchroLogItem_New.ReloadFromServer := Now;
end;

procedure TioCustomSynchroStrategy_Payload._ReturnToLocalConnection;
begin
  // If you are synchronizing with an http connection as the target and we are running on the client side
  //  (FTargetConnectionDefName is not empty) or the target connection is a normal non-http connection
  //  (so all the synchronization steps are performed on the client side) then select the connection specified
  //  precisely by the FTargetConnectionDefName field so that the object is persisted on this connection
  //  (normally it would persist on the local default connection, the normal client connection).
  //  If, however, you are synchronizing with an http connection as the target and we are running
  //  on the server side (FTargetConnectionDefName is empty) then it does not select any connection
  //  in particular but lets each object be loaded/persisted normally as set on the server.
  // Note: If FTargetConnectionDefName is empty then it means that we are on the server side of the synchronization,
  //        this is because the FTargetConnectionDefName field is set not to be serialized by DJSON so when synchronization
  //        is being done towards an HTTP connection (target) and the payload is passed to the server FTargetConnectionDefName
  //        becomes empty (while on the client side it is always valued).
  if not FTargetConnectionDefName.IsEmpty then
    io.Connections.ThreadUseClear;
end;

procedure TioCustomSynchroStrategy_Payload._SwitchToTargetConnection;
begin
  // If you are synchronizing with an http connection as the target and we are running on the client side
  //  (FTargetConnectionDefName is not empty) or the target connection is a normal non-http connection
  //  (so all the synchronization steps are performed on the client side) then select the connection specified
  //  precisely by the FTargetConnectionDefName field so that the object is persisted on this connection
  //  (normally it would persist on the local default connection, the normal client connection).
  //  If, however, you are synchronizing with an http connection as the target and we are running
  //  on the server side (FTargetConnectionDefName is empty) then it does not select any connection
  //  in particular but lets each object be loaded/persisted normally as set on the server.
  // Note: If FTargetConnectionDefName is empty then it means that we are on the server side of the synchronization,
  //        this is because the FTargetConnectionDefName field is set not to be serialized by DJSON so when synchronization
  //        is being done towards an HTTP connection (target) and the payload is passed to the server FTargetConnectionDefName
  //        becomes empty (while on the client side it is always valued).
  if not FTargetConnectionDefName.IsEmpty then
    io.Connections.ThreadUseConnection(FTargetConnectionDefName);
end;

{ TioCustomSynchroStrategy_LogItem }

constructor TioCustomSynchroStrategy_LogItem.Create;
begin
  FID := IO_INTEGER_NULL_VALUE;
  FSynchroName := IO_STRING_NULL_VALUE;
  FUserID := IO_INTEGER_NULL_VALUE;
  FUserName := IO_STRING_NULL_VALUE;
  FSynchroLevel := TioSynchroLevel.slIncremental;
  FSynchroStatus := TioSynchroStatus.ssInitialization;
  // Timing
  FStart := IO_DATETIME_NULL_VALUE;
  FLoadFromClient := IO_DATETIME_NULL_VALUE;
  FPersistToServer := IO_DATETIME_NULL_VALUE;
  FReloadFromServer := IO_DATETIME_NULL_VALUE;
  FPersistToClient := IO_DATETIME_NULL_VALUE;
  FCompleted := IO_DATETIME_NULL_VALUE;
end;

{ TioCustomSynchroStrategy_Thread }

constructor TioCustomSynchroStrategy_Thread.Create(AExecuteMethod, ATerminateMethod: TProc);
begin
  inherited Create(True);
  FExecuteMethod := AExecuteMethod;
  FTerminateMethod := ATerminateMethod;
  FExceptionMessage := String.Empty;
  Self.OnTerminate := OnTerminateEventHandler;
  Self.FreeOnTerminate := True;
end;

procedure TioCustomSynchroStrategy_Thread.Execute;
begin
  inherited;
  try
    FExecuteMethod;
  except
    on E: Exception do
    begin
      FExceptionMessage := E.Message;
      raise;
    end;
  end;
end;

procedure TioCustomSynchroStrategy_Thread.OnTerminateEventHandler(Sender: TObject);
var
  LExceptionMessage: String;
begin
  // Execute the terminate anonymous method
  if Assigned(FTerminateMethod) then
    FTerminateMethod;
  // If an exception was raised during the execution of the thread then load the error message into a local variable
  //  (otherwise I had problems) and then raise a new exception with the same message so that it comes out to the user too.
  // note: The new exception is raised decoupled with a Timer because I had problems otherwise.
  if not FExceptionMessage.IsEmpty then
  begin
    LExceptionMessage := FExceptionMessage;
    // TODO: Probabilmente ci saranno dei problemi con uniGUI, controllare
    TioAnonymousTimer.Create(100, function: Boolean
      begin
        raise EioException.Create(LExceptionMessage);
      end);
  end;
end;

end.

