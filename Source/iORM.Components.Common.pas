unit iORM.Components.Common;

interface

uses
  System.Classes, iORM.Components.Common.Interfaces;

type

  TioComponentsCommon = class
  public
    class procedure RegisterConnectionDefComponents(const AOwner:TComponent); static;
    class procedure ViewModelBridgeAutosetting(
      const AVMBridgeClientComponent: IioVMBridgeClientComponent;
      const AOwner: TComponent);
  end;

implementation

uses
  iORM.DB.Components.ConnectionDef, System.SysUtils,
  iORM.MVVM.Components.ViewModelBridge;

{ TioComponentsCommon }

class procedure TioComponentsCommon.RegisterConnectionDefComponents(
  const AOwner: TComponent);
var
  I: Integer;
  LConnectionDef: TioCustomConnectionDef;
begin
  // Loop for Owner's components
  for I := 0 to AOwner.ComponentCount-1 do
  begin
    // If the current component is a ConnectionDef then register it
    //  if not already registered.
    if AOwner.Components[I] is TioCustomConnectionDef then
    begin
      LConnectionDef := TioCustomConnectionDef(AOwner.Components[I]);
      if not LConnectionDef.IsRegistered then
        LConnectionDef.RegisterConnectionDef;
    end;
  end;
end;

class procedure TioComponentsCommon.ViewModelBridgeAutosetting(
  const AVMBridgeClientComponent: IioVMBridgeClientComponent;
  const AOwner: TComponent);
var
  I: Integer;
  procedure AutoCreateViewModelBridgeIfNotExist;
  var
    LVMBridge: TioViewModelBridge;
    LNewDesignInfo:LongRec;
  begin
    LVMBridge := TioViewModelBridge.Create(AOwner);
    LVMBridge.Name := 'ioViewModelBridge1';
    // Set position at design time
    LNewDesignInfo.Hi := Word(50);
    LNewDesignInfo.Lo := Word(50);
    LVMBridge.DesignInfo := Longint(LNewDesignInfo);
    // Call the ViewModelBridgeAutosetting again
    ViewModelBridgeAutosetting(AVMBridgeClientComponent, AOwner);
  end;
begin
  // Loop for Owner's components
  for I := 0 to AOwner.ComponentCount-1 do
    // If the current component is a ConnectionDef then register it
    //  if not already registered.
    if AOwner.Components[I] is TioViewModelBridge then
    begin
      AVMBridgeClientComponent.ViewModelBridge := TioViewModelBridge(AOwner.Components[I]);
      Exit;
    end;
  // If a ViewModelBridge does not exist then create it automatically
  if not (csLoading in AOwner.ComponentState) then
    AutoCreateViewModelBridgeIfNotExist;
end;

end.
