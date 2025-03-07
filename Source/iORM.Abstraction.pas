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
unit iORM.Abstraction;

interface

uses
  System.Classes, System.SysUtils, System.Rtti, iORM.CommonTypes,
  iORM.Auth.Interfaces, System.Generics.Collections,
  iORM.PersistenceStrategy.Interfaces;

type
  TioProjectPlatform = (ppVCL, ppFMX, ppUniGUI);

  TioCustomPlatformAbstractionComponent = class(TComponent)
  private
    // Events
    FHideWait: TNotifyEvent;
    FShowWait: TNotifyEvent;
    // Methods
    function Get_Version: String;
    procedure SetHideWait(const Value: TNotifyEvent);
    procedure SetShowWait(const Value: TNotifyEvent);
  public
    constructor Create(AOwner: TComponent); override;
  published
    // properties
    property _Version: String read Get_Version;
    // Events
    property HideWait: TNotifyEvent read FHideWait write SetHideWait;
    property ShowWait: TNotifyEvent read FShowWait write SetShowWait;
  end;

  TioThreadSessionDataContainer = TDictionary<TThreadID, IioAuthSessionData>;
  TioCustomSessionDataStoreRef = class of TioCustomSessionDataStore;
  TioCustomSessionDataStore = class abstract
  private
    class var FDefaultGlobalConnection: String;
    class var FThreadSessionData: TioThreadSessionDataContainer;
    class function _InternalGetCurrentConnectionName: String; inline;
    class function _GetThreadOrMainSessionData: IioAuthSessionData; inline;
    class function GetDefaultGlobalConnection: String; static;
    class procedure SetDefaultGlobalConnection(const AConnectionName: String); static;
  protected
    class procedure _Initialize; virtual;
    class procedure _Finalize; virtual;
    class procedure _Lock; inline;
    class procedure _Unlock; inline;
    class function _GetMainSessionData: IioAuthSessionData; virtual; abstract;
    class function _ClearMainSessionData: IioAuthSessionData; virtual; abstract;
  public
    class constructor Create;
    class destructor Destroy;
    // fill persistence strategy request
    class procedure _FillPersistenceStrategyRequest(const APersistenceStrategyRequest: IioPersistenceStrategyRequest); static;
    // current connection
    class function _GetCurrentConnectionName: String; static;
    class function _GetCurrentConnectionNameIfEmpty(const AConnectionName: String): String;
    class function _IsEmptyConnectionName(const AConnectionName: String): Boolean; inline;
    // main session data
    class function AcquireSessionData: IioAuthSessionData;
    class procedure ClearSessionData;
    class procedure ReleaseSessionData;
    // thread session data
    class function ThreadAcquireSessionData: IioAuthSessionData;
    class procedure ThreadClearSessionData;
    class procedure ThreadReleaseSessionData;
    class procedure ThreadUseConnection(const AConnectionName: String);
    // default connection
    class procedure _SetDefaultGlobalConnectionIfEmpty(const AConnectionName: String); static;
    class property DefaultGlobalConnection: String read GetDefaultGlobalConnection write SetDefaultGlobalConnection;
  end;

  TioSimpleSessionDataStore = class(TioCustomSessionDataStore)
  private
    class var FMainSessionData: IioAuthSessionData;
  protected
    class procedure _Initialize; override;
    class function _GetMainSessionData: IioAuthSessionData; override;
    class function _ClearMainSessionData: IioAuthSessionData; override;
  end;

  TioApplicationRef = class of TioApplication;
  TioApplication = class abstract
  private
    class var _FConcreteClass_NoDirectCall: TioApplicationRef;
  protected
    // --------- methods to be ovverrided by descendants ----------
    class function _GetSessionDataStore: TioCustomSessionDataStoreRef; virtual; abstract;
    class procedure _HandleException(const Sender: TObject); virtual; abstract;
    class function _ProjectPlatform: TioProjectPlatform; virtual; abstract;
    class procedure _ShowMessage(const AMessage: string); virtual; abstract;
    class function _Terminate: Boolean; virtual; abstract;
    // --------- methods to be ovverrided by descendants ----------
    class procedure _SetConcreteClass(const AClass: TioApplicationRef);
  public
    class var _FConcreteSessionDataStoreClass_NoDirectCall: TioCustomSessionDataStoreRef; // public for inline, do not use directly
    class function _GetConcreteClass_NoDirectCall: TioApplicationRef; // public for inline, do not use directly
    class procedure CheckIfAbstractionLayerComponentExists; inline;
    class procedure HandleException(const Sender: TObject); inline;
    class function ProjectPlatform: TioProjectPlatform; inline;
    class function SessionDataStore: TioCustomSessionDataStoreRef; inline;
    class procedure ShowMessage(const AMessage: string); inline;
    class function Terminate: Boolean; inline;
  end;

  TioControlRef = class of TioControl;
  TioControl = class abstract
  private
    class var FConcreteClass_NoDirectCall: TioControlRef;
  protected
    class function GetConcreteClass: TioControlRef;
    class procedure SetConcreteClass(const AClass: TioControlRef);
    class procedure _SetParent(const AControl, AParent: TObject); virtual; abstract;
    class procedure _SetVisible(const AControl: TObject; const AVisible: Boolean); virtual; abstract;
  public
    class procedure SetParent(const AControl, AParent: TObject);
    class procedure SetVisible(const AControl: TObject; const AVisible: Boolean);
  end;

  TioTimerRef = class of TioTimer;
  TioTimer = class abstract
  private
    class var FConcreteClass_NoDirectCall: TioTimerRef;
  protected
    class function GetConcreteClass: TioTimerRef;
    class procedure SetConcreteClass(const AClass: TioTimerRef);
    function GetEnabled: Boolean; virtual;
    function GetInterval: Cardinal; virtual;
    function GetOnTimer: TNotifyEvent; virtual;
    function GetTag: Integer; virtual;
    procedure SetEnabled(const Value: Boolean); virtual;
    procedure SetInterval(const Value: Cardinal); virtual;
    procedure SetOnTimer(const Value: TNotifyEvent); virtual;
    procedure SetTag(const Value: Integer); virtual;
  public
    class function CreateNewTimer: TioTimer;
    constructor Create; virtual;
    property Enabled: Boolean read GetEnabled write SetEnabled default False;
    property Interval: Cardinal read GetInterval write SetInterval default 1000;
    property OnTimer: TNotifyEvent read GetOnTimer write SetOnTimer;
    property Tag:Integer read GetTag write SetTag;
  end;

  TioAnonymousTimer = class
  private
    FTimer: TioTimer;
    FExecuteMethod: TFunc<boolean>;
    procedure OnTimerEventHandler(Sender: TObject);
  public
    constructor Create(const AIntervalMillisec: Integer; const AExecuteMethod: TFunc<boolean>);
    destructor Destroy; override;
  end;

  TioDeferred = class(TThread)
  strict private
    FDelayedMethod: TProc;
    FIntervalMillisec: Integer;
  strict protected
    constructor Create(const AIntervalMillisec: Integer; ADelayedMethod: TProc); reintroduce;
    procedure Execute; override;
    procedure OnTerminateEventHandler(Sender: TObject);
  public
    class procedure Exec(const AIntervalMillisec: Integer; ADelayedMethod: TProc);
  end;

  TioActionRef = class of TioAction;
  TioAction = class(TComponent)
  private
    class var FConcreteClass_NoDirectCall: TioActionRef;
  protected
    class function _CreateNewAction(const AOwner:TComponent): TioAction; overload; virtual; abstract;
    class function _CreateNewAction(const AOwner:TComponent; const AAction: TObject): TioAction; overload; virtual; abstract;
    class function _IsValid(const AField: TRttiField): Boolean; virtual; abstract;
    class function GetConcreteClass: TioActionRef;
    class procedure SetConcreteClass(const AClass: TioActionRef);
    function GetCaption: string; virtual; abstract;
    function GetChecked: boolean; virtual; abstract;
    function GetEnabled: boolean; virtual; abstract;
    function GetGroupIndex: integer; virtual; abstract;
    function GetHint: string; virtual; abstract;
    function GetImageIndex: integer; virtual; abstract;
    function GetName: TComponentName; virtual; abstract;
    function GetVisible: boolean; virtual; abstract;
    function GetOnExecute: TNotifyEvent; virtual; abstract;
    function GetOnHint: THintEvent; virtual; abstract;
    function GetOnUpdate: TNotifyEvent; virtual; abstract;
    procedure SetCaption(const Value: string); virtual; abstract;
    procedure SetChecked(const Value: boolean); virtual; abstract;
    procedure SetEnabled(const Value: boolean); virtual; abstract;
    procedure SetGroupIndex(const Value: integer); virtual; abstract;
    procedure SetHint(const Value: string); virtual; abstract;
    procedure SetImageIndex(const Value: integer); virtual; abstract;
    procedure SetName(const Value: TComponentName); reintroduce; virtual; abstract;
    procedure SetVisible(const Value: boolean); virtual; abstract;
    procedure SetOnExecute(const Value: TNotifyEvent); virtual; abstract;
    procedure SetOnHint(const Value: THintEvent); virtual; abstract;
    procedure SetOnUpdate(const Value: TNotifyEvent); virtual; abstract;
  public
    class function CreateNewAction(const AOwner:TComponent): TioAction; overload;
    class function CreateNewAction(const AOwner:TComponent; const AAction: TObject): TioAction; overload;
    class function IsValidAction(const AField: TRttiField): Boolean;
    function Execute: Boolean; virtual; abstract;
    function AsTValue: TValue; virtual; abstract;
    property Caption:string read GetCaption write SetCaption;
    property Checked:boolean read GetChecked write SetChecked;
    property Enabled:boolean read GetEnabled write SetEnabled;
    property GroupIndex:integer read GetGroupIndex write SetGroupIndex;
    property Hint:string read GetHint write SetHint;
    property ImageIndex:integer read GetImageIndex write SetImageIndex;
    property Name:TComponentName read GetName write SetName;
    property Visible:boolean read GetVisible write SetVisible;
    property OnExecute:TNotifyEvent read GetOnExecute write SetOnExecute;
    property OnHint:THintEvent read GetOnHint write SetOnHint;
    property OnUpdate:TNotifyEvent read GetOnUpdate write SetOnUpdate;
  end;

implementation

uses
  iORM.Exceptions, iORM, iORM.Auth.Factory;

{ TioTimer }

constructor TioTimer.Create;
begin
  // Do nothing (prevent warning)
end;

class function TioTimer.CreateNewTimer: TioTimer;
begin
  Result := GetConcreteClass.Create;
end;

class function TioTimer.GetConcreteClass: TioTimerRef;
begin
  if not Assigned(FConcreteClass_NoDirectCall) then
    raise EioGenericException.Create(Self.ClassName, 'GetConcreteClass', 'You must put one of the TioVCL or TioFMX components somewhere in the application.');
  Result := FConcreteClass_NoDirectCall;
end;

function TioTimer.GetEnabled: Boolean;
begin
  // Do nothing (prevent warning)
  Result := False;
end;

function TioTimer.GetInterval: Cardinal;
begin
  // Do nothing (prevent warning)
  Result := 0;
end;

function TioTimer.GetOnTimer: TNotifyEvent;
begin
  // Do nothing (prevent warning)
end;

function TioTimer.GetTag: Integer;
begin
  // Do nothing (prevent warning)
  Result := 0;
end;

class procedure TioTimer.SetConcreteClass(const AClass: TioTimerRef);
begin
  FConcreteClass_NoDirectCall := AClass;
end;

procedure TioTimer.SetEnabled(const Value: Boolean);
begin
  // Do nothing (prevent warning)
end;

procedure TioTimer.SetInterval(const Value: Cardinal);
begin
  // Do nothing (prevent warning)
end;

procedure TioTimer.SetOnTimer(const Value: TNotifyEvent);
begin
  // Do nothing (prevent warning)
end;

procedure TioTimer.SetTag(const Value: Integer);
begin
  // Do nothing (prevent warning)
end;

{ TioApplication }

class procedure TioApplication.CheckIfAbstractionLayerComponentExists;
begin
  _GetConcreteClass_NoDirectCall;
end;

class function TioApplication._GetConcreteClass_NoDirectCall: TioApplicationRef;
begin
  if not Assigned(_FConcreteClass_NoDirectCall) then
    raise EioGenericException.Create(Self.ClassName, 'GetConcreteClass', 'You must put one of the TioVCL or TioFMX components somewhere in the application.');
  Result := _FConcreteClass_NoDirectCall;
end;

class procedure TioApplication.HandleException(const Sender: TObject);
begin
  _GetConcreteClass_NoDirectCall._HandleException(Sender);
end;

class function TioApplication.ProjectPlatform: TioProjectPlatform;
begin
  Result := _GetConcreteClass_NoDirectCall._ProjectPlatform;
end;

class procedure TioApplication._SetConcreteClass(const AClass: TioApplicationRef);
begin
  _FConcreteClass_NoDirectCall := AClass;
end;

class function TioApplication.SessionDataStore: TioCustomSessionDataStoreRef;
begin
  Result := _FConcreteSessionDataStoreClass_NoDirectCall;
end;

class procedure TioApplication.ShowMessage(const AMessage: string);
begin
  _GetConcreteClass_NoDirectCall._ShowMessage(AMessage);
end;

class function TioApplication.Terminate: Boolean;
begin
  Result := _GetConcreteClass_NoDirectCall._Terminate;
end;

{ TioAction }

class function TioAction.CreateNewAction(const AOwner: TComponent): TioAction;
begin
  Result := GetConcreteClass._CreateNewAction(AOwner)
end;

class function TioAction.CreateNewAction(const AOwner:TComponent; const AAction: TObject): TioAction;
begin
  Result := GetConcreteClass._CreateNewAction(AOwner, AAction)
end;

class function TioAction.GetConcreteClass: TioActionRef;
begin
  if not Assigned(FConcreteClass_NoDirectCall) then
    raise EioGenericException.Create(Self.ClassName, 'GetConcreteClass', 'You must put one of the TioVCL or TioFMX components somewhere in the application.');
  Result := FConcreteClass_NoDirectCall;
end;

class function TioAction.IsValidAction(const AField: TRttiField): Boolean;
begin
  Result := GetConcreteClass._IsValid(AField);
end;

class procedure TioAction.SetConcreteClass(const AClass: TioActionRef);
begin
  FConcreteClass_NoDirectCall := AClass;
end;

{ TioControl }

class function TioControl.GetConcreteClass: TioControlRef;
begin
  if not Assigned(FConcreteClass_NoDirectCall) then
    raise EioGenericException.Create(Self.ClassName, 'GetConcreteClass', 'You must put one of the TioVCL or TioFMX components somewhere in the application.');
  Result := FConcreteClass_NoDirectCall;
end;

class procedure TioControl.SetConcreteClass(const AClass: TioControlRef);
begin
  FConcreteClass_NoDirectCall := AClass;
end;

class procedure TioControl.SetParent(const AControl, AParent: TObject);
begin
  FConcreteClass_NoDirectCall._SetParent(AControl, AParent);
end;

class procedure TioControl.SetVisible(const AControl: TObject; const AVisible: Boolean);
begin
  FConcreteClass_NoDirectCall._SetVisible(AControl, AVisible);
end;

{ TioAnonymousTimer }

constructor TioAnonymousTimer.Create(const AIntervalMillisec: Integer; const AExecuteMethod: TFunc<boolean>);
begin
  FTimer := TioTimer.CreateNewTimer;
  FTimer.Enabled := False;
  FTimer.OnTimer := OnTimerEventHandler;
  FTimer.Interval := AIntervalMillisec;
  if not Assigned(AExecuteMethod) then
    raise EioGenericException.Create(Self.ClassName, 'Constructor', '"AExecuteMethod" parameter must be assigned');
  FExecuteMethod := AExecuteMethod;
  FTimer.Enabled := True;
end;

destructor TioAnonymousTimer.Destroy;
begin
  FTimer.Free;
  inherited;
end;

procedure TioAnonymousTimer.OnTimerEventHandler(Sender: TObject);
begin
  FTimer.Enabled := False; // NB: Leave it to false
  try
    FTimer.Enabled := FExecuteMethod;
  finally
    if not FTimer.Enabled then
      Self.Free;
  end;
end;

{ TioCustomPlatformAbstractionComponent }

constructor TioCustomPlatformAbstractionComponent.Create(AOwner: TComponent);
begin
  inherited;
  FShowWait := nil;
  FHideWait := nil;
end;

function TioCustomPlatformAbstractionComponent.Get_Version: String;
begin
  Result := io.Version;
end;

procedure TioCustomPlatformAbstractionComponent.SetHideWait(const Value: TNotifyEvent);
begin
  FHideWait := Value;
  if Assigned(FHideWait) then
    io.Connections.SetHideWaitProc(
      procedure
      begin
        FHideWait(Self);
      end)
  else
    io.Connections.SetHideWaitProc(nil);
end;

procedure TioCustomPlatformAbstractionComponent.SetShowWait(const Value: TNotifyEvent);
begin
  FShowWait := Value;
  if Assigned(FShowWait) then
    io.Connections.SetShowWaitProc(
      procedure
      begin
        FShowWait(Self);
      end)
  else
    io.Connections.SetShowWaitProc(nil);
end;

{ TioDelayedExec }

constructor TioDeferred.Create(const AIntervalMillisec: Integer; ADelayedMethod: TProc);
begin
  inherited Create(False);
  FIntervalMillisec := AIntervalMillisec;
  FDelayedMethod := ADelayedMethod;
  OnTerminate := OnTerminateEventHandler;
  FreeOnTerminate := True;
end;

procedure TioDeferred.Execute;
begin
  inherited;
  Sleep(FIntervalMillisec);
end;

class procedure TioDeferred.Exec(const AIntervalMillisec: Integer; ADelayedMethod: TProc);
begin
  TioDeferred.Create(AIntervalMillisec, ADelayedMethod);
end;

procedure TioDeferred.OnTerminateEventHandler(Sender: TObject);
begin
  if Assigned(FDelayedMethod) then
    FDelayedMethod;
end;

{ TioCustomSessionDataStore }

class function TioCustomSessionDataStore.AcquireSessionData: IioAuthSessionData;
begin
  _Lock;
  Result := _GetMainSessionData;
end;

class procedure TioCustomSessionDataStore.ClearSessionData;
begin
  _Lock;
  try
    _ClearMainSessionData;
  finally
    _Unlock;
  end;
end;

class constructor TioCustomSessionDataStore.Create;
begin
  _Initialize;
end;

class destructor TioCustomSessionDataStore.Destroy;
begin
  _Finalize;
end;

class function TioCustomSessionDataStore._GetCurrentConnectionName: String;
begin
  _Lock;
  try
    _InternalGetCurrentConnectionName;
  finally
    _Unlock;
  end;
end;

class function TioCustomSessionDataStore._InternalGetCurrentConnectionName: String;
begin
  Result := _GetThreadOrMainSessionData.Connection;
  if _IsEmptyConnectionName(Result) then
    Result := FDefaultGlobalConnection;
end;

class function TioCustomSessionDataStore._GetCurrentConnectionNameIfEmpty(const AConnectionName: String): String;
begin
  _Lock;
  try
    if _IsEmptyConnectionName(AConnectionName) then
      Result := _InternalGetCurrentConnectionName
    else
      Result := AConnectionName;
  finally
    _Unlock;
  end;
end;

class procedure TioCustomSessionDataStore._FillPersistenceStrategyRequest(const APersistenceStrategyRequest: IioPersistenceStrategyRequest);
var
  LSessionData: IioAuthSessionData;
begin
  _Lock;
  try
    LSessionData := _GetThreadOrMainSessionData;
    // app
    APersistenceStrategyRequest.App := LSessionData.App;
    APersistenceStrategyRequest.AppOID := LSessionData.AppOID;
    // connection
    if _IsEmptyConnectionName(LSessionData.Connection)
      APersistenceStrategyRequest.Connection := FDefaultGlobalConnection
    else
      APersistenceStrategyRequest.Connection := LSessionData.Connection;
    // remote connection
    APersistenceStrategyRequest.ConnectionRemote := LSessionData.ConnectionRemote;
    // user
    APersistenceStrategyRequest.User := LSessionData.User;
    APersistenceStrategyRequest.UserOID := LSessionData.UserOID;
    // auth
    APersistenceStrategyRequest.AuthToken := LSessionData.AccessToken;
  finally
    _Unlock;
  end;
end;

class function TioCustomSessionDataStore.GetDefaultGlobalConnection: String;
begin
  _Lock;
  try
    Result := FDefaultGlobalConnection;
  finally
    _Unlock;
  end;
end;

class procedure TioCustomSessionDataStore.ReleaseSessionData;
begin
  _Unlock;
end;

class procedure TioCustomSessionDataStore.SetDefaultGlobalConnection(const AConnectionName: String);
begin
  _Lock;
  try
    FDefaultGlobalConnection := AConnectionName;
    _GetMainSessionData.Connection := AConnectionName;
  finally
    _Unlock;
  end;
end;

class function TioCustomSessionDataStore.ThreadAcquireSessionData: IioAuthSessionData;
var
  LThreadID: TThreadID;
begin
  LThreadID := TioUtilities.GetThreadID;
  _Lock;
  if not FThreadSessionData.TryGetValue(LThreadID, Result) then
  begin
    Result := AcquireSessionData.Clone;
    FThreadSessionData.Add(LThreadID, Result);
  end;
end;

class procedure TioCustomSessionDataStore.ThreadClearSessionData;
begin
  _Lock;
  try
    FThreadSessionData.Remove(TioUtilities.GetThreadID);
  finally
    _Unlock;
  end;
end;

class procedure TioCustomSessionDataStore.ThreadReleaseSessionData;
begin
  _Unlock;
end;

class procedure TioCustomSessionDataStore.ThreadUseConnection(const AConnectionName: String);
var
  LSessionData: IioAuthSessionData;
begin
  LSessionData := ThreadAcquireSessionData;
  try
    LSessionData.Connection := AConnectionName;
  finally
    TioApplication.SessionDataStore.ThreadReleaseSessionData;
  end;
end;

class function TioCustomSessionDataStore._SetDefaultGlobalConnectionIfEmpty(const AConnectionName: String): Boolean;
begin
  _Lock;
  try
    if _IsEmptyConnectionName(FDefaultGlobalConnection) then
      FDefaultGlobalConnection := AConnectionName;
  finally
    _UnLock;
  end;
end;

class procedure TioCustomSessionDataStore._Finalize;
begin
  FThreadSessionData.Free;
end;

class function TioCustomSessionDataStore._GetThreadOrMainSessionData: IioAuthSessionData;
begin
  if not FThreadSessionData.TryGetValue(TioUtilities.GetThreadID, Result) then
    Result := _GetMainSessionData;
end;

class procedure TioCustomSessionDataStore._Initialize;
begin
  FDefaultGlobalConnection := IO_STRING_NULL_VALUE;
  FThreadSessionData := TioThreadSessionDataContainer.Create;
end;

class function TioCustomSessionDataStore._IsEmptyConnectionName(const AConnectionName: String): Boolean;
begin
  Result := (AConnectionName.IsEmpty or (AConnectionName = IO_CONNECTIONDEF_DEFAULTNAME));
end;

class procedure TioCustomSessionDataStore._Lock;
begin
  TMonitor.Enter(FConnectionManagerContainer);
end;

class procedure TioCustomSessionDataStore._Unlock;
begin
  TMonitor.Exit(FConnectionManagerContainer);
end;

{ TioSimpleSessionDataStore }

class function TioSimpleSessionDataStore._ClearMainSessionData: IioAuthSessionData;
begin
  FMainSessionData.Clear;
end;

class function TioSimpleSessionDataStore._GetMainSessionData: IioAuthSessionData;
begin
  Result := FMainSessionData;
end;

class procedure TioSimpleSessionDataStore._Initialize;
begin
  inherited;
  FMainSessionData := TioAuthFactory.NewAuthSessionData;
end;

end.
