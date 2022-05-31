unit iORM.MVVM.Actions.Interfaces;

interface

type

  IioViewAction = interface
    ['{CAC456AA-579C-4139-B24B-7C620E91B14B}']
    // Methods
    procedure DoBeforeExecute;
    procedure DoAfterExecute;
    procedure DoBeforeUpdate;
    procedure DoAfterUpdate;
    // Enabled
    procedure SetEnabled(Value: Boolean);
    function GetEnabled: Boolean;
    property Enabled: Boolean read GetEnabled write SetEnabled;
    // Visible
    procedure SetVisible(Value: Boolean);
    function GetVisible: Boolean;
    property Visible: Boolean read GetVisible write SetVisible;
  end;

  IioVMAction = interface
    ['{B4D9E2D3-3B43-490E-AD58-2D7584B87A3A}']
    // Methods
    function Execute: Boolean;
    function Update: Boolean;
    // Enabled
    procedure SetEnabled(const Value: Boolean);
    function GetEnabled: Boolean;
    property Enabled: Boolean read GetEnabled write SetEnabled;
    // Visible
    procedure SetVisible(const Value: Boolean);
    function GetVisible: Boolean;
    property Visible: Boolean read GetVisible write SetVisible;
  end;

implementation

end.
