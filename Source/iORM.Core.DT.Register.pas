{
  ****************************************************************************
  *                                                                          *
  *           iORM - (interfaced ORM)                                        *
  *                                                                          *
  *           Copyright (C) 2015-2023 Maurizio Del Magno                     *
  *                                                                          *
  *           mauriziodm@levantesw.it                                        *
  *           mauriziodelmagno@gmail.com                                     *
  *           https://github.com/mauriziodm/iORM.git                         *
  *                                                                          *
  ****************************************************************************
  *                                                                          *
  * This file is part of iORM (Interfaced Object Relational Mapper).         *
  *                                                                          *
  * Licensed under the GNU Lesser General Public License, Version 3;         *
  *  you may not use this file except in compliance with the License.        *
  *                                                                          *
  * iORM is free software: you can redistribute it and/or modify             *
  * it under the terms of the GNU Lesser General Public License as published *
  * by the Free Software Foundation, either version 3 of the License, or     *
  * (at your option) any later version.                                      *
  *                                                                          *
  * iORM is distributed in the hope that it will be useful,                  *
  * but WITHOUT ANY WARRANTY; without even the implied warranty of           *
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            *
  * GNU Lesser General Public License for more details.                      *
  *                                                                          *
  * You should have received a copy of the GNU Lesser General Public License *
  * along with iORM.  If not, see <http://www.gnu.org/licenses/>.            *
  *                                                                          *
  ****************************************************************************
}
unit iORM.Core.DT.Register;

interface

procedure Register;

implementation

uses
  ToolsAPI,
  DesignIntf,
  System.Classes,
  System.Actions,
  DesignEditors,
  DMForm,           // TDataModuleCustomModule

  iORM.DB.ConnectionDef,
  iORM.DB.DataSet.Master,
{$IFNDEF ioDelphiProfessional}
  iORM.DB.ConnectionDef.MSSQLServer,
{$ENDIF}
  iORM.DB.DataSet.Detail,
  iORM.DB.MemTable,
  iORM.LiveBindings.PrototypeBindSource.Custom,
  iORM.LiveBindings.PrototypeBindSource.Master,
  iORM.LiveBindings.PrototypeBindSource.Detail,
  iORM.MVVM.ModelPresenter.Master,
  iORM.MVVM.ModelPresenter.Detail,
  iORM.MVVM.ModelDataSet,
  iORM.MVVM.ModelBindSource,
  iORM.MVVM.ViewModelBridge,
  iORM.MVVM.ViewContextProvider,
  iORM.MVVM.ViewModel,
  iORM.MVVM.VMAction,
  iORM.SynchroStrategy.EtmBased,
  iORM.Http.WebBroker.Producer,
  iORM.StdActions.CloseQueryRepeater,
  iORM.DT.ViewModel.Wizard,
  iORM.DT.CompAutoUses,
  iORM.DT.Editors.VMAction

  ;




procedure Register;
begin
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

  // Synchronization strategies
  RegisterComponents('iORM - Synchronization strategies', [TioEtmSynchroStrategy_Client]);
  RegisterSelectionEditor(TioEtmSynchroStrategy_Client, TioEtmSynchroStrategySelectionEditor);
  RegisterComponents('iORM - Synchronization strategies', [TioEtmSynchroStrategy_Server]);
  RegisterSelectionEditor(TioEtmSynchroStrategy_Server, TioEtmSynchroStrategySelectionEditor);

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
  RegisterComponentEditor(TioVMAction, TioVMActionEditor);
  RegisterComponents('iORM - MVVM - VMActions - BS', [TioVMActionBSShowOrSelect]);
  RegisterComponents('iORM - MVVM - VMActions - BS', [TioVMActionBSCloseQuery]);
  RegisterComponents('iORM - MVVM - VMActions - BS', [TioVMActionBSSelectCurrent]);
  RegisterSelectionEditor(TioVMActionBSSelectCurrent, TioMVVMSelectionEditor);
  RegisterComponents('iORM - MVVM - VMActions - BS', [TioVMActionBSPersistenceSaveRevertPoint]);
  RegisterComponents('iORM - MVVM - VMActions - BS', [TioVMActionBSPersistenceClear]);
  RegisterComponents('iORM - MVVM - VMActions - BS', [TioVMActionBSPersistencePersist]);
  RegisterComponents('iORM - MVVM - VMActions - BS', [TioVMActionBSPersistenceRevert]);
  RegisterComponents('iORM - MVVM - VMActions - BS', [TioVMActionBSPersistenceRevertOrDelete]);
  RegisterComponents('iORM - MVVM - VMActions - BS', [TioVMActionBSDelete]);
  RegisterComponents('iORM - MVVM - VMActions - BS', [TioVMActionBSPersistenceReload]);
  RegisterComponents('iORM - MVVM - VMActions - BS', [TioVMActionBSAppend]);
  RegisterSelectionEditor(TioVMActionBSAppend, TioMVVMSelectionEditor);
  RegisterComponents('iORM - MVVM - VMActions - BS', [TioVMActionBSInsert]);
  RegisterSelectionEditor(TioVMActionBSInsert, TioMVVMSelectionEditor);
  RegisterComponents('iORM - MVVM - VMActions - BS - ETM', [TioVMActionBS_ETM_RevertToObject]);
  RegisterComponents('iORM - MVVM - VMActions - BS - ETM', [TioVMActionBS_ETM_RevertToBindSource]);
  RegisterComponents('iORM - MVVM - VMActions - BS - Paging', [TioVMActionBSNextPage]);
  RegisterComponents('iORM - MVVM - VMActions - BS - Paging', [TioVMActionBSPrevPage]);
  RegisterComponents('iORM - MVVM - VMActions - BS - WhereBuilder', [TioVMActionBSBuildWhere]);
  RegisterComponents('iORM - MVVM - VMActions - BS - WhereBuilder', [TioVMActionBSClearWhere]);
  RegisterComponents('iORM - MVVM - VMActions - Synchronization', [TioVMDoSynchronization]);

  // StdActions common
  RegisterComponents('iORM - Other', [TioCloseQueryRepeater]);
  RegisterComponents('iORM - Other', [TioWebBrokerProducer]);

  // ioViewModel module
  //  NB: Ho commentato la riga qui sotto che registra la classe TioViewModel usando TDataModuleCustomModule invece di
  //       TCustomModule perchè Carlo Marona riferiva di problemi a inserire componenti non visuali FMX, in questo modo
  //       invece sembra funzionare correttamente. Però questa riga era già presente ma commentata quindi non vorrei che
  //       fosse stata precedentemente sostituita perchè dava qualche problema. Tenere d'occhio e nel caso ripristinare
  //       la riga commentata. (Carlo Marona 09/07/2025)
//  RegisterCustomModule(TioViewModel, TCustomModule);
  RegisterCustomModule(TioViewModel, TDataModuleCustomModule); // TDataModuleCustomModule is declared in "DMForm" unit
  RegisterNoIcon([TioViewModel]); // Non fa apparire l'icona nella component palette (Carlo Marona 09/07/2025)

  // IDE Wizards
  RegisterPackageWizard(TioViewModelWizard.Create);
end;

end.
