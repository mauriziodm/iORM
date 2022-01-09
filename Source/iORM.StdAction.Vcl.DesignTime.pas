unit iORM.StdAction.Vcl.DesignTime;

interface

procedure Register;

implementation

uses
  iORM.StdActions.Vcl, System.Actions;

procedure Register;
begin
  RegisterActions('iORM-BSPersistence', [TioBSPersistenceSaveRevertPoint], nil);
  RegisterActions('iORM-BSPersistence', [TioBSPersistenceClear], nil);
  RegisterActions('iORM-BSPersistence', [TioBSPersistencePersist], nil);
  RegisterActions('iORM-BSPersistence', [TioBSPersistenceRevert], nil);
  RegisterActions('iORM-BSPersistence', [TioBSPersistenceDelete], nil);
end;

end.
