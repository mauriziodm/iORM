unit iORM.StdAction.Fmx.DesignTime;

interface

procedure Register;

implementation

uses
  System.Actions, iORM.StdActions.Fmx;

procedure Register;
begin
  RegisterActions('iORM-BSPersistence', [TioBSPersistenceClear], nil);
  RegisterActions('iORM-BSPersistence', [TioBSPersistenceDelete], nil);
  RegisterActions('iORM-BSPersistence', [TioBSPersistencePersist], nil);
  RegisterActions('iORM-BSPersistence', [TioBSPersistenceRevert], nil);
  RegisterActions('iORM-BSPersistence', [TioBSPersistenceSaveRevertPoint], nil);
end;

end.
