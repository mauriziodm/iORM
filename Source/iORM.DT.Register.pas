unit iORM.DT.Register;

interface

procedure Register;

implementation

uses
  ToolsAPI, System.Classes, iORM.Abstraction.VCL, iORM.Abstraction.FMX, iORM.DB.ConnectionDef, iORM.DB.ConnectionDef.MSSQLServer, iORM.DB.DataSet.Master,
  iORM.DB.DataSet.Detail, iORM.DB.MemTable, iORM.LiveBindings.PrototypeBindSource.Custom, iORM.LiveBindings.PrototypeBindSource.Master,
  iORM.LiveBindings.PrototypeBindSource.Detail, DesignIntf, iORM.MVVM.ModelPresenter.Master, iORM.MVVM.ModelPresenter.Detail, iORM.MVVM.ModelDataSet,
  iORM.MVVM.ModelBindSource, iORM.MVVM.ViewModelBridge, iORM.MVVM.ViewContextProvider, System.Actions, iORM.StdActions.VCL, iORM.StdActions.FMX,
  iORM.DT.ViewModel.Wizard, iORM.MVVM.ViewModel, DesignEditors,
  iORM.DT.CompAutoUses;

procedure Register;
begin
  // Abstraction layer components
  RegisterComponents('iORM', [TioVCL]);
  RegisterComponents('iORM', [TioFMX]);

  // Connection components
  RegisterComponents('iORM', [TioRemoteConnectionDef]);
  RegisterComponents('iORM', [TioSQLiteConnectionDef]);
  RegisterComponents('iORM', [TioFirebirdConnectionDef]);
  RegisterComponents('iORM', [TioSQLServerConnectionDef]);
  RegisterSelectionEditor(TioRemoteConnectionDef, TioConnectionDefSelectionEditor);
  RegisterSelectionEditor(TioSQLiteConnectionDef, TioConnectionDefSelectionEditor);
  RegisterSelectionEditor(TioFirebirdConnectionDef, TioConnectionDefSelectionEditor);
  RegisterSelectionEditor(TioSQLServerConnectionDef, TioConnectionDefSelectionEditor);
  RegisterComponents('iORM', [TioSQLMonitor]);

  // DataSet components
  RegisterComponents('iORM', [TioMemTable]);
  RegisterComponents('iORM', [TioDataSetMaster]);
  RegisterComponents('iORM', [TioDataSetDetail]);
  RegisterSelectionEditor(TioDataSetMaster, TioBindSourceSelectionEditor);
  RegisterSelectionEditor(TioDataSetDetail, TioBindSourceSelectionEditor);

  // LiveBindings components
  RegisterComponents('iORM', [TioPrototypeBindSourceMaster]);
//  UnlistPublishedProperty(TioPrototypeBindSourceMaster, 'AutoActivate');
  UnlistPublishedProperty(TioPrototypeBindSourceMaster, 'AutoEdit');
  UnlistPublishedProperty(TioPrototypeBindSourceMaster, 'AutoPost');
  UnlistPublishedProperty(TioPrototypeBindSourceMaster, 'RecordCount');
  UnlistPublishedProperty(TioPrototypeBindSourceMaster, 'OnCreateAdapter');
  RegisterComponents('iORM', [TioPrototypeBindSourceDetail]);
//  UnlistPublishedProperty(TioPrototypeBindSourceDetail, 'AutoActivate');
  UnlistPublishedProperty(TioPrototypeBindSourceDetail, 'AutoEdit');
  UnlistPublishedProperty(TioPrototypeBindSourceDetail, 'AutoPost');
  UnlistPublishedProperty(TioPrototypeBindSourceDetail, 'RecordCount');
  UnlistPublishedProperty(TioPrototypeBindSourceDetail, 'OnCreateAdapter');
  RegisterSelectionEditor(TioPrototypeBindSourceMaster, TioBindSourceSelectionEditor);
  RegisterSelectionEditor(TioPrototypeBindSourceDetail, TioBindSourceSelectionEditor);

  // MVVM components
  RegisterComponents('iORM', [TioViewModelBridge]);
  RegisterComponents('iORM', [TioViewContextProvider]);
  RegisterComponents('iORM', [TioModelPresenterMaster]);
  RegisterComponents('iORM', [TioModelPresenterDetail]);
  RegisterComponents('iORM', [TioModelDataSet]);
  RegisterComponents('iORM', [TioModelBindSource]);
  RegisterSelectionEditor(TioViewModelBridge, TioMVVMSelectionEditor);
  RegisterSelectionEditor(TioViewContextProvider, TioMVVMSelectionEditor);
  RegisterSelectionEditor(TioModelPresenterMaster, TioBindSourceSelectionEditor);
  RegisterSelectionEditor(TioModelPresenterDetail, TioBindSourceSelectionEditor);

  // VCL standard actions
  RegisterActions('iORM-BS', [iORM.StdActions.VCL.TioBSSelectCurrent], nil);
  RegisterActions('iORM-BSPaging', [iORM.StdActions.VCL.TioBSNextPage], nil);
  RegisterActions('iORM-BSPaging', [iORM.StdActions.VCL.TioBSPrevPage], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.VCL.TioBSPersistenceAppend], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.VCL.TioBSPersistenceClear], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.VCL.TioBSPersistenceDelete], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.VCL.TioBSPersistenceInsert], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.VCL.TioBSPersistencePersist], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.VCL.TioBSPersistenceReload], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.VCL.TioBSPersistenceRevert], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.VCL.TioBSPersistenceSaveRevertPoint], nil);

  // FMX standard actions
  RegisterActions('iORM-BS', [iORM.StdActions.FMX.TioBSSelectCurrent], nil);
  RegisterActions('iORM-BSPaging', [iORM.StdActions.FMX.TioBSNextPage], nil);
  RegisterActions('iORM-BSPaging', [iORM.StdActions.FMX.TioBSPrevPage], nil);
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
  RegisterCustomModule(TioViewModel, TCustomModule);
//  RegisterCustomModule(TioViewModel, TDataModuleCustomModule); // TDataModuleCustomModule is declared in "DMForm" unit
end;

end.
