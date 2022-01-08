unit iORM.StdAction.Fmx.DesignTime;

interface

procedure Register;

implementation

uses
  System.Actions, iORM.StdActions.Fmx;

procedure Register;
begin
  RegisterActions('iORM-BSPersistence', [TioBSPersistenceSaveRevertPoint], nil);
  RegisterActions('iORM-BSPersistence', [TioBSPersistenceClear], nil);
  RegisterActions('iORM-BSPersistence', [TioBSPersistencePersist], nil);
  RegisterActions('iORM-BSPersistence', [TioBSPersistenceRevert], nil);
end;

end.
