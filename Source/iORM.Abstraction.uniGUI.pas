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
  ****************************************************************************
  *                         A T T E N T I O N !!!                            *
  *                         A T T E N T I O N !!!                            *
  *                         A T T E N T I O N !!!                            *
  *                                                                          *
  * 1) If you use iORM TDataSets with TUniDBGrids, remember to set the Grid's*
  *    "BufferedStore.Enabled" property to True.                              *
  *                                                                          *
  * 2) Do not use the TioTimer (alias TioTimerUniGUI), it doesn't work.      *
  *                                                                          *
  * 3) Do not use the TioApplication (alias TioApplicationUniGUI) methods,   *
  *    it doesn't work.                                                      *
  *                                                                          *
  ****************************************************************************
}
unit iORM.Abstraction.uniGUI;

interface

uses
  System.Classes, iORM.Abstraction, Vcl.ActnList, System.Rtti;

type
  TioUniGUI = class(TComponent)
  strict private
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

  // Note: TioApplication features not implemented for uniGUI platform
  TioApplicationUniGUI = class(TioApplication)
  protected
    class procedure _HandleException(const Sender: TObject); override;
    class procedure _ShowMessage(const AMessage: string); override;
    class function _ProjectPlatform: TioProjectPlatform; override;
    class function _Terminate: Boolean; override;
  end;

  TioControlUniGUI = class(TioControl)
  protected
    class procedure _SetParent(const AControl, AParent: TObject); override;
    class procedure _SetVisible(const AControl: TObject; const AVisible: Boolean); override;
  end;

  // Note: TioApplication features not implemented for uniGUI platform
  TioTimerUniGUI = class(TioTimer)
  private
    // FInternalTimer: TUniTimer;
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

  TioActionUniGUI = class(TioAction)
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
  iORM, Vcl.Forms, Vcl.Dialogs, iORM.Exceptions, Vcl.Controls,
  iORM.DB.ConnectionContainer;

{ TioUniGUI }

constructor TioUniGUI.Create(AOwner: TComponent);
begin
  inherited;
  FShowWait := nil;
  FHideWait := nil;
end;

function TioUniGUI.Get_Version: String;
begin
  Result := io.Version;
end;

procedure TioUniGUI.SetHideWait(const Value: TNotifyEvent);
begin
  FHideWait := Value;
  if Assigned(FHideWait) then
    TioConnectionManager.SetHideWaitProc(
      procedure
      begin
        FHideWait(Self);
      end)
  else
    TioConnectionManager.SetHideWaitProc(nil);
end;

procedure TioUniGUI.SetShowWait(const Value: TNotifyEvent);
begin
  FShowWait := Value;
  if Assigned(FShowWait) then
    TioConnectionManager.SetShowWaitProc(
      procedure
      begin
        FShowWait(Self);
      end)
  else
    TioConnectionManager.SetShowWaitProc(nil);
end;

{ TioApplicationUniGUI }

class procedure TioApplicationUniGUI._HandleException(const Sender: TObject);
begin
  raise EioGenericException.Create(ClassName, '_HandleException', 'Feature not implemented for then uniGUI platform.');
end;

class function TioApplicationUniGUI._ProjectPlatform: TioProjectPlatform;
begin
  Result := ppUniGUI;
end;

class procedure TioApplicationUniGUI._ShowMessage(const AMessage: string);
begin
  raise EioGenericException.Create(ClassName, '_HandleException', 'Feature not implemented for then uniGUI platform.');
end;

class function TioApplicationUniGUI._Terminate: Boolean;
begin
  raise EioGenericException.Create(ClassName, '_Terminate', 'Feature not implemented for then uniGUI platform.');
end;

{ TioControlUniGUI }

class procedure TioControlUniGUI._SetParent(const AControl, AParent: TObject);
begin
  inherited;
  if not(AControl is TControl) then
    raise EioGenericException.Create(Self.ClassName, '_SetParent', 'AControl must descend from TControl.');
  if not(AParent is TWinControl) then
    raise EioGenericException.Create(Self.ClassName, '_SetParent', 'AParent must descend from TWinControl.');
  TControl(AControl).Parent := TWinControl(AParent);
end;

class procedure TioControlUniGUI._SetVisible(const AControl: TObject; const AVisible: Boolean);
begin
  inherited;
  if not(AControl is TControl) then
    raise EioGenericException.Create(Self.ClassName, '_SetParent', 'AControl must descend from TControl.');
  TControl(AControl).Visible := AVisible;
end;

{ TioTimerUniGUI }

constructor TioTimerUniGUI.Create;
begin
  raise EioGenericException.Create(ClassName, 'Create', 'Feature not implemented for then uniGUI platform.');
  // inherited;
  // FInternalTimer := TUniTimer.Create(UniApplication);
  // FInternalTimer.Enabled := False;
  // FInternalTimer.ChainMode := True;
end;

destructor TioTimerUniGUI.Destroy;
begin
  // FInternalTimer.Free;
  inherited;
end;

function TioTimerUniGUI.GetEnabled: Boolean;
begin
  // Result := FInternalTimer.Enabled;
  Result := False;
end;

function TioTimerUniGUI.GetInterval: Cardinal;
begin
  // Result := FInternalTimer.Interval;
  Result := 0;
end;

function TioTimerUniGUI.GetOnTimer: TNotifyEvent;
begin
  // Result := FInternalTimer.OnTimer;
end;

function TioTimerUniGUI.GetTag: Integer;
begin
  // Result := FInternalTimer.Tag;
  Result := 0;
end;

procedure TioTimerUniGUI.SetEnabled(const Value: Boolean);
begin
  // FInternalTimer.Enabled := Value;
end;

procedure TioTimerUniGUI.SetInterval(const Value: Cardinal);
begin
  // FInternalTimer.Interval := Value;
end;

procedure TioTimerUniGUI.SetOnTimer(const Value: TNotifyEvent);
begin
  // FInternalTimer.OnTimer := Value;
end;

procedure TioTimerUniGUI.SetTag(const Value: Integer);
begin
  // FInternalTimer.Tag := Value;
end;

{ TioActionUniGUI }

function TioActionUniGUI.AsTValue: TValue;
begin
  Result := TValue.From<TAction>(FInternalAction);
end;

constructor TioActionUniGUI.Create(AOwner: TComponent);
begin
  inherited;
  FInternalAction := TAction.Create(AOwner);
end;

constructor TioActionUniGUI.Create(AOwner: TComponent; const AAction: TObject);
begin
  inherited Create(AOwner);
  FInternalAction := AAction as TAction;
end;

function TioActionUniGUI.Execute: Boolean;
begin
  Result := FInternalAction.Execute;
end;

function TioActionUniGUI.GetCaption: string;
begin
  Result := FInternalAction.Caption;
end;

function TioActionUniGUI.GetChecked: Boolean;
begin
  Result := FInternalAction.Checked;
end;

function TioActionUniGUI.GetEnabled: Boolean;
begin
  Result := FInternalAction.Enabled;
end;

function TioActionUniGUI.GetGroupIndex: Integer;
begin
  Result := FInternalAction.GroupIndex;
end;

function TioActionUniGUI.GetHint: string;
begin
  Result := FInternalAction.Hint;
end;

function TioActionUniGUI.GetImageIndex: Integer;
begin
  Result := FInternalAction.ImageIndex;
end;

function TioActionUniGUI.GetName: TComponentName;
begin
  Result := FInternalAction.Name;
end;

function TioActionUniGUI.GetOnExecute: TNotifyEvent;
begin
  Result := FInternalAction.OnExecute;
end;

function TioActionUniGUI.GetOnHint: THintEvent;
begin
  Result := FInternalAction.OnHint;
end;

function TioActionUniGUI.GetOnUpdate: TNotifyEvent;
begin
  Result := FInternalAction.OnUpdate;
end;

function TioActionUniGUI.GetVisible: Boolean;
begin
  Result := FInternalAction.Visible;
end;

procedure TioActionUniGUI.SetCaption(const Value: string);
begin
  FInternalAction.Caption := Value;
end;

procedure TioActionUniGUI.SetChecked(const Value: Boolean);
begin
  FInternalAction.Checked := Value;
end;

procedure TioActionUniGUI.SetEnabled(const Value: Boolean);
begin
  FInternalAction.Enabled := Value;
end;

procedure TioActionUniGUI.SetGroupIndex(const Value: Integer);
begin
  FInternalAction.GroupIndex := Value;
end;

procedure TioActionUniGUI.SetHint(const Value: string);
begin
  FInternalAction.Hint := Value;
end;

procedure TioActionUniGUI.SetImageIndex(const Value: Integer);
begin
  FInternalAction.ImageIndex := Value;
end;

procedure TioActionUniGUI.SetName(const Value: TComponentName);
begin
  FInternalAction.Name := Value;
end;

procedure TioActionUniGUI.SetOnExecute(const Value: TNotifyEvent);
begin
  FInternalAction.OnExecute := Value;
end;

procedure TioActionUniGUI.SetOnHint(const Value: THintEvent);
begin
  FInternalAction.OnHint := Value;
end;

procedure TioActionUniGUI.SetOnUpdate(const Value: TNotifyEvent);
begin
  FInternalAction.OnUpdate := Value;
end;

procedure TioActionUniGUI.SetVisible(const Value: Boolean);
begin
  FInternalAction.Visible := Value;
end;

class function TioActionUniGUI._CreateNewAction(const AOwner: TComponent): TioAction;
begin
  Result := Self.Create(AOwner);
end;

class function TioActionUniGUI._CreateNewAction(const AOwner: TComponent; const AAction: TObject): TioAction;
begin
  Result := Self.Create(AOwner, AAction);
end;

class function TioActionUniGUI._IsValid(const AField: TRttiField): Boolean;
begin
  // A Valid Field is a Field of TAction type (or derived)
  Result := AField.FieldType.IsInstance and AField.FieldType.AsInstance.MetaclassType.InheritsFrom(TAction);
end;

initialization

TioApplicationUniGUI.SetConcreteClass(TioApplicationUniGUI);
TioControlUniGUI.SetConcreteClass(TioControlUniGUI);
TioTimerUniGUI.SetConcreteClass(TioTimerUniGUI);
TioActionUniGUI.SetConcreteClass(TioActionUniGUI);

end.
