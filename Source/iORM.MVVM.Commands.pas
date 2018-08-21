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



unit iORM.MVVM.Commands;

interface

{$I ioGlobalDef.inc}   // io global definitions

uses
  System.Rtti, iORM.MVVM.Interfaces,
  System.Generics.Collections, System.Classes, System.UITypes,
  iORM.Attributes, iORM.CommonTypes, iORM.AbstractionLayer.Framework;

type

  TioCommandsContainer = class(TInterfacedObject, IioCommandsContainer)
  strict private
    FContainer: TDictionary<String, IioCommandsContainerItem>;
    function GetOrCreate(const AName:String; const ACommandType:TioCommandType): IioCommandsContainerItem;
    procedure LoadCommands_ParseRttiElement(const AOwner: TComponent; const ARttiElement: TRttiNamedObject);
    procedure LoadCommands_ParseActions(const AOwner: TComponent; const ARttiElement: TRttiNamedObject);
  public
    constructor Create(const AOwner:TComponent);
    destructor Destroy; override;
    procedure Add(const AName:String; const ACommandItem:IioCommandsContainerItem);
    procedure AddOrUpdate(const AName:String; const ACommandItem:IioCommandsContainerItem);
    procedure LoadCommands(const AOwner:TComponent);
    procedure CopyCommands(const ADestinationCommandsContainer: IioCommandsContainer);
    procedure CopyCommand(const ACommandName:String; const ADestinationCommandsContainer: IioCommandsContainer);
    // NB: DI questi metodì è stata lasciata, per il momento, anche l'implementazione commentata
//    procedure RegisterAction(const AName:String; const AOwner:TComponent; const AAction:TAction; const AIsNotificationTarget:Boolean=False);
//    procedure RegisterMethod(const AName:String; const AOwner:TComponent; const ARttiMethod:TRttiMethod; const AIsNotificationTarget:Boolean=False);
//    procedure RegisterAnonimousMethod(const AName:String; const AOwner:TComponent; const AAnonimousMethod:TioCommandAnonimousMethod; const AIsNotificationTarget:Boolean=False);
//    procedure Unregister(const AOwner:TComponent);
    procedure Execute(const AName:String; const ANoException:Boolean=False);
    procedure Notify;
    procedure BindView(const AView:TComponent);
    procedure BindViewControl(const AControl:TObject; const ACommandName:String);
    procedure UniBindViewCommands(const AView:TComponent; const AViewType:TRttiInstanceType);
    function Exist(const AName:String): Boolean;
    function Get(const AName:String; const ANoException:Boolean=False): IioCommandsContainerItem;
  end;

  TioCommandsContainerItem<T> = class abstract (TInterfacedObject, IioCommandsContainerItem)
  strict private
    FCommand: T;
    FOwner: TObject;
    FName: String;
    FEnabled: Boolean;
    FIsNotificationTarget: Boolean;
    procedure SetIsNotificationTarget(const Value: Boolean);
    function GetIsNotificationTarget: Boolean;
  strict protected
    procedure Clear; virtual; abstract;
    function IsEmpty: Boolean; virtual; abstract;
    function GetOwner: TObject;
    function GetCaption: String; virtual;
    function GetEnabled: Boolean; virtual;
    function GetChecked: Boolean; virtual;
    function GetGroupIndex: Integer; virtual;
    function GetHint: String; virtual;
    function GetImageIndex: TImageIndex; virtual;
    function GetVisible: Boolean; virtual;
    procedure SetOwner(const Value: TObject);
    procedure SetCaption(const Value: String); virtual;
    procedure SetEnabled(const Value: Boolean); virtual;
    procedure SetChecked(const Value: Boolean); virtual;
    procedure setGroupIndex(const Value: Integer); virtual;
    procedure SetHint(const Value: String); virtual;
    procedure SetImageIndex(const Value: TImageIndex); virtual;
    procedure SetVisible(const Value: Boolean); virtual;
    // Command
    procedure SetCommand(const Value: T);
    function GetCommand: T;
    property Command:T read GetCommand write SetCommand;
  public
    constructor Create(const AName:String); overload;
    constructor Create(const AName:String; const ACommand:T); overload;
    procedure Execute; virtual; abstract;
    procedure FillCommandInfo(const AOwner: TComponent; const ACmdInfo: TioCommandInfo); virtual;
    function Name: String;
    function IsAction: Boolean; virtual;
    function IsMethod: Boolean; virtual;
    function IsAnonimousMethod: Boolean; virtual;
    function AsAction: TioAction; virtual;
    function AsMethod: TRttiMethod; virtual;
    function AsAnonimousMethod: TioCommandAnonimousMethod; virtual;
    property Owner:TObject read GetOwner write SetOwner;
    property Enabled:Boolean read GetEnabled write SetEnabled;
    property Caption:String read GetCaption write SetCaption;
    property Checked:Boolean read GetChecked write SetChecked;
    property GroupIndex:Integer read GetGroupIndex write setGroupIndex;
    property Hint:String read GetHint write SetHint;
    property ImageIndex:TImageIndex read GetImageIndex write SetImageIndex;
    property Visible:Boolean read GetVisible write SetVisible;
    property IsNotificationTarget:Boolean read GetIsNotificationTarget write SetIsNotificationTarget;
  end;

  TioCommandsContainerItemAction = class(TioCommandsContainerItem<TioAction>)
  strict private
    procedure BindActionEvent(const ACmdInfo: TioCommandInfo; const AMethodData:Pointer);
  strict protected
    procedure Clear; override;
    function IsEmpty: Boolean; override;
    function GetCaption: String; override;
    function GetChecked: Boolean; override;
    function GetGroupIndex: Integer; override;
    function GetHint: String; override;
    function GetImageIndex: TImageIndex; override;
    function GetVisible: Boolean; override;
    procedure SetCaption(const Value: String); override;
    procedure SetChecked(const Value: Boolean); override;
    procedure setGroupIndex(const Value: Integer); override;
    procedure SetHint(const Value: String); override;
    procedure SetImageIndex(const Value: TImageIndex); override;
    procedure SetVisible(const Value: Boolean); override;
    // Enabled
    function GetEnabled: Boolean; override;
    procedure SetEnabled(const Value: Boolean); override;
  public
    procedure FillCommandInfo(const AOwner: TComponent; const ACmdInfo: TioCommandInfo); override;
    procedure Execute; override;
    function IsAction: Boolean; override;
    function AsAction: TioAction; override;
  end;

  TioCommandsContainerItemMethod = class(TioCommandsContainerItem<TRttiMethod>)
  strict protected
    procedure Clear; override;
    function IsEmpty: Boolean; override;
  public
    procedure FillCommandInfo(const AOwner: TComponent; const ACmdInfo: TioCommandInfo); override;
    procedure Execute; override;
    function IsMethod: Boolean; override;
    function AsMethod: TRttiMethod; override;
  end;

  TioCommandsContainerItemAnonimousMethod = class(TioCommandsContainerItem<TioCommandAnonimousMethod>)
  strict protected
    procedure Clear; override;
    function IsEmpty: Boolean; override;
  public
    procedure FillCommandInfo(const AOwner: TComponent; const ACmdInfo: TioCommandInfo); override;
    procedure Execute; override;
    function IsAnonimousMethod: Boolean; override;
    function AsAnonimousMethod: TioCommandAnonimousMethod; override;
  end;

implementation

uses
  iORM.Exceptions, iORM.MVVM.Factory,
  iORM.RttiContext.Factory,
  System.SysUtils;

{ TioVMNotifyItem<T> }

function TioCommandsContainerItem<T>.AsAction: TioAction;
begin
  Result := nil;
end;

function TioCommandsContainerItem<T>.AsAnonimousMethod: TioCommandAnonimousMethod;
begin
  Result := nil;
end;

function TioCommandsContainerItem<T>.AsMethod: TRttiMethod;
begin
  Result := nil;
end;

constructor TioCommandsContainerItem<T>.Create(const AName: String;
  const ACommand: T);
begin
  inherited Create;
  Clear;
  FName := AName;
  FCommand := ACommand;
  FEnabled := True;
end;

constructor TioCommandsContainerItem<T>.Create(const AName:String);
begin
  inherited Create;
  Clear;
  FName := AName;
  FEnabled := True;
end;

procedure TioCommandsContainerItem<T>.FillCommandInfo(
  const AOwner: TComponent; const ACmdInfo: TioCommandInfo);
begin
  inherited;
  // Load infos in the command item if not null
  FName := ACmdInfo.Name.Value;
  if ACmdInfo.Caption.HasValue then
    Self.Caption := ACmdInfo.Caption.Value;
  if ACmdInfo.Enabled.HasValue then
    Self.Enabled := ACmdInfo.Enabled.Value;
  if ACmdInfo.Checked.HasValue then
    Self.Checked := ACmdInfo.Checked.Value;
  if ACmdInfo.GroupIndex.HasValue then
    Self.GroupIndex := ACmdInfo.GroupIndex.Value;
  if ACmdInfo.Hint.HasValue then
    Self.Hint := ACmdInfo.Hint.Value;
  if ACmdInfo.ImageIndex.HasValue then
    Self.ImageIndex := ACmdInfo.ImageIndex.Value;
  if ACmdInfo.Visible.HasValue then
    Self.Visible := ACmdInfo.Visible.Value;
  if ACmdInfo.NotificationTarget.HasValue then
    Self.IsNotificationTarget := ACmdInfo.NotificationTarget.Value;
  if ACmdInfo.Caption.HasValue then
    Self.Caption := ACmdInfo.Caption.Value;
end;

function TioCommandsContainerItem<T>.GetCaption: String;
begin
  // Leave empty!
end;

function TioCommandsContainerItem<T>.GetChecked: Boolean;
begin
  // Leave empty!
end;

function TioCommandsContainerItem<T>.GetCommand: T;
begin
  Result := FCommand;
end;

function TioCommandsContainerItem<T>.GetEnabled: Boolean;
begin
  Result := FEnabled;
end;

function TioCommandsContainerItem<T>.GetGroupIndex: Integer;
begin
  // Leave empty!
end;

function TioCommandsContainerItem<T>.GetHint: String;
begin
  // Leave empty!
end;

function TioCommandsContainerItem<T>.GetImageIndex: TImageIndex;
begin
  // Leave empty!
end;

function TioCommandsContainerItem<T>.GetIsNotificationTarget: Boolean;
begin
  result := FIsNotificationTarget;
end;

function TioCommandsContainerItem<T>.GetOwner: TObject;
begin
  Result := FOwner
end;

function TioCommandsContainerItem<T>.GetVisible: Boolean;
begin
  // Leave empty!
end;

function TioCommandsContainerItem<T>.IsAction: Boolean;
begin
  Result := False;
end;

function TioCommandsContainerItem<T>.IsAnonimousMethod: Boolean;
begin
  Result := False;
end;

function TioCommandsContainerItem<T>.IsMethod: Boolean;
begin
  Result := False;
end;

function TioCommandsContainerItem<T>.Name: String;
begin
  Result := FName;
end;

procedure TioCommandsContainerItem<T>.SetCaption(const Value: String);
begin
  // Leave empty!
end;

procedure TioCommandsContainerItem<T>.SetChecked(const Value: Boolean);
begin
  // Leave empty!
end;

procedure TioCommandsContainerItem<T>.SetCommand(const Value: T);
begin
  FCommand := Value;
end;

procedure TioCommandsContainerItem<T>.SetEnabled(const Value: Boolean);
begin
  FEnabled := Value;
end;

procedure TioCommandsContainerItem<T>.setGroupIndex(const Value: Integer);
begin
  // Leave empty!
end;

procedure TioCommandsContainerItem<T>.SetHint(const Value: String);
begin
  // Leave empty!
end;

procedure TioCommandsContainerItem<T>.SetImageIndex(const Value: TImageIndex);
begin
  // Leave empty!
end;

procedure TioCommandsContainerItem<T>.SetIsNotificationTarget(
  const Value: Boolean);
begin
  FIsNotificationTarget := Value;
end;

procedure TioCommandsContainerItem<T>.SetOwner(const Value: TObject);
begin
  FOwner := Value;
end;

procedure TioCommandsContainerItem<T>.SetVisible(const Value: Boolean);
begin
  // Leave empty!
end;

{ TioVMNotifyMethod }

function TioCommandsContainerItemMethod.AsMethod: TRttiMethod;
begin
  Result := Self.Command;
end;

procedure TioCommandsContainerItemMethod.Clear;
begin
  inherited;
  Command := nil;
end;

procedure TioCommandsContainerItemMethod.Execute;
begin
  inherited;
  if Self.Enabled then
    Self.Command.Invoke(Self.Owner, []);
end;

procedure TioCommandsContainerItemMethod.FillCommandInfo(
  const AOwner: TComponent; const ACmdInfo: TioCommandInfo);
begin
  inherited;
  // Set the RttiMethod as command if assigned
  if ACmdInfo.RttiMethod.HasValue then
  begin
    Self.Command := ACmdInfo.RttiMethod.Value;
    Self.Owner := AOwner;
  end
  else
    raise EioException.Create(Self.ClassName + ': Invalid Method (null).');
end;

function TioCommandsContainerItemMethod.IsEmpty: Boolean;
begin
  inherited;
  Result := not Assigned(Command);
end;

function TioCommandsContainerItemMethod.IsMethod: Boolean;
begin
  inherited;
  Result := True;
end;

{ TioVMNotifyAction }

function TioCommandsContainerItemAction.GetCaption: String;
begin
  Result := Self.Command.Caption;
end;

function TioCommandsContainerItemAction.GetChecked: Boolean;
begin
  Result := Self.Command.Checked;
end;

function TioCommandsContainerItemAction.GetEnabled: Boolean;
begin
  Result := Self.Command.Enabled;
end;

function TioCommandsContainerItemAction.GetGroupIndex: Integer;
begin
  Result := Self.Command.GroupIndex;
end;

function TioCommandsContainerItemAction.GetHint: String;
begin
  Result := Self.Command.Hint;
end;

function TioCommandsContainerItemAction.GetImageIndex: TImageIndex;
begin
  Result := Self.Command.ImageIndex;
end;

function TioCommandsContainerItemAction.GetVisible: Boolean;
begin
  Result := Self.Command.Visible;
end;

function TioCommandsContainerItemAction.AsAction: TioAction;
begin
  inherited;
  Result := Command;
end;

procedure TioCommandsContainerItemAction.BindActionEvent(
  const ACmdInfo: TioCommandInfo; const AMethodData:Pointer);
var
  LActionEventName: String;
  LActionEventProp: TRttiProperty;
  LMethod: TMethod;
  LValue: TValue;
begin
  // Check for values non null
  if ACmdInfo.Event.HasValue and ACmdInfo.RttiMethod.HasValue then
  begin
    // Get the RttiType of the action event property
    case ACmdInfo.Event.Value of
      TioActionEvent.OnExecute:
        LActionEventName := 'OnExecute';
      TioActionEvent.OnUpdate:
        LActionEventName := 'OnUpdate';
      TioActionEvent.OnHint:
        LActionEventName := 'OnHint';
    end;
    LActionEventProp := TioRttiContextFactory.RttiContext.GetType(Self.Command.ClassInfo).GetProperty(LActionEventName);
    // Set the TMethod with the CodeAddress of the RttiMethod we want to assign as event handler
    LMethod.Code := ACmdInfo.RttiMethod.Value.CodeAddress;
    LMethod.Data := AMethodData;
    // Make a TValue containing the method to assign to the action event
    TValue.Make(@LMethod, LActionEventProp.PropertyType.Handle, LValue);
    // Set the property/event handler
    LActionEventProp.SetValue(Self.Command, LValue);
  end;
end;

procedure TioCommandsContainerItemAction.Clear;
begin
  inherited;
  Command := nil;
end;

procedure TioCommandsContainerItemAction.Execute;
begin
  inherited;
  Self.Command.Execute;
end;

procedure TioCommandsContainerItemAction.FillCommandInfo(
  const AOwner: TComponent; const ACmdInfo: TioCommandInfo);
begin
  // If the internal action is not assigned then crate it
  if Self.IsEmpty then
  begin
    Command := TioAction.CreateNewAction(AOwner);
    Command.Name := ACmdInfo.Name.Value;
  end;
  // Set the method as an action event handler
  Self.BindActionEvent(ACmdInfo, AOwner);
  // Inherited must be at the end in this case
  inherited;
end;

function TioCommandsContainerItemAction.IsAction: Boolean;
begin
  inherited;
  Result := True;
end;

function TioCommandsContainerItemAction.IsEmpty: Boolean;
begin
  inherited;
  Result := not Assigned(Command);
end;

{ TioVMNotifyAnonimousMethod }

function TioCommandsContainerItemAnonimousMethod.AsAnonimousMethod: TioCommandAnonimousMethod;
begin
  Result := Command;
end;

procedure TioCommandsContainerItemAnonimousMethod.Clear;
begin
  inherited;
  Command := nil;
end;

procedure TioCommandsContainerItemAnonimousMethod.Execute;
begin
  inherited;
  if Self.Enabled then
    Self.Command();
end;

procedure TioCommandsContainerItemAnonimousMethod.FillCommandInfo(
  const AOwner: TComponent; const ACmdInfo: TioCommandInfo);
begin
  // An anonimous method can be registered as Command only by runtime code
  //  therefore must never perform this method
  raise EioException.Create(Self.ClassName + ': anonimous methods ca can be registered as Command only by runtime code therefore must never perform this method.');
  inherited;
end;

function TioCommandsContainerItemAnonimousMethod.IsAnonimousMethod: Boolean;
begin
  inherited;
  result := True;
end;

function TioCommandsContainerItemAnonimousMethod.IsEmpty: Boolean;
begin
  inherited;
  Result := not Assigned(Command);
end;

{ TioVMNotifyContainer }

procedure TioCommandsContainer.Add(const AName: String;
  const ACommandItem: IioCommandsContainerItem);
begin
  FContainer.Add(   UpperCase(AName), ACommandItem   );
end;

procedure TioCommandsContainer.BindViewControl(const AControl: TObject;
  const ACommandName: String);
var
  LCommandItem: IioCommandsContainerItem;
  LControlType: TRttiInstanceType;
  LControlActionProperty: TRttiProperty;
begin
  // Get the action
  LCommandItem := Self.Get(ACommandName);
  if not LCommandItem.IsAction then
    raise EioException.Create(Self.ClassName + ': The command is not an action.');
  // Get the control action property
  LControlType := TioRttiContextFactory.RttiContext.GetType(AControl.ClassInfo).AsInstance;
  LControlActionProperty := LControlType.GetProperty('Action');
  if not Assigned(LControlActionProperty) then
    EioException.Create(Self.ClassName + ': "Action" property not found.');
  // Bind the action
  LControlActionProperty.SetValue(AControl, LCommandItem.AsAction.AsTValue);
end;

procedure TioCommandsContainer.AddOrUpdate(const AName: String;
  const ACommandItem: IioCommandsContainerItem);
begin
  if Self.Exist(AName) then
    FContainer.Items[AName] := ACommandItem
  else
    Self.Add(AName, ACommandItem);
end;

procedure TioCommandsContainer.BindView(const AView: TComponent);
var
  LViewType: TRttiInstanceType;
  LViewField: TRttiField;
  LAttr: TCustomAttribute;
  LCommandName: String;
  LViewControl: TObject;
  LViewControlType: TRttiType;
begin
  // Load commands from view
  LoadCommands(AView);
  // Retrieve the RttiType of the view
  LViewType := TioRttiContextFactory.RttiContext.GetType(AView.ClassType).AsInstance;
  // Bind uniGUI controls
  //  NB: Questo metodo è stato aggiunto (con il relativo attributo "ioUniBindAction" perchè
  //       si è visto che nel caso delle TUniForm e TUniFrame gli attributi relativi ai campi
  //       non vengono creati e quindi l'attributo "ioBindAction" era inefficace. Però
  //       si era notato che invece gli attributi della classe (non del campo) venivano creati
  //       e quindi si è aggiunto l'attributo "ioUniBindAction" da usare appunto sulla classe
  //       invece che sul controllo.
  UniBindViewCommands(AView, LViewType);
  // Loop for all fields searching "ioBindAction" attribute
  for LViewField in LViewType.GetFields do
    for LAttr in LViewField.GetAttributes do
      // ioBindAction attribute
      if LAttr is ioBindAction then
      begin
        // Get command/action name
        LCommandName := ioBindAction(LAttr).Value;
        // Get view control
        LViewControlType := LViewField.FieldType;
        if not LViewControlType.IsInstance then
          raise EioException.Create(Self.ClassName + ': The view field is not an instance.');
        LViewControl := LViewField.GetValue(AView).AsObject;
        // Bind
        Self.BindViewControl(LViewControl, LCommandName);
      end;
end;

procedure TioCommandsContainer.CopyCommand(const ACommandName: String;
  const ADestinationCommandsContainer: IioCommandsContainer);
var
  LCommandContainerItem: IioCommandsContainerItem;
begin
  LCommandContainerItem := Self.Get(ACommandName);
  ADestinationCommandsContainer.Add(ACommandName, LCommandContainerItem);
end;

procedure TioCommandsContainer.CopyCommands(
  const ADestinationCommandsContainer: IioCommandsContainer);
var
  LCommandName: String;
begin
  for LCommandName in FContainer.Keys do
    Self.CopyCommand(LCommandName, ADestinationCommandsContainer);
end;

constructor TioCommandsContainer.Create(const AOwner:TComponent);
begin
  inherited Create;
  // Create the internal container
  FContainer := TDictionary<String, IioCommandsContainerItem>.Create;
  // Parse the Owner class (the ViewModel) and load its commands
  LoadCommands(AOwner);
end;

destructor TioCommandsContainer.Destroy;
begin
  FContainer.Free;
  inherited;
end;

function TioCommandsContainer.Exist(const AName: String): Boolean;
begin
  Result := FContainer.ContainsKey(   UpperCase(AName)  );
end;

function TioCommandsContainer.Get(const AName: String; const ANoException:Boolean): IioCommandsContainerItem;
begin
  Result := nil;
  if FContainer.TryGetValue(UpperCase(AName), Result) or ANoException then
    Exit;
  raise EioException.Create(Self.ClassName + ': "' + AName + '" Command/Action not found.');
end;

function TioCommandsContainer.GetOrCreate(
  const AName: String; const ACommandType:TioCommandType): IioCommandsContainerItem;
begin
  if not Self.Exist(AName) then
    Self.Add(   AName, TioMVVMFactory.NewCommandsContainerItem(AName, ACommandType)   );
  Result := Self.Get(AName);
end;

procedure TioCommandsContainer.Execute(const AName: String; const ANoException:Boolean);
var
  LCmdItem: IioCommandsContainerItem;
begin
  // Get the CommandItem if exist
  LCmdItem := Get(AName, ANoException);
  // Execute the command
  if Assigned(LCmdItem) then
    LCmdItem.Execute;
end;

procedure TioCommandsContainer.LoadCommands(const AOwner: TComponent);
var
  LOwnerType: TRttiType;
  LMethod: TRttiMethod;
begin
  if not Assigned(AOwner) then
    Exit;
  LOwnerType := TioRttiContextFactory.RttiContext.GetType(AOwner.ClassInfo);
  // Parse the class
  LoadCommands_ParseRttiElement(AOwner, LOwnerType);
  // Parse the class methods
  for LMethod in LOwnerType.GetMethods do
    LoadCommands_ParseRttiElement(AOwner, LMethod);
  // Parse the class fields searching actions (ActionList)
  LoadCommands_ParseActions(AOwner, LOwnerType);
end;

procedure TioCommandsContainer.LoadCommands_ParseActions(
  const AOwner: TComponent; const ARttiElement: TRttiNamedObject);
var
  LField: TRttiField;
  LAttr: TCustomAttribute;
  LCmdItem: IioCommandsContainerItem;
  LObj: TObject;
  LAction: TioAction;
begin
  // Loop for all fields searching actions
  for LField in TRttiInstanceType(ARttiElement).GetFields do
  begin
    if LField.FieldType.IsInstance
    and LField.FieldType.AsInstance.MetaclassType.InheritsFrom(TBasicAction)
    then
      if TioAction.IsValidAction(LField) then
      begin
        // Get the action
        LObj := LField.GetValue(AOwner).AsObject;
        LAction := TioAction.CreateNewAction(AOwner, LObj);
        // Get or create the CommandsContainerItem and add it to the commands container
        LCmdItem := TioMVVMFactory.NewCommandsContainerItem(LAction.Name, LAction);
        LCmdItem.Owner := AOwner;
        Self.Add(LAction.Name, LCmdItem);
      end;
  end;
end;

procedure TioCommandsContainer.LoadCommands_ParseRttiElement(
  const AOwner: TComponent; const ARttiElement: TRttiNamedObject);
var
  LCmdInfo: TioCommandInfo;
  LCmdItem: IioCommandsContainerItem;
begin
  // Parse the RttiType of the owner (search attributes)
  LCmdInfo := TioCommandInfo.Create(ARttiElement);
  // If the CommandType is null then exit
  if (LCmdInfo.CommandType.Value = TioCommandType.ctNull) then
    Exit;
  // A CommandName is required
  if LCmdInfo.Name.IsNull or LCmdInfo.Name.Value.IsEmpty then
    raise EioException.Create(Self.ClassName + ': Command/Action name is required.');
  // Get or create the CommandsContainerItem
  LCmdItem := Self.GetOrCreate(LCmdInfo.Name.Value, LCmdInfo.CommandType.Value);
  LCmdItem.Owner := AOwner;
  // Set CommandContainerItem infos
  LCmdItem.FillCommandInfo(AOwner, LCmdInfo);
end;

procedure TioCommandsContainer.Notify;
var
  LKey: String;
  LCmdItem: IioCommandsContainerItem;
begin
  for LKey in FContainer.Keys do
    if FContainer.Items[LKey].IsNotificationTarget then
      FContainer.Items[LKey].Execute;
end;

//procedure TioCommandsContainer.RegisterAction(const AName: String;
//  const AOwner: TComponent; const AAction: TAction;
//  const AIsNotificationTarget: Boolean);
//var
//  LCmdItem: IioCommandsContainerItem;
//begin
//  LCmdItem := TioMVVMFactory.NewCommandsContainerItem(AName, AAction);
//  LCmdItem.Owner := AOwner;
//  LCmdItem.IsNotificationTarget := AIsNotificationTarget;
//  Self.Add(AName, LCmdItem);
//end;

//procedure TioCommandsContainer.RegisterAnonimousMethod(const AName:String;
//const AOwner:TComponent; const AAnonimousMethod:TioCommandAnonimousMethod;
//const AIsNotificationTarget:Boolean=False);
//var
//  LCmdItem: IioCommandsContainerItem;
//begin
//  LCmdItem := TioMVVMFactory.NewCommandsContainerItem(AName, AAnonimousMethod);
//  LCmdItem.Owner := AOwner;
//  LCmdItem.IsNotificationTarget := AIsNotificationTarget;
//  Self.Add(AName, LCmdItem);
//end;

//procedure TioCommandsContainer.RegisterMethod(const AName: String;
//  const AOwner: TComponent; const ARttiMethod: TRttiMethod;
//  const AIsNotificationTarget: Boolean);
//var
//  LCmdItem: IioCommandsContainerItem;
//begin
//  LCmdItem := TioMVVMFactory.NewCommandsContainerItem(AName, ARttiMethod);
//  LCmdItem.Owner := AOwner;
//  LCmdItem.IsNotificationTarget := AIsNotificationTarget;
//  Self.Add(AName, LCmdItem);
//end;

//procedure TioCommandsContainer.Unregister(const AOwner: TComponent);
//var
//  LKey: String;
//  LCmdItem: IioCommandsContainerItem;
//begin
//  for LKey in FContainer.Keys do
//    if FContainer.Items[LKey].Owner = AOwner then
//      FContainer.Remove(LKey);
//end;

procedure TioCommandsContainer.UniBindViewCommands(const AView:TComponent; const AViewType:TRttiInstanceType);
var
  LAttr: TCustomAttribute;
  LComponent: TComponent;
begin
  for LAttr in AViewType.GetAttributes do
  begin
    if LAttr is ioUniBindAction then
    begin
      LComponent := AView.FindComponent(ioUniBindAction(LAttr).ControlName);
      if not Assigned(LComponent) then
        raise EioException.Create(Self.ClassName, 'UniBindViewCommands', Format('Component "%s" not found.', [ioUniBindAction(LAttr).ControlName]));
      BindViewControl(LComponent, ioUniBindAction(LAttr).CommandName);
    end;
  end;
end;

{ TioVMNotifyItemAnonimousMethodEx }

procedure TioCommandsContainerItemAction.SetCaption(const Value: String);
begin
  inherited;
  Self.Command.Caption := Value;
end;

procedure TioCommandsContainerItemAction.SetChecked(const Value: Boolean);
begin
  inherited;
  Self.Command.Checked := Value;
end;

procedure TioCommandsContainerItemAction.SetEnabled(const Value: Boolean);
begin
  Self.Command.Enabled := Value;
end;

procedure TioCommandsContainerItemAction.setGroupIndex(const Value: Integer);
begin
  inherited;
  Self.Command.GroupIndex := Value;
end;

procedure TioCommandsContainerItemAction.SetHint(const Value: String);
begin
  inherited;
  Self.Command.Hint := Value;
end;

procedure TioCommandsContainerItemAction.SetImageIndex(
  const Value: TImageIndex);
begin
  inherited;
  Self.Command.ImageIndex := Value;
end;

procedure TioCommandsContainerItemAction.SetVisible(const Value: Boolean);
begin
  inherited;
  Self.Command.Visible := Value;
end;


end.
