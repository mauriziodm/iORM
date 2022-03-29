unit iORM.DT.Register;

interface

procedure Register;

implementation

uses
  ToolsAPI, System.Classes, iORM.Abstraction.VCL, iORM.Abstraction.FMX, iORM.DB.ConnectionDef, iORM.DB.ConnectionDef.MSSQLServer, iORM.DB.DataSet.Master,
  iORM.DB.DataSet.Detail, iORM.DB.MemTable, iORM.LiveBindings.PrototypeBindSource.Custom, iORM.LiveBindings.PrototypeBindSource.Master,
  iORM.LiveBindings.PrototypeBindSource.Detail, DesignIntf, iORM.MVVM.ModelPresenter.Master, iORM.MVVM.ModelPresenter.Detail, iORM.MVVM.ModelDataSet,
  iORM.MVVM.ModelBindSource, iORM.MVVM.ViewModelBridge, iORM.MVVM.ViewContextProvider, System.Actions, iORM.StdActions.VCL, iORM.StdActions.FMX,
  iORM.DT.ViewModel.Wizard, iORM.MVVM.ViewModelBase, DesignEditors;

procedure Register;
begin
  // Abstraction layer components
  RegisterComponents('iORM', [TioVCL]);
  RegisterComponents('iORM', [TioFMX]);

  // Connection components
  RegisterComponents('iORM', [TioSQLMonitor]);
  RegisterComponents('iORM', [TioRESTConnectionDef]);
  RegisterComponents('iORM', [TioSQLiteConnectionDef]);
  RegisterComponents('iORM', [TioFirebirdConnectionDef]);
  RegisterComponents('iORM', [TioSQLServerConnectionDef]);

  // DataSet components
  RegisterComponents('iORM', [TioDataSetMaster]);
  RegisterComponents('iORM', [TioDataSetDetail]);
  RegisterComponents('iORM', [TioMemTable]);

  // LiveBindings components
  RegisterComponents('iORM', [TioPrototypeBindSourceMaster]);
  RegisterComponents('iORM', [TioPrototypeBindSourceDetail]);
  RegisterPropertyEditor(TypeInfo(Boolean), TioPrototypeBindSourceMaster, 'AutoEdit', nil); // Hide property in the ObjectInspector
  RegisterPropertyEditor(TypeInfo(Boolean), TioPrototypeBindSourceMaster, 'AutoPost', nil); // Hide property in the ObjectInspector

  // MVVM components
  RegisterComponents('iORM', [TioViewModelBridge]);
  RegisterComponents('iORM', [TioViewContextProvider]);
  RegisterComponents('iORM', [TioModelPresenterMaster]);
  RegisterComponents('iORM', [TioModelPresenterDetail]);
  RegisterComponents('iORM', [TioModelDataSet]);
  RegisterComponents('iORM', [TioModelBindSource]);

  // VCL standard actions
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.VCL.TioBSPersistenceAppend], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.VCL.TioBSPersistenceClear], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.VCL.TioBSPersistenceDelete], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.VCL.TioBSPersistenceInsert], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.VCL.TioBSPersistencePersist], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.VCL.TioBSPersistenceReload], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.VCL.TioBSPersistenceRevert], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.VCL.TioBSPersistenceSaveRevertPoint], nil);

  // FMX standard actions
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.FMX.TioBSPersistenceAppend], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.FMX.TioBSPersistenceClear], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.FMX.TioBSPersistenceDelete], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.FMX.TioBSPersistenceInsert], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.FMX.TioBSPersistencePersist], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.FMX.TioBSPersistenceReload], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.FMX.TioBSPersistenceRevert], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.FMX.TioBSPersistenceSaveRevertPoint], nil);

  // IDE Wizards
  RegisterPackageWizard(TioViewModelWizard.Create);
  RegisterCustomModule(TioViewModel, TCustomModule)
end;

end.
