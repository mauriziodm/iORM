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
  iORM.Auth.Interfaces;

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

  TioApplicationRef = class of TioApplication;
  TioApplication = class abstract
  private
    class var FConcreteClass_NoDirectCall: TioApplicationRef;
  protected
    // --------- methods to be ovverrided by descendants ----------
    class procedure _ClearSession; virtual; abstract;
    class function _GetSession: IioAuthSession; virtual; abstract;
    class procedure _HandleException(const Sender: TObject); virtual; abstract;
    class function _ProjectPlatform: TioProjectPlatform; virtual; abstract;
    class procedure _ShowMessage(const AMessage: string); virtual; abstract;
    class function _Terminate: Boolean; virtual; abstract;
    // --------- methods to be ovverrided by descendants ----------
    class function GetConcreteClass: TioApplicationRef;
    class procedure SetConcreteClass(const AClass: TioApplicationRef);
  public
    class procedure CheckIfAbstractionLayerComponentExists; inline;
    class procedure ClearSession; inline;
    class procedure HandleException(const Sender: TObject); inline;
    class function ProjectPlatform: TioProjectPlatform; inline;
    class function Session: IioAuthSession; inline;
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
  GetConcreteClass;
end;

class procedure TioApplication.ClearSession;
begin
  GetConcreteClass._ClearSession;
end;

class function TioApplication.GetConcreteClass: TioApplicationRef;
begin
  if not Assigned(FConcreteClass_NoDirectCall) then
    raise EioGenericException.Create(Self.ClassName, 'GetConcreteClass', 'You must put one of the TioVCL or TioFMX components somewhere in the application.');
  Result := FConcreteClass_NoDirectCall;
end;

class function TioApplication.Session: IioAuthSession;
begin
  Result := GetConcreteClass._GetSession;
end;

// TODO: Da eliminare?
//class function TioApplication.GetSession: IioAuthSession;
//begin
//  Result := FSessionContainer.Items[GetSessionID];
//end;

    // TODO: Da eliminare?
//class function TioApplication.GetSessionID: String;
//begin
//  Result := GetConcreteClass._GetSessionID;
//end;

class procedure TioApplication.HandleException(const Sender: TObject);
begin
  GetConcreteClass._HandleException(Sender);
end;

class function TioApplication.ProjectPlatform: TioProjectPlatform;
begin
  Result := GetConcreteClass._ProjectPlatform;
end;

    // TODO: Da eliminare?
//class procedure TioApplication.SetSession(const AUserID: Integer; const AUserName, AUserToken, AConnectionName: String; const AExpires: TDateTime);
//begin
//  FSessionContainer.Remove(GetSessionID);
//  FSessionContainer.Add(GetSessionID, TioAuthFactory.NewSession(AUserID, AUserName, AUserToken, AConnectionName, AExpires));
//end;

    // TODO: Da eliminare?
//class procedure TioApplication.SetSession(const AUser: IioAuthUser; const AUserToken, AConnectionName: String; const AExpires: TDateTime);
//begin
//  SetSession(AUser.ID, AUser.LoginUserName, AUserToken, AConnectionName, AExpires);
//end;

    // TODO: Da eliminare?
//class procedure TioApplication.SetSession(const AUserName, AUserToken, AConnectionName: String; const AExpires: TDateTime);
//begin
//  SetSession(IO_INTEGER_NULL_VALUE, AUserName, AUserToken, AConnectionName, AExpires);
//end;

    // TODO: Da eliminare?
//class procedure TioApplication.RemoveSession;
//begin
//  FSessionContainer.Remove(GetSessionID);
//end;

class procedure TioApplication.SetConcreteClass(const AClass: TioApplicationRef);
begin
  FConcreteClass_NoDirectCall := AClass;
end;

class procedure TioApplication.ShowMessage(const AMessage: string);
begin
  GetConcreteClass._ShowMessage(AMessage);
end;

class function TioApplication.Terminate: Boolean;
begin
  Result := GetConcreteClass._Terminate;
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

end.
