unit iORM.StdActions.CommonBehaviour;

interface

uses
  iORM.StdActions.Interfaces;

type

  TioStdActionCommonBehaviour = class
  public
    class function ExecuteSlaveAction(const ASlaveAction: IioBSSlaveAction; const ADelayed: Boolean = False): Boolean;
  end;

implementation

uses
  iORM, iORM.Abstraction, iORM.Exceptions, iORM.StdActions.Fmx,
  System.SysUtils;

{ TioStdActionCommonBehaviour }

class function TioStdActionCommonBehaviour.ExecuteSlaveAction(const ASlaveAction: IioBSSlaveAction; const ADelayed: Boolean = False): Boolean;
var
  LMethod: TFunc<Boolean>;
begin
  Result := False;
  LMethod := nil;
  // If the ASlaveAction is assigned and enabled...
  if Assigned(ASlaveAction) and ASlaveAction._IsEnabled then
  begin
    // Define the merhod to execute the SlaveAction
    LMethod := function: Boolean
    begin
      ASlaveAction.ExecutionMode := emPassive;
      try
        Result := ASlaveAction.Execute;
      finally
        ASlaveAction.ExecutionMode := emActive;
      end;
    end;
    // Execute the method (slave action) in  delayed or normal (Immediate) mode
    if ADelayed then
      io.AnonymousTimer(100, LMethod)
    else
      LMethod;
    // Return true
    Result := true;
  end;
end;

end.
