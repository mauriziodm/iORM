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
  iORM.DT.CompAutoUses, iORM.MVVM.VMAction;

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
  UnlistPublishedProperty(TioPrototypeBindSourceMaster, 'AutoActivate');
  UnlistPublishedProperty(TioPrototypeBindSourceMaster, 'AutoEdit');
  UnlistPublishedProperty(TioPrototypeBindSourceMaster, 'AutoPost');
  UnlistPublishedProperty(TioPrototypeBindSourceMaster, 'RecordCount');
  UnlistPublishedProperty(TioPrototypeBindSourceMaster, 'OnCreateAdapter');
  RegisterComponents('iORM', [TioPrototypeBindSourceDetail]);
  UnlistPublishedProperty(TioPrototypeBindSourceDetail, 'AutoActivate');
  UnlistPublishedProperty(TioPrototypeBindSourceDetail, 'AutoEdit');
  UnlistPublishedProperty(TioPrototypeBindSourceDetail, 'AutoPost');
  UnlistPublishedProperty(TioPrototypeBindSourceDetail, 'RecordCount');
  UnlistPublishedProperty(TioPrototypeBindSourceDetail, 'OnCreateAdapter');
  RegisterSelectionEditor(TioPrototypeBindSourceMaster, TioBindSourceSelectionEditor);
  RegisterSelectionEditor(TioPrototypeBindSourceDetail, TioBindSourceSelectionEditor);

  // MVVM components
  RegisterComponents('iORM-MVVM', [TioViewModelBridge]);
  RegisterComponents('iORM-MVVM', [TioViewContextProvider]);
  RegisterComponents('iORM-MVVM', [TioModelPresenterMaster]);
  RegisterComponents('iORM-MVVM', [TioModelPresenterDetail]);
  RegisterComponents('iORM-MVVM', [TioModelDataSet]);
  RegisterComponents('iORM-MVVM', [TioModelBindSource]);
  UnlistPublishedProperty(TioModelBindSource, 'AutoActivate');
  UnlistPublishedProperty(TioModelBindSource, 'AutoEdit');
  UnlistPublishedProperty(TioModelBindSource, 'AutoPost');
  UnlistPublishedProperty(TioModelBindSource, 'RecordCount');
  UnlistPublishedProperty(TioModelBindSource, 'OnCreateAdapter');
  RegisterSelectionEditor(TioViewModelBridge, TioMVVMSelectionEditor);
  RegisterSelectionEditor(TioViewContextProvider, TioMVVMSelectionEditor);
  RegisterSelectionEditor(TioModelPresenterMaster, TioBindSourceSelectionEditor);
  RegisterSelectionEditor(TioModelPresenterDetail, TioBindSourceSelectionEditor);
  RegisterComponents('iORM-MVVM-VMActions', [TioVMAction]);
  RegisterComponents('iORM-MVVM-VMActions', [TioVMActionBSNextPage]);
  RegisterComponents('iORM-MVVM-VMActions', [TioVMActionBSPrevPage]);
  RegisterComponents('iORM-MVVM-VMActions', [TioVMActionBSSelectCurrent]);

  // VCL standard actions
  RegisterActions('iORM-BS', [iORM.StdActions.Vcl.TioBSSelectCurrent], nil);
  RegisterActions('iORM-BSPaging', [iORM.StdActions.Vcl.TioBSNextPage], nil);
  RegisterActions('iORM-BSPaging', [iORM.StdActions.Vcl.TioBSPrevPage], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.Vcl.TioBSPersistenceAppend], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.Vcl.TioBSPersistenceClear], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.Vcl.TioBSPersistenceDelete], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.Vcl.TioBSPersistenceInsert], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.Vcl.TioBSPersistencePersist], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.Vcl.TioBSPersistenceReload], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.Vcl.TioBSPersistenceRevert], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.Vcl.TioBSPersistenceRevertOrDelete], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.Vcl.TioBSPersistenceSaveRevertPoint], nil);
  RegisterActions('iORM-MVVM', [iORM.StdActions.Vcl.TioViewAction], nil);
  UnlistPublishedProperty(iORM.StdActions.Vcl.TioViewAction, 'OnExecute');
  UnlistPublishedProperty(iORM.StdActions.Vcl.TioViewAction, 'OnUpdate');

  // FMX standard actions
  RegisterActions('iORM-BS', [iORM.StdActions.Fmx.TioBSSelectCurrent], nil);
  RegisterActions('iORM-BSPaging', [iORM.StdActions.Fmx.TioBSNextPage], nil);
  RegisterActions('iORM-BSPaging', [iORM.StdActions.Fmx.TioBSPrevPage], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.Fmx.TioBSPersistenceAppend], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.Fmx.TioBSPersistenceClear], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.Fmx.TioBSPersistenceDelete], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.Fmx.TioBSPersistenceInsert], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.Fmx.TioBSPersistencePersist], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.Fmx.TioBSPersistenceReload], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.Fmx.TioBSPersistenceRevert], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.Fmx.TioBSPersistenceRevertOrDelete], nil);
  RegisterActions('iORM-BSPersistence', [iORM.StdActions.Fmx.TioBSPersistenceSaveRevertPoint], nil);
  RegisterActions('iORM-MVVM', [iORM.StdActions.Fmx.TioViewAction], nil);
  UnlistPublishedProperty(iORM.StdActions.Fmx.TioViewAction, 'Text');
  UnlistPublishedProperty(iORM.StdActions.Fmx.TioViewAction, 'OnExecute');
  UnlistPublishedProperty(iORM.StdActions.Fmx.TioViewAction, 'OnUpdate');

  // IDE Wizards
  RegisterPackageWizard(TioViewModelWizard.Create);
  RegisterCustomModule(TioViewModel, TCustomModule);
//  RegisterCustomModule(TioViewModel, TDataModuleCustomModule); // TDataModuleCustomModule is declared in "DMForm" unit
end;

end.
