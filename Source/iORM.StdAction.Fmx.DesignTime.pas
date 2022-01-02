unit iORM.StdAction.Fmx.DesignTime;

interface

procedure Register;

implementation

uses
  System.Actions, iORM.DB.Components.BindSourceObjState.StdActions.FMX;

procedure Register;
begin
  RegisterActions('iORM', [TioTestActionFMX], nil);
end;

end.
