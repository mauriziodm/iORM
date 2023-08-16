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
  iORM, iORM.Abstraction, iORM.Exceptions, iORM.StdActions.Fmx;

{ TioStdActionCommonBehaviour }

class function TioStdActionCommonBehaviour.ExecuteSlaveAction(const ASlaveAction: IioBSSlaveAction; const ADelayed: Boolean = False): Boolean;
begin
  Result := False;
  if Assigned(ASlaveAction) and ASlaveAction._IsEnabled then
  begin
    if ADelayed then
      io.AnonymousTimer(100,
        function: boolean
        begin
          Result := ASlaveAction.Execute;
        end
      )
    else
      ASlaveAction.Execute;
    Result := True;
  end;
end;

end.
