unit iORM.Components.Common.Interfaces;

interface

uses
  iORM.MVVM.Components.ViewModelBridge, iORM.LiveBindings.Interfaces,
  iORM.MVVM.Components.ModelPresenter;

type

  IioVMBridgeClientComponent = interface
    ['{A9A526A3-D6D1-4E9D-B7D6-E2E7AB117325}']
    // ViewModelBridge
    procedure SetViewModelBridge(const AVMBridge:TioViewModelBridge);
    function GetViewModelBridge: TioViewModelBridge;
    property ViewModelBridge:TioViewModelBridge read GetViewModelBridge write SetViewModelBridge;
  end;

  IioCrossViewMasterSource = interface
    ['{5A2614C8-088E-4642-A2C0-A671EE62B517}']
    function GetModelPresenterInstance: TioModelPresenter;
    // InternalActiveAdapter
    function GetInternalActiveAdapter: IioActiveBindSourceAdapter;
    property InternalActiveAdapter: IioActiveBindSourceAdapter read GetInternalActiveAdapter;  // Must be ReadOnly
  end;

implementation

end.
