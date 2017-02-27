unit iORM.Components.Common.Interfaces;

interface

uses
  iORM.MVVM.Components.ViewModelBridge;

type

  IioVMBridgeClientComponent = interface
    ['{A9A526A3-D6D1-4E9D-B7D6-E2E7AB117325}']
    // ViewModelBridge
    procedure SetViewModelBridge(const AVMBridge:TioViewModelBridge);
    function GetViewModelBridge: TioViewModelBridge;
    property ViewModelBridge:TioViewModelBridge read GetViewModelBridge write SetViewModelBridge;
  end;

implementation

end.
