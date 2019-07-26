{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2015-2016 Maurizio Del Magno                      }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  This file is part of iORM (Interfaced Object Relational Mapper).         }
{                                                                           }
{  Licensed under the GNU Lesser General Public License, Version 3;         }
{  you may not use this file except in compliance with the License.         }
{                                                                           }
{  iORM is free software: you can redistribute it and/or modify             }
{  it under the terms of the GNU Lesser General Public License as published }
{  by the Free Software Foundation, either version 3 of the License, or     }
{  (at your option) any later version.                                      }
{                                                                           }
{  iORM is distributed in the hope that it will be useful,                  }
{  but WITHOUT ANY WARRANTY; without even the implied warranty of           }
{  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            }
{  GNU Lesser General Public License for more details.                      }
{                                                                           }
{  You should have received a copy of the GNU Lesser General Public License }
{  along with iORM.  If not, see <http://www.gnu.org/licenses/>.            }
{                                                                           }
{***************************************************************************}





unit iORM.AbstractionLayer.Framework;

interface

uses
  System.Classes, System.Rtti;

type
  TioApplicationRef = class of TioApplication;
  TioApplication = class abstract
  private
    class var FConcreteClass_NoDirectCall: TioApplicationRef;
  protected
    class function GetConcreteClass: TioApplicationRef;
    class procedure SetConcreteClass(const AClass: TioApplicationRef);
    class procedure _HandleException(const Sender: TObject); virtual; abstract;
    class function _Terminate: Boolean; virtual; abstract;
  public
    class procedure CheckIfAbstractionLayerComponentExists;
    class procedure HandleException(const Sender: TObject);
    class function Terminate: Boolean;
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
    function GetEnabled: Boolean; virtual; abstract;
    function GetInterval: Cardinal; virtual; abstract;
    function GetOnTimer: TNotifyEvent; virtual; abstract;
    function GetTag: Integer; virtual; abstract;
    procedure SetEnabled(const Value: Boolean); virtual; abstract;
    procedure SetInterval(const Value: Cardinal); virtual; abstract;
    procedure SetOnTimer(const Value: TNotifyEvent); virtual; abstract;
    procedure SetTag(const Value: Integer); virtual; abstract;
  public
    class function CreateNewTimer: TioTimer;
    constructor Create; virtual; abstract;
    property Enabled: Boolean read GetEnabled write SetEnabled default True;
    property Interval: Cardinal read GetInterval write SetInterval default 1000;
    property OnTimer: TNotifyEvent read GetOnTimer write SetOnTimer;
    property Tag:Integer read GetTag write SetTag;
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
  iORM.Exceptions;

{ TioTimer }

class function TioTimer.CreateNewTimer: TioTimer;
begin
  Result := GetConcreteClass.Create;
end;

class function TioTimer.GetConcreteClass: TioTimerRef;
begin
  if not Assigned(FConcreteClass_NoDirectCall) then
    raise EioException.Create(Self.ClassName, 'GetConcreteClass', 'You must put one of the TioVCL or TioFMX components somewhere in the application.');
  Result := FConcreteClass_NoDirectCall;
end;

class procedure TioTimer.SetConcreteClass(const AClass: TioTimerRef);
begin
  FConcreteClass_NoDirectCall := AClass;
end;

{ TioApplication }

class procedure TioApplication.CheckIfAbstractionLayerComponentExists;
begin
  GetConcreteClass;
end;

class function TioApplication.GetConcreteClass: TioApplicationRef;
begin
  if not Assigned(FConcreteClass_NoDirectCall) then
    raise EioException.Create(Self.ClassName, 'GetConcreteClass', 'You must put one of the TioVCL or TioFMX components somewhere in the application.');
  Result := FConcreteClass_NoDirectCall;
end;

class procedure TioApplication.HandleException(const Sender: TObject);
begin
  GetConcreteClass._HandleException(Sender);
end;

class procedure TioApplication.SetConcreteClass(const AClass: TioApplicationRef);
begin
  FConcreteClass_NoDirectCall := AClass;
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
    raise EioException.Create(Self.ClassName, 'GetConcreteClass', 'You must put one of the TioVCL or TioFMX components somewhere in the application.');
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
    raise EioException.Create(Self.ClassName, 'GetConcreteClass', 'You must put one of the TioVCL or TioFMX components somewhere in the application.');
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

end.
