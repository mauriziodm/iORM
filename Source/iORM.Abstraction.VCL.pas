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
unit iORM.Abstraction.VCL;

interface

uses
  iORM.Abstraction, VCL.ActnList, VCL.ExtCtrls, System.Rtti, System.Classes, FireDAC.VCLUI.Wait; // For FireDAC compatibility without original component

type

  TioVCL = class(TioCustomPlatformAbstractionComponent)

  end;

  TioApplicationVCL = class(TioApplication)
  protected
    class procedure _HandleException(const Sender: TObject); override;
    class procedure _ShowMessage(const AMessage: string); override;
    class function _ProjectPlatform: TioProjectPlatform; override;
    class function _Terminate: Boolean; override;
    class function _GetSessionID: String; override;
  end;

  TioControlVCL = class(TioControl)
  protected
    class procedure _SetParent(const AControl, AParent: TObject); override;
    class procedure _SetVisible(const AControl: TObject; const AVisible: Boolean); override;
  end;

  TioTimerVCL = class(TioTimer)
  private
    FInternalTimer: TTimer;
  protected
    function GetEnabled: Boolean; override;
    function GetInterval: Cardinal; override;
    function GetOnTimer: TNotifyEvent; override;
    function GetTag: Integer; override;
    procedure SetEnabled(const Value: Boolean); override;
    procedure SetInterval(const Value: Cardinal); override;
    procedure SetOnTimer(const Value: TNotifyEvent); override;
    procedure SetTag(const Value: Integer); override;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

  TioActionVCL = class(TioAction)
  private
    FInternalAction: TAction;
  protected
    class function _CreateNewAction(const AOwner: TComponent): TioAction; override;
    class function _CreateNewAction(const AOwner: TComponent; const AAction: TObject): TioAction; override;
    class function _IsValid(const AField: TRttiField): Boolean; override;
    function GetCaption: string; override;
    function GetChecked: Boolean; override;
    function GetEnabled: Boolean; override;
    function GetGroupIndex: Integer; override;
    function GetHint: string; override;
    function GetImageIndex: Integer; override;
    function GetName: TComponentName; override;
    function GetVisible: Boolean; override;
    function GetOnExecute: TNotifyEvent; override;
    function GetOnHint: THintEvent; override;
    function GetOnUpdate: TNotifyEvent; override;
    procedure SetCaption(const Value: string); override;
    procedure SetChecked(const Value: Boolean); override;
    procedure SetEnabled(const Value: Boolean); override;
    procedure SetGroupIndex(const Value: Integer); override;
    procedure SetHint(const Value: string); override;
    procedure SetImageIndex(const Value: Integer); override;
    procedure SetName(const Value: TComponentName); override;
    procedure SetVisible(const Value: Boolean); override;
    procedure SetOnExecute(const Value: TNotifyEvent); override;
    procedure SetOnHint(const Value: THintEvent); override;
    procedure SetOnUpdate(const Value: TNotifyEvent); override;
  public
    constructor Create(AOwner: TComponent); reintroduce; overload;
    constructor Create(AOwner: TComponent; const AAction: TObject); reintroduce; overload;
    function Execute: Boolean; override;
    function AsTValue: TValue; override;
  end;

implementation

uses
  iORM, iORM.Exceptions, Vcl.Forms, Vcl.Dialogs,
  Vcl.Controls;

{ TioApplicationVCL }

class function TioApplicationVCL._GetSessionID: String;
begin
  Result := IO_STRING_NULL_VALUE;
end;

class procedure TioApplicationVCL._HandleException(const Sender: TObject);
begin
  Application.HandleException(Sender);
end;

class function TioApplicationVCL._ProjectPlatform: TioProjectPlatform;
begin
  Result := ppVCL;
end;

class procedure TioApplicationVCL._ShowMessage(const AMessage: string);
begin
  VCL.Dialogs.ShowMessage(AMessage);
end;

class function TioApplicationVCL._Terminate: Boolean;
begin
  Result := True;
  Application.Terminate;
end;

{ TioComponentVCL }

class procedure TioControlVCL._SetParent(const AControl, AParent: TObject);
begin
  inherited;
  if not(AControl is TControl) then
    raise EioGenericException.Create(Self.ClassName, '_SetParent', 'AControl must descend from TControl.');
  if not(AParent is TWinControl) then
    raise EioGenericException.Create(Self.ClassName, '_SetParent', 'AParent must descend from TWinControl.');
  TControl(AControl).Parent := TWinControl(AParent);
end;

{ TioTimerVCL }

constructor TioTimerVCL.Create;
begin
  inherited;
  FInternalTimer := TTimer.Create(nil);
  FInternalTimer.Enabled := False;
end;

destructor TioTimerVCL.Destroy;
begin
  FInternalTimer.Free;
  inherited;
end;

function TioTimerVCL.GetEnabled: Boolean;
begin
  Result := FInternalTimer.Enabled;
end;

function TioTimerVCL.GetInterval: Cardinal;
begin
  Result := FInternalTimer.Interval;
end;

function TioTimerVCL.GetOnTimer: TNotifyEvent;
begin
  Result := FInternalTimer.OnTimer;
end;

function TioTimerVCL.GetTag: Integer;
begin
  Result := FInternalTimer.Tag;
end;

procedure TioTimerVCL.SetEnabled(const Value: Boolean);
begin
  FInternalTimer.Enabled := Value;
end;

procedure TioTimerVCL.SetInterval(const Value: Cardinal);
begin
  FInternalTimer.Interval := Value;
end;

procedure TioTimerVCL.SetOnTimer(const Value: TNotifyEvent);
begin
  FInternalTimer.OnTimer := Value;
end;

procedure TioTimerVCL.SetTag(const Value: Integer);
begin
  FInternalTimer.Tag := Value;
end;

{ TioActionVCL }

function TioActionVCL.AsTValue: TValue;
begin
  Result := TValue.From<TAction>(FInternalAction);
end;

constructor TioActionVCL.Create(AOwner: TComponent);
begin
  inherited;
  FInternalAction := TAction.Create(AOwner);
end;

constructor TioActionVCL.Create(AOwner: TComponent; const AAction: TObject);
begin
  inherited Create(AOwner);
  FInternalAction := AAction as TAction;
end;

function TioActionVCL.Execute: Boolean;
begin
  Result := FInternalAction.Execute;
end;

function TioActionVCL.GetCaption: string;
begin
  Result := FInternalAction.Caption;
end;

function TioActionVCL.GetChecked: Boolean;
begin
  Result := FInternalAction.Checked;
end;

function TioActionVCL.GetEnabled: Boolean;
begin
  Result := FInternalAction.Enabled;
end;

function TioActionVCL.GetGroupIndex: Integer;
begin
  Result := FInternalAction.GroupIndex;
end;

function TioActionVCL.GetHint: string;
begin
  Result := FInternalAction.Hint;
end;

function TioActionVCL.GetImageIndex: Integer;
begin
  Result := FInternalAction.ImageIndex;
end;

function TioActionVCL.GetName: TComponentName;
begin
  Result := FInternalAction.Name;
end;

function TioActionVCL.GetOnExecute: TNotifyEvent;
begin
  Result := FInternalAction.OnExecute;
end;

function TioActionVCL.GetOnHint: THintEvent;
begin
  Result := FInternalAction.OnHint;
end;

function TioActionVCL.GetOnUpdate: TNotifyEvent;
begin
  Result := FInternalAction.OnUpdate;
end;

function TioActionVCL.GetVisible: Boolean;
begin
  Result := FInternalAction.Visible;
end;

procedure TioActionVCL.SetCaption(const Value: string);
begin
  FInternalAction.Caption := Value;
end;

procedure TioActionVCL.SetChecked(const Value: Boolean);
begin
  FInternalAction.Checked := Value;
end;

procedure TioActionVCL.SetEnabled(const Value: Boolean);
begin
  FInternalAction.Enabled := Value;
end;

procedure TioActionVCL.SetGroupIndex(const Value: Integer);
begin
  FInternalAction.GroupIndex := Value;
end;

procedure TioActionVCL.SetHint(const Value: string);
begin
  FInternalAction.Hint := Value;
end;

procedure TioActionVCL.SetImageIndex(const Value: Integer);
begin
  FInternalAction.ImageIndex := Value;
end;

procedure TioActionVCL.SetName(const Value: TComponentName);
begin
  FInternalAction.Name := Value;
end;

procedure TioActionVCL.SetOnExecute(const Value: TNotifyEvent);
begin
  FInternalAction.OnExecute := Value;
end;

procedure TioActionVCL.SetOnHint(const Value: THintEvent);
begin
  FInternalAction.OnHint := Value;
end;

procedure TioActionVCL.SetOnUpdate(const Value: TNotifyEvent);
begin
  FInternalAction.OnUpdate := Value;
end;

procedure TioActionVCL.SetVisible(const Value: Boolean);
begin
  FInternalAction.Visible := Value;
end;

class function TioActionVCL._CreateNewAction(const AOwner: TComponent; const AAction: TObject): TioAction;
begin
  Result := Self.Create(AOwner, AAction);
end;

class function TioActionVCL._IsValid(const AField: TRttiField): Boolean;
begin
  // A Valid Field is a Field of TAction type (or derived)
  Result := AField.FieldType.IsInstance and AField.FieldType.AsInstance.MetaclassType.InheritsFrom(TAction);
end;

class function TioActionVCL._CreateNewAction(const AOwner: TComponent): TioAction;
begin
  Result := Self.Create(AOwner);
end;

class procedure TioControlVCL._SetVisible(const AControl: TObject; const AVisible: Boolean);
begin
  inherited;
  if not(AControl is TControl) then
    raise EioGenericException.Create(Self.ClassName, '_SetParent', 'AControl must descend from TControl.');
  TControl(AControl).Visible := AVisible;
end;

initialization

TioApplicationVCL.SetConcreteClass(TioApplicationVCL);
TioControlVCL.SetConcreteClass(TioControlVCL);
TioTimerVCL.SetConcreteClass(TioTimerVCL);
TioActionVCL.SetConcreteClass(TioActionVCL);

end.
