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
unit iORM.LiveBindings.CommonBSBehavior;

interface

uses
  iORM.LiveBindings.Interfaces, iORM.LiveBindings.Notification,
  iORM.CommonTypes, System.Classes, iORM.Where.Interfaces,
  iORM.LiveBindings.BSPersistence, iORM.Context.Properties.Interfaces,
  System.Rtti, iORM.Where.SmartBuilder;

type
  // Event hendlers
  TioBeforeWhereBuilderEvent = procedure(const ASenderBS, AFilterObj: TObject; const AWhere: IioWhere) of object;
  TioOnWhereBuilderEvent = procedure(const ASenderBS, AFilterObj: TObject; const AWhere: IioWhere; const AProp: IioProperty; const AValue: TValue; var ADone: Boolean) of object;
  TioAfterWhereBuilderEvent = procedure(const ASenderBS, AFilterObj: TObject; const AWhere: IioWhere) of object;

  // Methods and functionalities common to all BindSouces (ioDataSet also)
  TioCommonBSBehavior = class
  public
    // Common code for ABSA to manage notifications
    class procedure Notify(const ASender: TObject; const ATargetBS: IioBindSource; const [Ref] ANotification: TioBSNotification);
    // Common code for selection
    class procedure Select<T>(const ASender: TObject; const ATargetBS: IioBindSource; ASelected: T;
      ASelectionType: TioSelectionType = TioSelectionType.stAppend);
    // Common code for some checks by the bind sources
    class procedure CheckForOpen(const ABindSource: IioBindSource; const ALoadType: TioLoadType);
    class procedure CheckForSetSourceBS(const ABindSource, ASourceBS: IioBindSource; const ALoadType: TioLoadType);
    class procedure CheckForSetLoadType(const ABindSource, ASourceBS: IioBindSource; const ALoadType: TioLoadType);
    class function CheckIfLoadTypeIsFromBS(const ALoadType: TioLoadType): Boolean;
    // Common code for AsDefaulr property (for master BindSources)
    class procedure SetAsDefaultPropertyOfAllBindSourcesToFalse(const AOwner: TComponent; const AValue: Boolean);
    class procedure InitAsDefaultOnCreate(const ABindSource: TComponent; var AAsDefaultValue: Boolean);

    class function IsValidForDependencyInjectionLocator(const ABindSource: IioBindSource; const ACheckCurrentObj, ARaiseExceptions: Boolean): Boolean;
    // Common code for WhereBuilder purposes
    class function BuildWhere(const ASourceBS, ATargetBS: IioMasterBindSource; const AExecuteOnTarget: Boolean; const ABeforeWhereBuildEvent: TioBeforeWhereBuilderEvent; const AOnWhereBuildEvent: TioOnWhereBuilderEvent; const AAfterWhereBuildEvent: TioAfterWhereBuilderEvent): IioWhere;
    class function ClearWhere(const ASourceBS, ATargetBS: IioMasterBindSource; const AExecuteOnTarget: Boolean; const ABeforeWhereClearEvent: TioBeforeWhereBuilderEvent; const AOnWhereClearEvent: TioOnWhereBuilderEvent; const AAfterWhereClearEvent: TioAfterWhereBuilderEvent): IioWhere;
    // Common code for ETMfor
    class procedure SetETMfor(const ABindSource: IioBindSource; const AETMfor: IioMasterBindSource; const AComponentState: TComponentState);
  end;

implementation

uses
  Data.Bind.ObjectScope, System.SysUtils, iORM.Exceptions, iORM.Utilities,
  iORM, iORM.Where.Factory;

{ TioCommonBSBehavior }

class procedure TioCommonBSBehavior.CheckForOpen(const ABindSource: IioBindSource; const ALoadType: TioLoadType);
begin
  // ltManual
  if ABindSource.IsMasterBS and (ALoadType = ltManual) and not ABindSource.CheckActiveAdapter then
    raise EioGenericException.Create(ClassName, 'CheckForOpen',
      Format('You are not allowed to activate the BindSource "%s" if its "LoadType" property is set to "ltManual" unless the "SetDataObject" method has been executed at least once with a valid object.',
      [ABindSource.GetName]));
end;

class procedure TioCommonBSBehavior.CheckForSetLoadType(const ABindSource, ASourceBS: IioBindSource; const ALoadType: TioLoadType);
begin
  if Assigned(ASourceBS) and not CheckIfLoadTypeIsFromBS(ALoadType) then
    raise EioGenericException.Create(ClassName, 'CheckForSetLoadType',
      Format('In order to set the "LoadType" property to a value other than "ltFromBSAsIs" or "ltFromBSReload" or "ltFromBSReloadNewInstance", you must first set the "SourceXXX" property to blank (nil).'
      + #13#13'Please set the "SourceXXX" property of the bind source "%s" (maybe a DataSet or BindSource) to blank and then try again.',
      [ABindSource.GetName]));
end;

class procedure TioCommonBSBehavior.CheckForSetSourceBS(const ABindSource, ASourceBS: IioBindSource; const ALoadType: TioLoadType);
begin
  if Assigned(ASourceBS) and not CheckIfLoadTypeIsFromBS(ALoadType) then
    raise EioGenericException.Create(ClassName, 'CheckForSetSourceBS',
      Format('In order to set the "SourceXXX" property, you must first set the "LoadType" property to one of the values "ltFromBSAsIs" or "ltFromBSReload" or "ltFromBSReloadNewInstance".'
      + #13#13'Please set the "LoadType" property of the bind source "%s" (maybe a DataSet or BindSource) to one of the above values and then try again.',
      [ABindSource.GetName]));
end;

class function TioCommonBSBehavior.CheckIfLoadTypeIsFromBS(const ALoadType: TioLoadType): Boolean;
begin
  Result := ALoadType in [ltFromBSAsIs, ltFromBSReload, ltFromBSReloadNewInstance];
end;

class procedure TioCommonBSBehavior.InitAsDefaultOnCreate(const ABindSource: TComponent; var AAsDefaultValue: Boolean);
var
  I: Integer;
  LCurrentComponent: TObject;
  LCurrentBindSource: IioBindSource;
begin
  // At DesignTime initialize the "AsDefault" property at True if it is the
  // first ModelPresenter inserted (no other presenters presents).
  // NB: At Runtime set False as initial value (load real value from dfm file)
  // NB: Is detail bind source initialize to false
  if (csDesigning in ABindSource.ComponentState) and not(csLoading in ABindSource.ComponentState) then
  begin
    AAsDefaultValue := True;
    for I := 0 to ABindSource.Owner.ComponentCount - 1 do
    begin
      LCurrentComponent := ABindSource.Owner.Components[I];
      // Ovviamente salta se stesso
      if (LCurrentComponent <> ABindSource) and Supports(LCurrentComponent, IioBindSource, LCurrentBindSource) and LCurrentBindSource.AsDefault then
      begin
        AAsDefaultValue := False;
        Exit;
      end;
    end;
  end
  else
    AAsDefaultValue := False;
end;

class function TioCommonBSBehavior.IsValidForDependencyInjectionLocator(const ABindSource: IioBindSource;
  const ACheckCurrentObj, ARaiseExceptions: Boolean): Boolean;
begin
  // Init
  Result := True;
  // Check the ModelPresenter
  Result := Result and Assigned(ABindSource);
  if ARaiseExceptions and not Result then
    raise EioGenericException.Create(Self.ClassName, 'IsValidForDependencyInjectionLocator', 'Parameter "AModelPresenter" not assigned.');
  // Check the bind source adapter
  Result := Result and ABindSource.CheckAdapter;
  if ARaiseExceptions and not Result then
    raise EioGenericException.Create(Self.ClassName, 'IsValidForDependencyInjectionLocator',
      'ActiveBindSourceAdapter not assigned in the "AModelPresenter" parameter.');
  // Check the ModelPresenter.Current object
  if not ACheckCurrentObj then
    Exit;
  Result := Result and (ABindSource.Current <> nil);
  if ARaiseExceptions and not Result then
    raise EioGenericException.Create(Self.ClassName, 'IsValidForDependencyInjectionLocator', '"Current" object of the ModelPresenter not assigned.');
end;

class procedure TioCommonBSBehavior.Notify(const ASender: TObject; const ATargetBS: IioBindSource; const [Ref] ANotification: TioBSNotification);
var
  LBSPersistenceClient: IioMasterBindSource;
  LNotificationPointer: PioBSNotification;
begin
  case ANotification.NotificationType of
    // Execute the AutoRefresh if enabled by the specific property
    ntRefresh:
      if ATargetBS.AutoRefreshOnNotification and (ATargetBS.State <> TBindSourceAdapterState.seInactive) then
        ATargetBS.Refresh(False);
    // Actually used for paging purposes (ObjState moved on "OnBeforeScroll" directly in the BindSource/DataSet/ModelPresenter master)
    ntScroll:
      ATargetBS.Paging.NotifyItemIndexChanged(ATargetBS.GetActiveBindSourceAdapter.ItemIndex);
    // Actually used for BSPersistence purposes
    ntSaveRevertPoint:
      if Supports(ATargetBS, IioMasterBindSource, LBSPersistenceClient) then
        LBSPersistenceClient.Persistence.NotifySaveRevertPoint;
    // Set the response to True if the MasterBS has saved revert point or AutoSaveRevertPoint is possible
    ntCanReceiveSelection:
      if Supports(ATargetBS, IioMasterBindSource, LBSPersistenceClient) then
      begin
        LNotificationPointer := @ANotification;
        LNotificationPointer^.Response := LBSPersistenceClient.Persistence.CanReceiveSelection;
      end;
    // Set the response to True if the MasterBS has saved revert point or AutoSaveRevertPoint is possible
    ntCanInsertDetail:
      if Supports(ATargetBS, IioMasterBindSource, LBSPersistenceClient) then
      begin
        LNotificationPointer := @ANotification;
        LNotificationPointer^.Response := LBSPersistenceClient.Persistence.CanInsertDetail;
      end;
    // Set the response to True if the MasterBS has saved revert point or AutoSaveRevertPoint is possible
    ntCanDeleteDetail:
      if Supports(ATargetBS, IioMasterBindSource, LBSPersistenceClient) then
      begin
        LNotificationPointer := @ANotification;
        LNotificationPointer^.Response := LBSPersistenceClient.Persistence.CanDeleteDetail;
      end;
    // Actually used for BSPersistence purposes:
    // if enabled save a reference to the deleted object to perform a delete query when persist the MasterBS.
    // It return true (Response field of the notification) if the smart delete system is enabled and the
    // operation is succesfull
    ntDeleteSmart:
      if Supports(ATargetBS, IioMasterBindSource, LBSPersistenceClient) then
      begin
        LNotificationPointer := @ANotification;
        LNotificationPointer^.Response := (LBSPersistenceClient.OnDeleteAction = daSetSmartDeleteSystem);
        if ANotification.Response then
          LBSPersistenceClient.Persistence.SmartDeleteSystem.Add(ANotification.PayloadAsString, ANotification.PayloadAsInteger);
      end;
    // Actually used for ActiveBindSourceAdapters delete purposes:
    // It return true (Response field of the notification) if the ObjStatus delete mode system is enabled on the MasterBS
    ntObjStatusSetDeleted:
      if Supports(ATargetBS, IioMasterBindSource, LBSPersistenceClient) then
      begin
        LNotificationPointer := @ANotification;
        LNotificationPointer^.Response := (LBSPersistenceClient.OnDeleteAction >= daSetObjStatusIfExists);
      end;
    // Actually used for ActiveBindSourceAdapters insert/update purposes:
    // It return true (Response field of the notification) if the ObjStatus (dirty) mode system is enabled on the MasterBS
    ntObjStatusSetDirty:
      if Supports(ATargetBS, IioMasterBindSource, LBSPersistenceClient) then
      begin
        LNotificationPointer := @ANotification;
        LNotificationPointer^.Response := (LBSPersistenceClient.OnUpdateAction >= uaSetObjStatusIfExists);
      end;
    // Actually used for BSPersistence purposes:
    // if enabled save a reference to the current object to register it in the SmartUpdateDetection system
    ntSUD_RegisterObjOnEdit:
      if Supports(ATargetBS, IioMasterBindSource, LBSPersistenceClient) and LBSPersistenceClient.Persistence.IsSmartUpdateDetectionEnabled then
        LBSPersistenceClient.Persistence.SmartUpdateDetection.NotifyEdit(ANotification.PayloadAsObject, ANotification.PayloadAsString);
    ntSUD_RegisterObjOnPost:
      if Supports(ATargetBS, IioMasterBindSource, LBSPersistenceClient) and LBSPersistenceClient.Persistence.IsSmartUpdateDetectionEnabled then
        LBSPersistenceClient.Persistence.SmartUpdateDetection.NotifyPost(ANotification.PayloadAsObject, ANotification.PayloadAsString);
  end;
end;

class procedure TioCommonBSBehavior.Select<T>(const ASender: TObject; const ATargetBS: IioBindSource; ASelected: T;
  ASelectionType: TioSelectionType = TioSelectionType.stAppend);
var
  LDestBSA: IioActiveBindSourceAdapter;
  LValue: TValue;
begin
  // Some checks
  if not Assigned(ATargetBS) then
    raise EioGenericException.Create(ClassName, 'Select<T>',
      Format('You have tried to make a selection by invoking the "SelectCurrent" method of the "%s" component but its "SelectorFor" property was left blank.' +
      #13#13'iORM does not know which target component to forward the selection to.'#13#13'Please set the property and try again.',
      [(ASender as TComponent).Name]));
  if not ATargetBS.IsActive then
    raise EioGenericException.Create(ClassName, 'Select<T>',
      Format('You have tried to make a selection by invoking the "SelectCurrent" method of component "%s" but the target component of the selection ("%s") is not active.'
      + #13#13'iORM cannot forward the selection.'#13#13'Please make sure that the target component of the selection is active as well and try again.',
      [(ASender as TComponent).Name, ATargetBS.GetName]));
  // Get the selection destination BindSourceAdapter
  LDestBSA := ATargetBS.GetActiveBindSourceAdapter;
  // If the selection is allowed then send a ntSaveRevertPoint notification
  if LDestBSA.Notify(ASender, TioBSNotification.Create(TioBSNotificationType.ntCanReceiveSelection)) then
    LDestBSA.Notify(ASender, TioBSNotification.Create(TioBSNotificationType.ntSaveRevertPoint))
  else
    raise EioGenericException.Create(ClassName, 'Select<T>', 'Master BindSource hasn''t saved a revert point');
  // Encapsulate the SelectedInstance into a TValue then assign it
  // as selection in a proper way
  // NB: Lasciare assolutamente cos� perch� ho gi� provato in vari modi ma mi dava sempre un errore
  // facendo cos' invece (cio� passando per un TValue) funziona correttamente.
  LValue := TValue.From<T>(ASelected);
  if LValue.Kind = TTypeKind.tkInterface then
    LDestBSA.ReceiveSelection(LValue.AsInterface, ASelectionType)
  else if LValue.Kind = TTypeKind.tkClass then
    LDestBSA.ReceiveSelection(LValue.AsObject, ASelectionType)
  else
    raise EioGenericException.Create(ClassName, 'Select<T>', 'Wrong LValue kind.');
end;

class procedure TioCommonBSBehavior.SetAsDefaultPropertyOfAllBindSourcesToFalse(const AOwner: TComponent; const AValue: Boolean);
var
  I: Integer;
  LBindSource: IioBindSource;
begin
  // Uncheck AsDefault property for all bin sources
  if AValue then
    for I := 0 to AOwner.ComponentCount - 1 do
      if Supports(AOwner.Components[I], IioBindSource, LBindSource) then
        LBindSource.SetAsDefault(False);
end;

class procedure TioCommonBSBehavior.SetETMfor(const ABindSource: IioBindSource; const AETMfor: IioMasterBindSource; const AComponentState: TComponentState);
var
  LMasterBindSource: IioMasterBindSource;
begin
  // Estract the bind source as IioMasterBindSource
  if not Supports(ABindSource, IioMasterBindSource, LMasterBindSource) then
    raise EioGenericException.Create(ClassName, 'SetETMfor',
      Format('The "%s" bind source received by the "ABindSource" parameter does not implement the "IioMasterBindSource".', [ABindSource.GetName]));
  // Controlla che non sia gi� assegnato (lo stesso)
  if AETMFor = LMasterBindSource.ETMfor then
    Exit;
  // ETMfor must be different from itself
  if Assigned(AETMfor) and (AETMfor as TObject).Equals(LMasterBindSource as TObject) then
    raise EioGenericException.Create(Self.ClassName, 'SetETMfor', Format('The "ETMfor" property of the "%s" bind source must be different from itself.', [LMasterBindSource.GetName]));
  // Se � aperto e stiamo cambiando l'ETMfor (gi� verificato all'inizio) allora si chiude (se � il caso si riaprir� alla fine del metodo)
  if LMasterBindSource.IsActive then
    raise EioGenericException.Create(ClassName, 'SetETMfor',
      Format('Hi, I''m iORM, I have to explain something to you.' +
      #13#13'When a BindSource (%s) has its "ETMfor" property pointing to another BindSource then it acts as a "time machine" (ETM repository) for the latter''s current entity, in which case its activation will be done automatically.' +
      #13#13'For this reason, setting the "ETMfor" property of a BindSource while it is active IS NOT PERMITTED.' +
      #13#13'If you really need to do that then you need to close the BindSource first and then set its property "ETMfor" (which will cause the BindSource to open immediately).' +
      #13#13'Did you understand?', [LMasterBindSource.GetName]));
  // If the private where field is assigned then set even to it
  if Assigned(LMasterBindSource.Where) then
    LMasterBindSource.Where.SetETMfor(AETMfor);
  // If the adapter is present then set even to it
  if LMasterBindSource.CheckAdapter and Assigned(LMasterBindSource.GetActiveBindSourceAdapter) then
    LMasterBindSource.GetActiveBindSourceAdapter.ioWhere.SetETMfor(AETMfor);
  // Register itself into the DetailBindSourceContainer of the AETMfor bind source
  if Assigned(AETMfor) then
    AETMfor.RegisterDetailBindSource(ABindSource);
  // If the new AETMfor is nil and the previous FETMFor was assigned then unregister the old one
  // NB: All'inizio abbiamo gi� verificatoche sono diversi
  if Assigned(LMasterBindSource.ETMFor) then
    LMasterBindSource.ETMfor.UnregisterDetailBindSource(ABindSource);
  // Set the private field
  LMasterBindSource._InternalSetETMforPrivateField(AETMfor as IioBindSource);
  // Se il BS ETMfor � gi� attivo allora attiva automaticamente anche per se stesso
  if not((csDesigning in AComponentState) or (csLoading in AComponentState)) and Assigned(AETMfor) and AETMfor.IsActive then
    LMasterBindSource.Open;
end;

class function TioCommonBSBehavior.BuildWhere(const ASourceBS, ATargetBS: IioMasterBindSource; const AExecuteOnTarget: Boolean; const ABeforeWhereBuildEvent: TioBeforeWhereBuilderEvent; const AOnWhereBuildEvent: TioOnWhereBuilderEvent; const AAfterWhereBuildEvent: TioAfterWhereBuilderEvent): IioWhere;
var
  LOnWhereBuildEventAnonymousMethod: TioOnWhereBuildEventAnonymousMethod;
  LWhere: IioWhere;
begin
  // Some checks
  if not Assigned(ATargetBS) then
    raise EioGenericException.Create(ClassName, 'BuildWhere', Format('"BuildWhere" method is not invokable if the "WhereBuilderFor" property is unassigned (%s))',
      [ASourceBS.GetName]));
  if not ASourceBS.IsActive then
    raise EioGenericException.Create(ClassName, 'BuildWhere', Format('"BuildWhere" method is not invokable on closed BindSources (%s)', [ASourceBS.GetName]));
  if not Assigned(ASourceBS.Current) then
    raise EioGenericException.Create(ClassName, 'BuildWhereuild',
      Format('"BuildWhere" method is not invokable if the current object of the source BindSource "%s" is nil)', [ASourceBS.GetName]));
  // Post pending changes
  ASourceBS.PostIfEditing;
  // Create e new where instance
  LWhere := TioWhereFactory.NewWhere;
  // Define the LOnWhereBuildEventAnonymousMethod for OnWhereBuildEvent event handling
  if Assigned(AOnWhereBuildEvent) then
    LOnWhereBuildEventAnonymousMethod := procedure(const AFilterObj: TObject; const AWhere: IioWhere; const AProp: IioProperty; const AValue: TValue; var ADone: Boolean)
      begin
        AOnWhereBuildEvent(ASourceBS as TObject, ASourceBS.Current, LWhere, AProp, AValue, ADone);
      end
  else
    LOnWhereBuildEventAnonymousMethod := nil;
  // Before build event
  if Assigned(ABeforeWhereBuildEvent) then
    ABeforeWhereBuildEvent(ASourceBS as TObject, ASourceBS.Current, LWhere);
  // Execute the BuildWhere passing the LOnWhereBuildEventAnonymousMethod
  TioWhereFactory.NewWhereSmartBuilder.BuildWhere(LWhere, ASourceBS.Current, LOnWhereBuildEventAnonymousMethod);
  // After build event
  if Assigned(AAfterWhereBuildEvent) then
    AAfterWhereBuildEvent(ASourceBS as TObject, ASourceBS.Current, LWhere);
  // Set the result where
  ATargetBS.SetWhere(LWhere);
  Result := LWhere;
  // If enabled execute a reload on the target BS
  if AExecuteOnTarget then
    ATargetBS.Persistence.Reload;
end;

class function TioCommonBSBehavior.ClearWhere(const ASourceBS, ATargetBS: IioMasterBindSource; const AExecuteOnTarget: Boolean; const ABeforeWhereClearEvent: TioBeforeWhereBuilderEvent; const AOnWhereClearEvent: TioOnWhereBuilderEvent; const AAfterWhereClearEvent: TioAfterWhereBuilderEvent): IioWhere;
begin
  // Reset the filter object (sourceBS)
  ASourceBS.Persistence.Reload;
  Result := BuildWhere(ASourceBS, ATargetBS, AExecuteOnTarget, ABeforeWhereClearEvent, AOnWhereClearEvent, AAfterWhereClearEvent);
end;

end.
