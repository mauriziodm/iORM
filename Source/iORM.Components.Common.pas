unit iORM.Components.Common;

interface

uses
  System.Classes;

type

  TioComponentsCommon = class
  public
    class procedure RegisterConnectionDefComponents(const AOwner:TComponent); static;
  end;

implementation

uses
  iORM.DB.Components.ConnectionDef;

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

end.
