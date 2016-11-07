{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2016 Maurizio Del Magno                           }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  Licensed under the Apache License, Version 2.0 (the "License");          }
{  you may not use this file except in compliance with the License.         }
{  You may obtain a copy of the License at                                  }
{                                                                           }
{      http://www.apache.org/licenses/LICENSE-2.0                           }
{                                                                           }
{  Unless required by applicable law or agreed to in writing, software      }
{  distributed under the License is distributed on an "AS IS" BASIS,        }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{  See the License for the specific language governing permissions and      }
{  limitations under the License.                                           }
{                                                                           }
{***************************************************************************}



unit iORM.MVVM.Interfaces;

interface

uses
  iORM.LiveBindings.Interfaces, Data.Bind.ObjectScope, System.Classes,
  System.Rtti, System.Actions, System.UITypes, iORM.CommonTypes,
  iORM.Attributes;

type

  TioViewDataType = (dtSingle, dtList);

  TioCommandType = (ctNull, ctAction, ctMethod, ctAnonimousMethod);

  IioView = interface(IInvokable)
    ['{AE9431A3-4D53-4ACF-98A1-7870DB6F7B0F}']
    function FindComponent(const AName: string): TComponent;
  end;

  IioViewData = interface
    ['{A8E74DA6-81BF-446C-A524-7E98F0D09CEF}']
    function DataObj: TObject;
    procedure SetDataObj(AObj:TObject); overload;
    procedure SetDataObj(AIntf:IInterface); overload;
    function BindSourceAdapter: TBindSourceAdapter;
    function ActiveBindSourceAdapter: IioActiveBindSourceAdapter;
  end;

  IioCommandsContainer = interface;

  IioViewModel = interface(IInvokable)
    ['{B8A32927-A4DA-4B8D-8545-AB68DEDF17BC}']
    function ViewData: IioViewData;
    function Commands: IioCommandsContainer;
//    procedure BindView(const AView:TComponent);
    // TypeName
    procedure SetTypeName(const Value: String);
    function GetTypeName: String;
    property ioTypeName:String read GetTypeName write SetTypeName;
    // TypeAlias
    procedure SetTypeAlias(const Value: String);
    function GetTypeAlias: String;
    property ioTypeAlias:String read GetTypeAlias write SetTypeAlias;
    // MasterBindSource
    procedure SetMasterBindSource(const Value: TObject);
    function GetMasterBindSource: TObject;
    property ioMasterBindSource:TObject read GetMasterBindSource write SetMasterBindSource;
    // MasterPropertyName
    procedure SetMasterPropertyName(const Value: String);
    function GetMasterPropertyName: String;
    property ioMasterPropertyName:String read GetMasterPropertyName write SetMasterPropertyName;
    // AutoLoadData
    procedure SetAutoLoadData(const Value: Boolean);
    function GetAutoLoadData: Boolean;
    property ioAutoLoadData:Boolean read GetAutoLoadData write SetAutoLoadData;
    // ViewDataType
    procedure SetViewDataType(const Value: TioViewDataType);
    function GetViewDataType: TioViewDataType;
    property ioViewDataType:TioViewDataType read GetViewDataType write SetViewDataType;
  end;

  IioContainedViewContextProvider = interface
    ['{DBD12364-D019-4F3B-83A9-FA011CD647AB}']
    function NewViewContext(const AView:TComponent): TComponent;
    procedure ReleaseViewContext(const AView:TComponent);
    // RegisterAsActive
    function GetRegisterAsActive: Boolean;
    procedure SetRegisterAsActive(const Value: Boolean);
    property RegisterAsActive:Boolean read GetRegisterAsActive write SetRegisterAsActive;
  end;

  IioVMViews = interface
    ['{0F35C859-695B-424A-99B3-B54CC54C2863}']
    procedure RegisterView(const AView:TComponent);
    procedure UnregisterView(const AView:TComponent);
    procedure ReleaseViewContext(const AView:TComponent);
    procedure ReleaseAllViewContexts;
//    function InternalContainer: TioVMViewsInternalContainer;
  end;

  // Reference to an anonimous method called by a ViewModel when it need
  //  to notify their views that something is changed
  TioCommandAnonimousMethod = reference to procedure;

  TioCommandInfo = record
  private
    procedure ParseMethodName(const AMethodName:String);
  public
    Name:               TioNullableString;
    Caption:            TioNullableString;
    Event:              TioNullable<TioActionEvent>;
    Enabled:            TioNullableBoolean;
    Checked:            TioNullableBoolean;
    GroupIndex:         TioNullableInteger;
    Hint:               TioNullableString;
    ImageIndex:         TioNullable<TImageIndex>;
    Visible:            TioNullableBoolean;
    NotificationTarget: TioNullableBoolean;
    CommandType:        TioNullable<TioCommandType>;
    RttiMethod:         TioNullable<TRttiMethod>;
    Action:             TioNullable<TContainedAction>;
    constructor Create(const ARttiElement:TRttiNamedObject);
  end;

  IioCommandsContainerItem = interface
    ['{CD74B129-D1DB-47A5-90DF-644172D325CD}']
    procedure Execute;
    procedure FillCommandInfo(const AOwner: TComponent; const ACmdInfo: TioCommandInfo);
    function Name: String;
    function IsAction: Boolean;
    function IsMethod: Boolean;
    function IsAnonimousMethod: Boolean;
    function AsAction: TContainedAction;
    function AsMethod: TRttiMethod;
    function AsAnonimousMethod: TioCommandAnonimousMethod;
    // Owner
    procedure SetOwner(const Value: TObject);
    function GetOwner: TObject;
    property Owner:TObject read GetOwner write SetOwner;
    // Enabled
    procedure SetEnabled(const Value: Boolean);
    function GetEnabled: Boolean;
    property Enabled:Boolean read GetEnabled write SetEnabled;
    // Caption
    procedure SetCaption(const Value: String);
    function GetCaption: String;
    property Caption:String read GetCaption write SetCaption;
    // Checked
    procedure SetChecked(const Value: Boolean);
    function GetChecked: Boolean;
    property Checked:Boolean read GetChecked write SetChecked;
    // GroupIndex
    procedure setGroupIndex(const Value: Integer);
    function GetGroupIndex: Integer;
    property GroupIndex:Integer read GetGroupIndex write setGroupIndex;
    // Hint
    procedure SetHint(const Value: String);
    function GetHint: String;
    property Hint:String read GetHint write SetHint;
    // ImageIndex
    procedure SetImageIndex(const Value: TImageIndex);
    function GetImageIndex: TImageIndex;
    property ImageIndex:TImageIndex read GetImageIndex write SetImageIndex;
    // Visible
    procedure SetVisible(const Value: Boolean);
    function GetVisible: Boolean;
    property Visible:Boolean read GetVisible write SetVisible;
    // IsNotificationTarget
    procedure SetIsNotificationTarget(const Value: Boolean);
    function GetIsNotificationTarget: Boolean;
    property IsNotificationTarget:Boolean read GetIsNotificationTarget write SetIsNotificationTarget;
  end;

  IioCommandsContainer = interface
    ['{E20F72CB-9F84-44B4-A6DD-DFF73B53F0AC}']
    procedure Add(const AName:String; const ACommandItem:IioCommandsContainerItem);
    procedure LoadCommands(const AOwner:TComponent);
    procedure CopyCommands(const ADestinationCommandsContainer: IioCommandsContainer);
    procedure CopyCommand(const ACommandName:String; const ADestinationCommandsContainer: IioCommandsContainer);
    procedure RegisterAction(const AName:String; const AOwner:TComponent; const AAction:TContainedAction; const AIsNotificationTarget:Boolean=False);
    procedure RegisterMethod(const AName:String; const AOwner:TComponent; const ARttiMethod:TRttiMethod; const AIsNotificationTarget:Boolean=False);
    procedure RegisterAnonimousMethod(const AName:String; const AOwner:TComponent; const AAnonimousMethod:TioCommandAnonimousMethod; const AIsNotificationTarget:Boolean=False);
    procedure Unregister(const AOwner:TComponent);
    procedure Notify;
    procedure Execute(const AName:String; const ANoException:Boolean=False);
    procedure BindView(const AView:TComponent);
    procedure BindViewControl(const AControl:TObject; const ACommandName:String);
    function Get(const AName:String; const ANoException:Boolean=False): IioCommandsContainerItem;
  end;

implementation

uses
  System.SysUtils;

{ TioCommandInfo }

constructor TioCommandInfo.Create(const ARttiElement: TRttiNamedObject);
var
  LAttr: TCustomAttribute;
begin
  // initialization
  CommandType.Value := TioCommandType.ctNull;
  // If the RttiElement is a Method then set a reference to it
  if ARttiElement is TRttiMethod then
  begin
    ParseMethodName(ARttiElement.Name);
    RttiMethod.Value := TRttiMethod(ARttiElement);
  end;
  // Loop for attributes and collect informations about command
  for Lattr in ARttiElement.GetAttributes do
  begin
    // ioAction attribute
    if LAttr is ioAction then
    begin
      CommandType.Value := TioCommandType.ctAction;
      if not ioAction(LAttr).Name.IsEmpty then
        Name.Value := ioAction(LAttr).Name;
      if not ioAction(LAttr).Caption.IsEmpty then
        Caption.Value := ioAction(LAttr).Caption;
      if ioAction(LAttr).Event <> TioActionEvent.Null then
        Event.Value := ioAction(LAttr).Event;
    end;
    // ioCommand attribute
    if LAttr is ioCommand then
    begin
      CommandType.Value := TioCommandType.ctMethod;
      if not ioCommand(LAttr).Name.IsEmpty then
        Name.Value := ioCommand(LAttr).Name;
    end;
    // ioDisabled attribute
    if LAttr is ioDisabled then
      Enabled.Value := False;
    // ioChecked attribute
    if LAttr is ioChecked then
      Checked.Value := True;
    // ioGroupIndex attribute
    if LAttr is ioGroupIndex then
      GroupIndex.Value := ioGroupIndex(LAttr).Value;
    // ioHint attribute
    if LAttr is ioHint then
      Hint.Value := ioHint(LAttr).Value;
    // ioImageIndex attribute
    if LAttr is ioImageIndex then
      ImageIndex.Value := ioImageIndex(LAttr).Value;
    // ioInvisible attribute
    if LAttr is ioInvisible then
      Visible.Value := False;
    // ioNotificationTarget attribute
    if LAttr is ioNotificationTarget then
      NotificationTarget.Value := True;
  end;
end;

procedure TioCommandInfo.ParseMethodName(const AMethodName: String);
var
  LMethodName, LEventName: String;
  LStrings: TStrings;
begin
  // init
  LMethodName := UpperCase(AMethodName);
  // Get the command type (exit if not valid)
  if LMethodName.StartsWith('ACTION_') then
    CommandType.Value := TioCommandType.ctAction
  else
  if LMethodName.StartsWith('COMMAND_') then
    CommandType.Value := TioCommandType.ctMethod
  else
    Exit;
  // Create a StringList and load as delimited text
  LStrings := TStringList.Create;
  try
    LStrings.Delimiter := '_';
    LStrings.DelimitedText := AMethodName;
    // Load the command/action name
    if (LStrings.Count >= 2) and (not LStrings[1].IsEmpty) then
      Name.Value := LStrings[1];
    // Case by CommandType
    case CommandType.Value of
      // -----------------------------------
      // If it is an action event handler
      TioCommandType.ctAction:
        // Load the destination event of the action
        if LStrings.Count >= 3 then
        begin
          LEventName := UpperCase(LStrings[2]);
          if (LEventName = 'ONEXECUTE') or (LEventName = 'EXECUTE') then
            Event.Value := TioActionEvent.OnExecute;
          if (LEventName = 'ONUPDATE') or (LEventName = 'UPDATE') then
            Event.Value := TioActionEvent.OnUpdate;
          if (LEventName = 'ONHINT') or (LEventName = 'HINT') then
            Event.Value := TioActionEvent.OnHint;
        end;
      // -----------------------------------
      // If it is a command method
      TioCommandType.ctMethod:;
      // -----------------------------------
    end;
  finally
    LStrings.Free;
  end;
end;

end.
