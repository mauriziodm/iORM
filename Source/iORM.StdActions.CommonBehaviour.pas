unit iORM.StdActions.CommonBehaviour;

interface

uses
  iORM.StdActions.Interfaces;

type

  TioStdActionCommonBehaviour = class
  public
    class procedure ExecuteSlaveAction(const ASlaveAction: IioBSSlaveAction);
  end;

implementation

uses
  iORM, iORM.Abstraction, iORM.Exceptions;

{ TioStdActionCommonBehaviour }

class procedure TioStdActionCommonBehaviour.ExecuteSlaveAction(const ASlaveAction: IioBSSlaveAction);
begin
  if Assigned(ASlaveAction) and ASlaveAction._IsEnabled then
  begin
    // NB: Mauri 16/08/2023: Su firemonkey c'erano dee problemi soprattutto quando si usava una ListView,
    //  per risolvere, solo su FMX, eseguo le slave actions ritardate attraverso un timer.
    if TioApplication.ProjectPlatform = ppFMX then
      io.AnonymousTimer(100,
        function: boolean
        begin
          Result := ASlaveAction.Execute;
        end
      )
    else
      ASlaveAction.Execute;
  end;
end;

end.
