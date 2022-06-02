unit iORM.MVVM.Actions.Interfaces;

interface

uses
  System.Classes;

type

  IioViewAction = interface;

  IioVMAction = interface
    ['{B4D9E2D3-3B43-490E-AD58-2D7584B87A3A}']
    // Methods
    procedure BindViewAction(const AViewAction: IioViewAction);
    procedure UnbindViewAction(const AViewAction: IioViewAction);
    function Execute: Boolean;
    function Update: Boolean;
    // Caption property
    procedure SetCaption(const Value: string);
    function GetCaption: String;
    property Caption: string read GetCaption write SetCaption;
    // Enabled property
    procedure SetEnabled(const Value: Boolean);
    function GetEnabled: Boolean;
    property Enabled: Boolean read GetEnabled write SetEnabled;
    // Name property
    procedure SetName(const NewName: TComponentName);
    function GetName: TComponentName;
    property Name: TComponentName read GetName write SetName;
    // Owner
    function GetOwner: TPersistent;
    property Owner: TPersistent read GetOwner;
    // Visible property
    procedure SetVisible(const Value: Boolean);
    function GetVisible: Boolean;
    property Visible: Boolean read GetVisible write SetVisible;
  end;

  IioViewAction = interface
    ['{CAC456AA-579C-4139-B24B-7C620E91B14B}']
    // Methods
    procedure DoBeforeExecute;
    procedure DoAfterExecute;
    procedure DoBeforeUpdate;
    procedure DoAfterUpdate;
    // Caption property
    procedure SetCaption(const Value: string);
    function GetCaption: String;
    property Caption: string read GetCaption write SetCaption;
    // CaptionLinkedToAction property
    procedure SetCaptionLinkedToVMAction(Value: Boolean);
    function GetCaptionLinkedToVMAction: Boolean;
    property CaptionLinkedToVMAction: Boolean read GetCaptionLinkedToVMAction write SetCaptionLinkedToVMAction;
    // Enabled
    procedure SetEnabled(Value: Boolean);
    function GetEnabled: Boolean;
    property Enabled: Boolean read GetEnabled write SetEnabled;
    // EnabledLinkedToAction property
    procedure SetEnabledLinkedToVMAction(Value: Boolean);
    function GetEnabledLinkedToVMAction: Boolean;
    property EnabledLinkedToVMAction: Boolean read GetEnabledLinkedToVMAction write SetEnabledLinkedToVMAction;
    // Name property
    procedure SetName(const NewName: TComponentName);
    function GetName: TComponentName;
    property Name: TComponentName read GetName write SetName;
    // Visible
    procedure SetVisible(Value: Boolean);
    function GetVisible: Boolean;
    property Visible: Boolean read GetVisible write SetVisible;
    // EnabledLinkedToAction property
    procedure SetVisibleLinkedToVMAction(Value: Boolean);
    function GetVisibleLinkedToVMAction: Boolean;
    property VisibleLinkedToVMAction: Boolean read GetVisibleLinkedToVMAction write SetVisibleLinkedToVMAction;
    // VMAction property
    procedure SetVMAction(Value: IioVMAction);
    function GetVMAction: IioVMAction;
    property VMAction: IioVMAction read GetVMAction write SetVMAction;
    // VMActionName property
    procedure SetVMActionName(Value: String);
    function GetVMActionName: String;
    property VMActionName: String read GetVMActionName write SetVMActionName;
  end;

implementation

end.
