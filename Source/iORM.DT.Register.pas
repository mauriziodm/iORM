unit iORM.DT.Register;

interface

procedure Register;

implementation

uses
  ToolsAPI, System.Classes, iORM.Abstraction.VCL, iORM.Abstraction.FMX, iORM.DB.ConnectionDef, iORM.DB.DataSet.Master,
{$IFNDEF ioDelphiProfessional}
  iORM.DB.ConnectionDef.MSSQLServer,
{$ENDIF}
  iORM.DB.DataSet.Detail, iORM.DB.MemTable, iORM.LiveBindings.PrototypeBindSource.Custom, iORM.LiveBindings.PrototypeBindSource.Master,
  iORM.LiveBindings.PrototypeBindSource.Detail, DesignIntf, iORM.MVVM.ModelPresenter.Master, iORM.MVVM.ModelPresenter.Detail, iORM.MVVM.ModelDataSet,
  iORM.MVVM.ModelBindSource, iORM.MVVM.ViewModelBridge, iORM.MVVM.ViewContextProvider, System.Actions, iORM.StdActions.VCL, iORM.StdActions.FMX,
  iORM.DT.ViewModel.Wizard, iORM.MVVM.ViewModel, DesignEditors, iORM.StdActions.CloseQueryRepeater, iORM.Abstraction.uniGUI,
  iORM.DT.CompAutoUses, iORM.MVVM.VMAction;




procedure Register;
begin
  // Abstraction layer components
  RegisterComponents('iORM - Abstraction layer', [TioVCL]);
  RegisterComponents('iORM - Abstraction layer', [TioFMX]);
  RegisterComponents('iORM - Abstraction layer', [TioUniGUI]);

  // Connection components
  RegisterComponents('iORM - Connections', [TioHttpConnectionDef]);
  RegisterSelectionEditor(TioHttpConnectionDef, TioConnectionDefSelectionEditor);
  RegisterComponents('iORM - Connections', [TioSQLiteConnectionDef]);
  RegisterSelectionEditor(TioSQLiteConnectionDef, TioConnectionDefSelectionEditor);
  RegisterComponents('iORM - Connections', [TioFirebirdConnectionDef]);
  RegisterSelectionEditor(TioFirebirdConnectionDef, TioConnectionDefSelectionEditor);
{$IFNDEF ioDelphiProfessional}
  RegisterComponents('iORM - Connections', [TioSQLServerConnectionDef]);
  RegisterSelectionEditor(TioSQLServerConnectionDef, TioConnectionDefSelectionEditor);
{$ENDIF}
  RegisterComponents('iORM - Connections', [TioSQLMonitor]);

  // DataSet components
  RegisterComponents('iORM - DataSet', [TioMemTable]);
  RegisterComponents('iORM - DataSet', [TioDataSetMaster]);
  RegisterSelectionEditor(TioDataSetMaster, TioBindSourceSelectionEditor);
  RegisterComponents('iORM - DataSet', [TioDataSetDetail]);
  RegisterSelectionEditor(TioDataSetDetail, TioBindSourceSelectionEditor);

  // LiveBindings components
  RegisterComponents('iORM - LiveBindings', [TioPrototypeBindSourceMaster]);
  RegisterSelectionEditor(TioPrototypeBindSourceMaster, TioBindSourceSelectionEditor);
  UnlistPublishedProperty(TioPrototypeBindSourceMaster, 'AutoActivate');
  UnlistPublishedProperty(TioPrototypeBindSourceMaster, 'AutoEdit');
  UnlistPublishedProperty(TioPrototypeBindSourceMaster, 'AutoPost');
  UnlistPublishedProperty(TioPrototypeBindSourceMaster, 'RecordCount');
  UnlistPublishedProperty(TioPrototypeBindSourceMaster, 'OnCreateAdapter');
  RegisterComponents('iORM - LiveBindings', [TioPrototypeBindSourceDetail]);
  RegisterSelectionEditor(TioPrototypeBindSourceDetail, TioBindSourceSelectionEditor);
  UnlistPublishedProperty(TioPrototypeBindSourceDetail, 'AutoActivate');
  UnlistPublishedProperty(TioPrototypeBindSourceDetail, 'AutoEdit');
  UnlistPublishedProperty(TioPrototypeBindSourceDetail, 'AutoPost');
  UnlistPublishedProperty(TioPrototypeBindSourceDetail, 'RecordCount');
  UnlistPublishedProperty(TioPrototypeBindSourceDetail, 'OnCreateAdapter');

  // MVVM components
  RegisterComponents('iORM - MVVM', [TioViewModelBridge]);
  RegisterSelectionEditor(TioViewModelBridge, TioMVVMSelectionEditor);
  RegisterComponents('iORM - MVVM', [TioViewContextProvider]);
  RegisterSelectionEditor(TioViewContextProvider, TioMVVMSelectionEditor);
  RegisterComponents('iORM - MVVM', [TioModelPresenterMaster]);
  RegisterSelectionEditor(TioModelPresenterMaster, TioBindSourceSelectionEditor);
  RegisterComponents('iORM - MVVM', [TioModelPresenterDetail]);
  RegisterSelectionEditor(TioModelPresenterDetail, TioBindSourceSelectionEditor);
  RegisterComponents('iORM - MVVM', [TioModelDataSet]);
  RegisterComponents('iORM - MVVM', [TioModelBindSource]);
  UnlistPublishedProperty(TioModelBindSource, 'AutoActivate');
  UnlistPublishedProperty(TioModelBindSource, 'AutoEdit');
  UnlistPublishedProperty(TioModelBindSource, 'AutoPost');
  UnlistPublishedProperty(TioModelBindSource, 'RecordCount');
  UnlistPublishedProperty(TioModelBindSource, 'OnCreateAdapter');

  // MVVM - VMActions
  RegisterComponents('iORM - MVVM - VMActions', [TioVMAction]);
  RegisterComponents('iORM - MVVM - VMActions - BS', [TioVMActionBSShowOrSelect]);
  RegisterComponents('iORM - MVVM - VMActions - BS', [TioVMActionBSCloseQuery]);
  RegisterComponents('iORM - MVVM - VMActions - BS - ETM', [TioVMActionBS_ETM_RevertToObject]);
  RegisterComponents('iORM - MVVM - VMActions - BS - ETM', [TioVMActionBS_ETM_RevertToBindSource]);
  RegisterComponents('iORM - MVVM - VMActions - BS - Paging', [TioVMActionBSNextPage]);
  RegisterComponents('iORM - MVVM - VMActions - BS - Paging', [TioVMActionBSPrevPage]);
  RegisterComponents('iORM - MVVM - VMActions - BS - WhereBuilder', [TioVMActionBSBuildWhere]);
  RegisterComponents('iORM - MVVM - VMActions - BS - WhereBuilder', [TioVMActionBSClearWhere]);
  RegisterComponents('iORM - MVVM - VMActions - BS - Persistence', [TioVMActionBSSelectCurrent]);
  RegisterSelectionEditor(TioVMActionBSSelectCurrent, TioMVVMSelectionEditor);
  RegisterComponents('iORM - MVVM - VMActions - BS - Persistence', [TioVMActionBSPersistenceSaveRevertPoint]);
  RegisterComponents('iORM - MVVM - VMActions - BS - Persistence', [TioVMActionBSPersistenceClear]);
  RegisterComponents('iORM - MVVM - VMActions - BS - Persistence', [TioVMActionBSPersistencePersist]);
  RegisterComponents('iORM - MVVM - VMActions - BS - Persistence', [TioVMActionBSPersistenceRevert]);
  RegisterComponents('iORM - MVVM - VMActions - BS - Persistence', [TioVMActionBSPersistenceRevertOrDelete]);
  RegisterComponents('iORM - MVVM - VMActions - BS - Persistence', [TioVMActionBSPersistenceDelete]);
  RegisterComponents('iORM - MVVM - VMActions - BS - Persistence', [TioVMActionBSPersistenceReload]);
  RegisterComponents('iORM - MVVM - VMActions - BS - Persistence', [TioVMActionBSPersistenceAppend]);
  RegisterSelectionEditor(TioVMActionBSPersistenceAppend, TioMVVMSelectionEditor);
  RegisterComponents('iORM - MVVM - VMActions - BS - Persistence', [TioVMActionBSPersistenceInsert]);
  RegisterSelectionEditor(TioVMActionBSPersistenceInsert, TioMVVMSelectionEditor);

  // VCL standard actions
  RegisterActions('iORM - BS', [iORM.StdActions.Vcl.TioBSSelectCurrent], nil);
  RegisterActions('iORM - BS', [iORM.StdActions.Vcl.TioBSShowOrSelect], nil);
  RegisterActions('iORM - BS', [iORM.StdActions.Vcl.TioBSCloseQuery], nil);
  RegisterActions('iORM - BS - ETM', [iORM.StdActions.Vcl.TioBS_ETM_RevertToObject], nil);
  RegisterActions('iORM - BS - ETM', [iORM.StdActions.Vcl.TioBS_ETM_RevertToBindSource], nil);
  RegisterActions('iORM - BS - Paging', [iORM.StdActions.Vcl.TioBSNextPage], nil);
  RegisterActions('iORM - BS - Paging', [iORM.StdActions.Vcl.TioBSPrevPage], nil);
  RegisterActions('iORM - BS - WhereBuilder', [iORM.StdActions.Vcl.TioBSBuildWhere], nil);
  RegisterActions('iORM - BS - WhereBuilder', [iORM.StdActions.Vcl.TioBSClearWhere], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Vcl.TioBSPersistenceAppend], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Vcl.TioBSPersistenceClear], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Vcl.TioBSPersistenceDelete], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Vcl.TioBSPersistenceInsert], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Vcl.TioBSPersistencePersist], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Vcl.TioBSPersistenceReload], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Vcl.TioBSPersistenceRevert], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Vcl.TioBSPersistenceRevertOrDelete], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Vcl.TioBSPersistenceSaveRevertPoint], nil);
  RegisterActions('iORM - MVVM', [iORM.StdActions.Vcl.TioViewAction], nil);

  // FMX standard actions
  RegisterActions('iORM - BS', [iORM.StdActions.Fmx.TioBSSelectCurrent], nil);
  RegisterActions('iORM - BS', [iORM.StdActions.Fmx.TioBSShowOrSelect], nil);
  RegisterActions('iORM - BS', [iORM.StdActions.Fmx.TioBSCloseQuery], nil);
  RegisterActions('iORM - BS - ETM', [iORM.StdActions.Fmx.TioBS_ETM_RevertToObject], nil);
  RegisterActions('iORM - BS - ETM', [iORM.StdActions.Fmx.TioBS_ETM_RevertToBindSource], nil);
  RegisterActions('iORM - BS - Paging', [iORM.StdActions.Fmx.TioBSNextPage], nil);
  RegisterActions('iORM - BS - Paging', [iORM.StdActions.Fmx.TioBSPrevPage], nil);
  RegisterActions('iORM - BS - WhereBuilder', [iORM.StdActions.Fmx.TioBSBuildWhere], nil);
  RegisterActions('iORM - BS - WhereBuilder', [iORM.StdActions.Fmx.TioBSClearWhere], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Fmx.TioBSPersistenceAppend], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Fmx.TioBSPersistenceClear], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Fmx.TioBSPersistenceDelete], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Fmx.TioBSPersistenceInsert], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Fmx.TioBSPersistencePersist], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Fmx.TioBSPersistenceReload], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Fmx.TioBSPersistenceRevert], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Fmx.TioBSPersistenceRevertOrDelete], nil);
  RegisterActions('iORM - BS - Persistence', [iORM.StdActions.Fmx.TioBSPersistenceSaveRevertPoint], nil);
  RegisterActions('iORM - MVVM', [iORM.StdActions.Fmx.TioViewAction], nil);
  UnlistPublishedProperty(iORM.StdActions.Fmx.TioViewAction, 'Text');
  UnlistPublishedProperty(iORM.StdActions.Fmx.TioViewAction, 'OnExecute');
  UnlistPublishedProperty(iORM.StdActions.Fmx.TioViewAction, 'OnUpdate');

  // StdActions common
  RegisterComponents('iORM - Other', [TioCloseQueryRepeater]);

  // IDE Wizards
  RegisterPackageWizard(TioViewModelWizard.Create);
  RegisterCustomModule(TioViewModel, TCustomModule);
//  RegisterCustomModule(TioViewModel, TDataModuleCustomModule); // TDataModuleCustomModule is declared in "DMForm" unit
end;

end.
