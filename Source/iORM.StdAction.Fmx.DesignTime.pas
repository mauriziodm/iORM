unit iORM.StdAction.Fmx.DesignTime;

interface

procedure Register;

implementation

uses
  System.Actions, iORM.DB.Components.BindSourceObjState.StdActions.FMX;

procedure Register;
begin
  RegisterActions('iORM-BSObjState', [TioBSObjStateSave], nil);
  RegisterActions('iORM-BSObjState', [TioBSObjStateClear], nil);
  RegisterActions('iORM-BSObjState', [TioBSObjStatePersist], nil);
  RegisterActions('iORM-BSObjState', [TioBSObjStateRevert], nil);
end;

end.
