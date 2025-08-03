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
  System.Generics.Collections, iORM.Abstraction.SessionData.Interfaces,
  iORM.PersistenceStrategy.Interfaces,
  iORM.Auth.Interfaces;

type

  TioProjectPlatform = (ppVCL, ppFMX, ppUniGUI);

  // show-hide wait related methods
  TioShowWaitMethod = reference to Procedure;
  TioHideWaitMethod = reference to Procedure;

  TioCustomPlatformAbstractionComponent = class(TComponent)
  private
    // Methods
    function Get_Version: String;
  published
    // properties
    property _Version: String read Get_Version;
  end;

  TioThreadSessionDataContainer = TDictionary<TThreadID, IioSessionData>;
  TioCustomSessionDataStoreRef = class of TioCustomSessionDataStore;
  TioCustomSessionDataStore = class abstract
  private
    class var FDefaultConnection: String;
    class var FThreadSessionData: TioThreadSessionDataContainer;
    class function _InternalGetCurrentConnectionName: String; inline;
  protected
    class function _ClearMainSessionData: IioSessionData; virtual; abstract;
    class function _GetMainSessionData: IioSessionData; virtual; abstract;
    class function _GetThreadSessionData(const CreateIfNotExists: Boolean): IioSessionData; inline;
    class function _GetThreadOrMainSessionData(const RaiseIfNoSessionExists: Boolean): IioSessionData; inline;
  public
    class procedure _Initialize; virtual;
    class procedure _Finalize; virtual;
    // thread safe
    class procedure _Lock; inline;
    class procedure _Unlock; inline;
    class procedure Release;
    // fill persistence strategy request
    class procedure _FillPersistenceStrategyRequest(const APersistenceStrategyRequest: IioPersistenceStrategyRequest);
    // current connection
    class function IsEmptyConnectionName(const AConnectionName: String): Boolean; inline;
    class function GetCurrentConnectionName: String;
    class function GetCurrentConnectionNameIfEmpty(const AConnectionName: String): String;
    // main session data
    class function AcquireMainSessionData: IioSessionData;
    class procedure ClearMainSessionData;
    class procedure SetMainSessionConnection(const Value: String);
    // thread session data
    class function AcquireNewThreadSessionData: IioSessionData;
    class procedure ClearThreadSessionData;
    class procedure SetThreadSessionConnection(const Value: String);
    // thread or main session data
    class function _CloneThreadOrMainSessionData: IioSessionData;
    // default connection
    class function GetDefaultConnection: String;
    class procedure SetDefaultConnection(const Value: String);
    class procedure SetDefaultConnectionIfEmpty(const AConnectionName: String);
  end;

  TioSimpleSessionDataStore = class(TioCustomSessionDataStore)
  private
    class var FMainSessionData: IioSessionData;
  protected
    class function _ClearMainSessionData: IioSessionData; override;
    class function _GetMainSessionData: IioSessionData; override;
  public
    class procedure _Initialize; override;
  end;

  TioApplicationRef = class of TioApplication;
  TioApplication = class abstract
  private
    class var _FConcreteClass_NoDirectCall: TioApplicationRef;
    class var FHideWaitMethod: TioHideWaitMethod;
    class var FShowWaitMethod: TioShowWaitMethod;
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
    class var _FAuthTokenProviderMethod_NoDirectCall: TioAuthTokenProviderMethod; // public for inline, do not use directly
    class var _FAuthDecisionMethod_InternalUse: TioAuthDecisionMethod;
    class constructor Create;
    class function _GetConcreteClass_NoDirectCall: TioApplicationRef; // public for inline, do not use directly
    class procedure CheckIfAbstractionLayerComponentExists; inline;
    class procedure HandleException(const Sender: TObject); inline;
    class function ProjectPlatform: TioProjectPlatform; inline;
    class function SessionDataStore: TioCustomSessionDataStoreRef; inline;
    class procedure ShowMessage(const AMessage: string); inline;
    class function Terminate: Boolean; inline;
    // Show-Hide Wait related methods
    class procedure SetWaitMethods(const AShowWaitMethod: TioShowWaitMethod; const AHideWaitMethod: TioHideWaitMethod); static;
    class procedure ShowWait; static;
    class procedure HideWait; static;
    // Access-token related methods
    class procedure SetAuthMethods(const AAuthTokenProviderMethod: TioAuthTokenProviderMethod; const AAuthDecisionMethod: TioAuthDecisionMethod); static;
    class function ProvideAuthToken: String; static;
    class function ProvideAuthDecisionCRUD(const AAuthDecisionRequest: IioAuthDecisionRequest): Boolean; static; inline;
    class function ProvideAuthDecisionUI(const ATypeName: String; const AActionType: TioPersistenceActionType; const AIntent: TioPersistenceIntentType; const AForceAuthDecision: Boolean): Boolean; static;
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
  iORM.Exceptions, iORM, iORM.Utilities, iORM.Abstraction.Factory, iORM.Auth.Factory;

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
    raise EioGenericException.Create(Self.ClassName, 'GetConcreteClass', 'You must put one of the TioVCL, TioFMX or TioUniGUI components somewhere in the application.');
  Result := _FConcreteClass_NoDirectCall;
end;

class constructor TioApplication.Create;
begin
  _FConcreteClass_NoDirectCall := nil;
  FHideWaitMethod := nil;
  FShowWaitMethod := nil;
  SetAuthMethods(nil, nil);
end;

class procedure TioApplication.HandleException(const Sender: TObject);
begin
  _GetConcreteClass_NoDirectCall._HandleException(Sender);
end;

class procedure TioApplication.HideWait;
begin
  if Assigned(FHideWaitMethod) then
    FHideWaitMethod;
end;

class function TioApplication.ProjectPlatform: TioProjectPlatform;
begin
  Result := _GetConcreteClass_NoDirectCall._ProjectPlatform;
end;

class function TioApplication.ProvideAuthToken: String;
begin
  Result := _FAuthTokenProviderMethod_NoDirectCall;
end;

class procedure TioApplication._SetConcreteClass(const AClass: TioApplicationRef);
begin
  _FConcreteClass_NoDirectCall := AClass;
end;

class function TioApplication.SessionDataStore: TioCustomSessionDataStoreRef;
begin
  Result := _FConcreteSessionDataStoreClass_NoDirectCall;
end;

class procedure TioApplication.SetAuthMethods(const AAuthTokenProviderMethod: TioAuthTokenProviderMethod; const AAuthDecisionMethod: TioAuthDecisionMethod);
begin
  _FAuthTokenProviderMethod_NoDirectCall := AAuthTokenProviderMethod;
  _FAuthDecisionMethod_InternalUse := AAuthDecisionMethod;

  // set the token provider method
  if Assigned(AAuthTokenProviderMethod) then
    _FAuthTokenProviderMethod_NoDirectCall := AAuthTokenProviderMethod
  else
  begin
    _FAuthTokenProviderMethod_NoDirectCall := function: String
      begin
        Result := String.Empty;
      end;
  end;
  // set the token validate method
  if Assigned(AAuthDecisionMethod) then
    _FAuthDecisionMethod_InternalUse := AAuthDecisionMethod
  else
  begin
    _FAuthDecisionMethod_InternalUse := function(const AValidationRequest: IioAuthDecisionRequest): Boolean
      begin
        Result := True;
      end;
  end;
end;

class procedure TioApplication.SetWaitMethods(const AShowWaitMethod: TioShowWaitMethod; const AHideWaitMethod: TioHideWaitMethod);
begin
  FShowWaitMethod := AShowWaitMethod;
  FHideWaitMethod := AHideWaitMethod;
end;

class procedure TioApplication.ShowMessage(const AMessage: string);
begin
  _GetConcreteClass_NoDirectCall._ShowMessage(AMessage);
end;

class procedure TioApplication.ShowWait;
begin
  if Assigned(FShowWaitMethod) then
    FShowWaitMethod;
end;

class function TioApplication.Terminate: Boolean;
begin
  Result := _GetConcreteClass_NoDirectCall._Terminate;
end;

class function TioApplication.ProvideAuthDecisionCRUD(const AAuthDecisionRequest: IioAuthDecisionRequest): Boolean;
begin
  Result := AAuthDecisionRequest.IsAuthorized;
end;

class function TioApplication.ProvideAuthDecisionUI(const ATypeName: String; const AActionType: TioPersistenceActionType; const AIntent: TioPersistenceIntentType; const AForceAuthDecision: Boolean): Boolean;
begin
  Result :=  TioAuthFactory.NewDecisionRequestUI(ATypeName, AActionType, AIntent, AForceAuthDecision).IsAuthorized;
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

function TioCustomPlatformAbstractionComponent.Get_Version: String;
begin
  Result := io.Version;
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

class function TioCustomSessionDataStore.AcquireMainSessionData: IioSessionData;
begin
  _Lock;
  Result := _GetMainSessionData;
end;

class procedure TioCustomSessionDataStore.ClearMainSessionData;
begin
  _Lock;
  try
    _ClearMainSessionData;
  finally
    _Unlock;
  end;
end;

class function TioCustomSessionDataStore.GetCurrentConnectionName: String;
begin
  _Lock;
  try
    Result := _InternalGetCurrentConnectionName;
  finally
    _Unlock;
  end;
end;

class function TioCustomSessionDataStore._InternalGetCurrentConnectionName: String;
var
  LSessionData: IioSessionData;
begin
  LSessionData := _GetThreadOrMainSessionData(False);
  if Assigned(LSessionData) and not IsEmptyConnectionName(LSessionData.Connection) then
    Result := LSessionData.Connection
  else
    Result := FDefaultConnection;
end;

class function TioCustomSessionDataStore.GetCurrentConnectionNameIfEmpty(const AConnectionName: String): String;
begin
  if IsEmptyConnectionName(AConnectionName) then
  begin
    _Lock;
    try
      Result := _InternalGetCurrentConnectionName
    finally
      _Unlock;
    end;
  end
  else
    Result := AConnectionName;
end;

class function TioCustomSessionDataStore.GetDefaultConnection: String;
begin
  _Lock;
  try
    Result := FDefaultConnection;
  finally
    _Unlock;
  end;
end;

class procedure TioCustomSessionDataStore._FillPersistenceStrategyRequest(const APersistenceStrategyRequest: IioPersistenceStrategyRequest);
var
  LSessionData: IioSessionData;
begin
  _Lock;
  try
    LSessionData := _GetThreadOrMainSessionData(True);
    // access-token
    APersistenceStrategyRequest.Token := TioApplication.ProvideAuthToken;
    // app
    APersistenceStrategyRequest.App := LSessionData.App;
    APersistenceStrategyRequest.AppOID := LSessionData.AppOID;
    // connection
    if IsEmptyConnectionName(LSessionData.Connection) then
      APersistenceStrategyRequest.Connection := FDefaultConnection
    else
      APersistenceStrategyRequest.Connection := LSessionData.Connection;
    // connection remote
    APersistenceStrategyRequest.ConnectionRemote := LSessionData.ConnectionRemote;
    // license
    APersistenceStrategyRequest.Lic := LSessionData.License;
    APersistenceStrategyRequest.LicOID := LSessionData.LicenseOID;
    // user
    APersistenceStrategyRequest.Usr := LSessionData.User;
    APersistenceStrategyRequest.UsrOID := LSessionData.UserOID;
  finally
    _Unlock;
  end;
end;

class procedure TioCustomSessionDataStore.Release;
begin
  _Unlock;
end;

class procedure TioCustomSessionDataStore.SetDefaultConnection(const Value: String);
begin
  _Lock;
  try
    FDefaultConnection := Value;
  finally
    _Unlock;
  end;
end;

class function TioCustomSessionDataStore.AcquireNewThreadSessionData: IioSessionData;
begin
  _Lock;
  Result := _GetThreadSessionData(True);
end;

class procedure TioCustomSessionDataStore.ClearThreadSessionData;
begin
  _Lock;
  try
    FThreadSessionData.Remove(TioUtilities.GetThreadID);
  finally
    _Unlock;
  end;
end;

class function TioCustomSessionDataStore._CloneThreadOrMainSessionData: IioSessionData;
begin
  _Lock;
  try
    Result := _GetThreadOrMainSessionData(True).Clone;
  finally
    _UnLock;
  end;
end;

class procedure TioCustomSessionDataStore.SetDefaultConnectionIfEmpty(const AConnectionName: String);
begin
  _Lock;
  try
    if IsEmptyConnectionName(FDefaultConnection) then
      FDefaultConnection := AConnectionName;
  finally
    _UnLock;
  end;
end;

class procedure TioCustomSessionDataStore.SetMainSessionConnection(const Value: String);
begin
  _Lock;
  try
    _GetMainSessionData.Connection := Value;
  finally
    _Unlock;
  end;
end;

class procedure TioCustomSessionDataStore.SetThreadSessionConnection(const Value: String);
begin
  _Lock;
  try
    _GetThreadSessionData(True).Connection;
  finally
    _Unlock;
  end;
end;

class procedure TioCustomSessionDataStore._Finalize;
begin
  FThreadSessionData.Free;
end;

class function TioCustomSessionDataStore._GetThreadOrMainSessionData(const RaiseIfNoSessionExists: Boolean): IioSessionData;
begin
  if not FThreadSessionData.TryGetValue(TioUtilities.GetThreadID, Result) then
    Result := _GetMainSessionData;
  if RaiseIfNoSessionExists and not Assigned(Result) then
    raise EioGenericException.Create(ClassName, '_GetThreadOrMainSessionData', 'There is no session data');
end;

class function TioCustomSessionDataStore._GetThreadSessionData(const CreateIfNotExists: Boolean): IioSessionData;
begin
  if (not FThreadSessionData.TryGetValue(TioUtilities.GetThreadID, Result)) then
  begin
    if CreateIfNotExists then
    begin
      Result := AcquireMainSessionData.Clone;
      FThreadSessionData.Add(TioUtilities.GetThreadID, Result);
    end
    else
      raise EioGenericException.Create(ClassName, '_GetThreadSessionData', 'There is no session data for this thread id');
  end;
end;

class procedure TioCustomSessionDataStore._Initialize;
begin
  FDefaultConnection := IO_STRING_NULL_VALUE;
  FThreadSessionData := TioThreadSessionDataContainer.Create;
end;

class function TioCustomSessionDataStore.IsEmptyConnectionName(const AConnectionName: String): Boolean;
begin
  Result := (AConnectionName.IsEmpty or (AConnectionName = IO_CONNECTIONDEF_DEFAULTNAME));
end;

class procedure TioCustomSessionDataStore._Lock;
begin
  TMonitor.Enter(FThreadSessionData);
end;

class procedure TioCustomSessionDataStore._Unlock;
begin
  TMonitor.Exit(FThreadSessionData);
end;

{ TioSimpleSessionDataStore }

class function TioSimpleSessionDataStore._ClearMainSessionData: IioSessionData;
begin
  FMainSessionData.Clear;
end;

class function TioSimpleSessionDataStore._GetMainSessionData: IioSessionData;
begin
  Result := FMainSessionData;
end;

class procedure TioSimpleSessionDataStore._Initialize;
begin
  inherited;
  FMainSessionData := TioAbstractionFactory.NewSessionData;
end;

end.
