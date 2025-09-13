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
  System.Rtti, iORM.Where.SmartBuilder, iORM.DuckTyped.Factory;

const
  // S.O.Lo (Smart Object LOokup system) relted constants
  SOLO_CLASS_SEPARATOR = ':';
  SOLO_BINDSOURCE_SEPARATOR = '<';

type
  // Event hendlers
  TioBeforeWhereBuilderEvent = procedure(const ASenderBS, AFilterObj: TObject; const AWhere: IioWhere) of object;
  TioOnWhereBuilderEvent = procedure(const ASenderBS, AFilterObj: TObject; const AWhere: IioWhere; const AProp: IioProperty; const AValue: TValue; var ADone: Boolean) of object;
  TioAfterWhereBuilderEvent = procedure(const ASenderBS, AFilterObj: TObject; const AWhere: IioWhere) of object;

  // Enumerated type indicating if it's an insert or append type operation
  TioCommonBSBehaviorInsertOrAppend = (iaInsert, iaAppend);

  // Methods and functionalities common to all BindSouces (ioDataSet also)
  TioCommonBSBehavior = class
  private
    // Common code  for S.O.Lo (Smart Object LOokup system)
    class function DetailObjLookup_SplitFieldNameAndLookupInfo(const AFullPathFieldName: String; const ASeparator: Char; var OutFieldName, OutLookupInfo: String): Boolean;
    class function DetailObjLookup_SetDetailObject(const ABindSource: IioBindSource; ADetailObj: TObject; const APropertyName, ADetailTypeName: String): TValue;
  public
    // Common code tor return the first MasterBindSource with Persistence prop (the real master for CRUD operations)
    class function GetFirstMasterPersistenceBindSource(const AStartBindSource: IioBindSource): IioBindSource; static;
    // Common code for ABSA to manage notifications
    class procedure Notify(const ASender: TObject; const ATargetBS: IioBindSource; const [Ref] ANotification: TioBSNotification);
    // Common code for selection
    class procedure Select<T>(const ASender: TObject; const ATargetBS: IioBindSource; ASelected: T;
      ASelectionType: TioSelectionType = TioSelectionType.stAppend);
    // Common code for some checks by the bind sources
    class procedure CheckForOpen(const ABindSource, ASourceBS: IioBindSource; const ALoadType: TioLoadType);
    class procedure CheckForSetSourceBS(const ABindSource, ASourceBS: IioBindSource; const ALoadType: TioLoadType);
    class procedure CheckForSetLoadType(const ABindSource, ASourceBS: IioBindSource; const ALoadType: TioLoadType);
    class function CheckIfLoadTypeIsFromBS(const ALoadType: TioLoadType): Boolean;
    // Common code for AsDefault property (for master BindSources)
    class procedure SetAsDefaultPropertyOfAllBindSourcesToFalse(const AOwner: TComponent; const AValue: Boolean);
    class procedure InitAsDefaultOnCreate(const ABindSource: TComponent; var AAsDefaultValue: Boolean);
    class function IsValidForDependencyInjectionLocator(const ABindSource: IioBindSource; const ACheckCurrentObj, ARaiseExceptions: Boolean): Boolean;
    // Common code for WhereBuilder purposes
    class function BuildWhere(const ASourceBS, ATargetBS: IioMasterBindSource; const AExecuteOnTarget: Boolean; const ABeforeWhereBuildEvent: TioBeforeWhereBuilderEvent; const AOnWhereBuildEvent: TioOnWhereBuilderEvent; const AAfterWhereBuildEvent: TioAfterWhereBuilderEvent): IioWhere;
    class function ClearWhere(const ASourceBS, ATargetBS: IioMasterBindSource; const AExecuteOnTarget: Boolean; const ABeforeWhereClearEvent: TioBeforeWhereBuilderEvent; const AOnWhereClearEvent: TioOnWhereBuilderEvent; const AAfterWhereClearEvent: TioAfterWhereBuilderEvent): IioWhere;
    // Common code for ETMfor
    class procedure SetETMfor(const ABindSource: IioBindSource; const AETMfor: IioMasterBindSource; const AComponentState: TComponentState);
    // Common code for BindSources to requires an authorization-decision for an insert/append operation receving already created instance
    class procedure ProvideAuthDecisionForInsertOrAppend(const ABindSource: IioBindSource; AObj: TObject; const AFreeObjIfNotAuthorized: Boolean);
    // Common code for BindSources to Insert/Append an object
    class procedure InsertOrAppend(const ABindSource: IioBindSource; const InsertOrAppend: TioCommonBSBehaviorInsertOrAppend; const AFreeObjIfNotAuthorized: Boolean);
    class procedure InsertOrAppendObj(const ABindSource: IioBindSource; AObj: TObject; const InsertOrAppend: TioCommonBSBehaviorInsertOrAppend; const AFreeObjIfNotAuthorized: Boolean);
    class procedure InsertOrAppendIntf(const ABindSource: IioBindSource; AIntf: Iinterface; const InsertOrAppend: TioCommonBSBehaviorInsertOrAppend; const AFreeObjIfNotAuthorized: Boolean);
    // Common code  for S.O.Lo (Smart Object LOokup system)
    class procedure DetailObjLookup_ClearLookupInfoFromFieldName(var [ref] AFullPathFieldName: String);
    class function DetailObjLookup_DetailObjID(const AFullPathFieldName: String; const [ref] AValue: TValue): TValue;
    class function DetailObjLookup_ByLookupBindSource(const ABindSource: IioBindSource; const AFullPathFieldName: String; const [ref] AValue: TValue): TValue;
    class function DetailObjLookup_ByTypeName(const ABindSource: IioBindSource; const AFullPathFieldName: String; const [ref] AValue: TValue): TValue;
  end;

implementation

uses
  Data.Bind.ObjectScope, System.SysUtils, iORM.Exceptions,
  iORM, iORM.Where.Factory, iORM.Abstraction, iORM.Auth.Factory,
  iORM.Utilities, iORM.DuckTyped.Interfaces;

{ TioCommonBSBehavior }

class procedure TioCommonBSBehavior.CheckForOpen(const ABindSource, ASourceBS: IioBindSource; const ALoadType: TioLoadType);
begin
  // ltManual
  if ABindSource.IsMasterBS and (ALoadType = ltManual) and not ABindSource.CheckActiveAdapter then
    raise EioGenericException.Create(ClassName, 'CheckForOpen',
      Format('You are not allowed to activate the BindSource "%s" if its "LoadType" property is set to "ltManual" unless the "SetDataObject" method has been executed at least once with a valid object.',
      [ABindSource.GetName]));
  // ltFromBSxxx
  if ABindSource.IsMasterBS and CheckIfLoadTypeIsFromBS(ALoadType) and not Assigned(ASourceBS) then
    raise EioGenericException.Create(ClassName, 'CheckForOpen',
      Format('Hi, I''m iORM and we have a problem.'#13#13'I cannot open a BindSource (maybe a DataSet or BindSource) having the "LoadType" property equal to "ltFromBSAsIs" or "ltFromBSReload" or "ltFromBSReloadNewInstance" unless the "SourceBS" property is also set.'
      + #13#13'Please set the property "SourceBS" of the BindSource (maybe a DataSet or BindSource) called "%s" and try again.',
      [ABindSource.GetName]));
end;

class procedure TioCommonBSBehavior.CheckForSetLoadType(const ABindSource, ASourceBS: IioBindSource; const ALoadType: TioLoadType);
begin
  // Mauri 23/06/2024: se sto impostando il LoadType a ltManual non controllo e non sollevo l'eccezione (anche se la proprietà "SourceBS" è assegnata)
  //  questo perchè non dovrebbe essere influente e inoltre mi risolve alcuni problemini
  if Assigned(ASourceBS) and not CheckIfLoadTypeIsFromBS(ALoadType) and (ALoadType <> ltManual) then
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
  // Mauri 19/08/2025: adesso solo i MasterBS hanno la proprietà AsDefault  perchè non aveva senso che
  //  l'avessero anche i DetailBS visto che solo i Master hanno il SetDataObject quindi non possono
  //  essere il BS di default di una vista, quindi se sono DetailBS li imposto direttamente a False.
  if Supports(ABindSource, IioBindSource, LCurrentBindSource) and LCurrentBindSource.IsDetailBS then
  begin
    AAsDefaultValue := False;
    Exit;
  end;
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

class procedure TioCommonBSBehavior.InsertOrAppend(const ABindSource: IioBindSource; const InsertOrAppend: TioCommonBSBehaviorInsertOrAppend;
  const AFreeObjIfNotAuthorized: Boolean);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  // Requires an authorization-decision for UI purposes
  // NB: Codice inserito qui per intercettare l'insert/append richiesto con i metodi Append/Insert che ricevono l'istanza da aggiungere già creata
  TioApplication.AuthorizeByRequestParams(ABindSource.GetTypeName, atInsert, itRegular, ABindSource._InternalGetAuthorizationContext, False, False);
  // Check the BindSourceAdapter
  if ABindSource.CheckAdapter and Supports(ABindSource.GetActiveBindSourceAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
  begin
    case InsertOrAppend of
      iaInsert:
        LActiveBSA.Insert;
      iaAppend:
        LActiveBSA.Append;
    else
      raise EioGenericException.Create(ClassName, 'InsertOrAppend', '"InsertOrAppend" param value not as expected');
    end;
  end;
end;

class procedure TioCommonBSBehavior.InsertOrAppendIntf(const ABindSource: IioBindSource; AIntf: Iinterface;
  const InsertOrAppend: TioCommonBSBehaviorInsertOrAppend; const AFreeObjIfNotAuthorized: Boolean);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  // Requires an authorization-decision for UI purposes
  // NB: Codice inserito qui per intercettare l'insert/append richiesto con i metodi Append/Insert che ricevono l'istanza da aggiungere già creata
  ProvideAuthDecisionForInsertOrAppend(ABindSource, AIntf As TObject, False);
  // Check the BindSourceAdapter
  if ABindSource.CheckAdapter and Supports(ABindSource.GetActiveBindSourceAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
  begin
    case InsertOrAppend of
      iaInsert:
        LActiveBSA.Insert(AIntf);
      iaAppend:
        LActiveBSA.Append(AIntf);
    else
      raise EioGenericException.Create(ClassName, 'InsertOrAppendIntf', '"InsertOrAppend" param value not as expected');
    end;
    // NB: HO commentato la riga sotto perchè Marco Mottadelli mi ha segnalato che causava
    // il fatto che lo stato del componente passava subito a "Browse" perchè veniva
    // invocato un Post in seguito al Refresh stesso.
    // AnActiveBSA.Refresh(False);
  end
  else
    raise EioGenericException.Create(ClassName, 'InsertOrAppendIntf', Format('Internal adapter is not an ActiveBindSourceAdapter (%s)', [ABindSource.GetName]));
end;

class procedure TioCommonBSBehavior.InsertOrAppendObj(const ABindSource: IioBindSource; AObj: TObject; const InsertOrAppend: TioCommonBSBehaviorInsertOrAppend;
  const AFreeObjIfNotAuthorized: Boolean);
var
  LActiveBSA: IioActiveBindSourceAdapter;
begin
  // Requires an authorization-decision for UI purposes
  // NB: Codice inserito qui per intercettare l'insert/append richiesto con i metodi Append/Insert che ricevono l'istanza da aggiungere già creata
  ProvideAuthDecisionForInsertOrAppend(ABindSource, AObj, True);
  // Check the BindSourceAdapter
  if ABindSource.CheckAdapter and Supports(ABindSource.GetActiveBindSourceAdapter, IioActiveBindSourceAdapter, LActiveBSA) then
  begin
    case InsertOrAppend of
      iaInsert:
        LActiveBSA.Insert(AObj);
      iaAppend:
        LActiveBSA.Append(AObj);
    else
      raise EioGenericException.Create(ClassName, 'InsertOrAppendObj', '"InsertOrAppend" param value not as expected');
    end;
    // NB: HO commentato la riga sotto perchè Marco Mottadelli mi ha segnalato che causava
    // il fatto che lo stato del componente passava subito a "Browse" perchè veniva
    // invocato un Post in seguito al Refresh stesso.
    // LActiveBSA.Refresh(False);
  end
  else
    raise EioGenericException.Create(ClassName, 'InsertOrAppendObj', Format('Internal adapter is not an ActiveBindSourceAdapter (%s)', [ABindSource.GetName]));
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

class procedure TioCommonBSBehavior.ProvideAuthDecisionForInsertOrAppend(const ABindSource: IioBindSource; AObj: TObject; const AFreeObjIfNotAuthorized: Boolean);
begin
  if not Assigned(AObj) then
    raise EioGenericException.Create(ClassName, 'ProvideAuthDecisionForInsertOrAppendObj', 'The parameter does not contain a valid object instance');
  try
    TioApplication.AuthorizeByRequestParams(AObj.ClassName, atInsert, itRegular, ABindSource._InternalGetAuthorizationContext, False, False);
  except
    if AFreeObjIfNotAuthorized then
      FreeAndNil(AObj);
    raise;
  end;
end;

class procedure TioCommonBSBehavior.Select<T>(const ASender: TObject; const ATargetBS: IioBindSource; ASelected: T; ASelectionType: TioSelectionType = TioSelectionType.stAppend);
var
  LAuthDecisionRequest: IioAuthDecisionRequest;
  LDestBSA: IioActiveBindSourceAdapter;
  LSelectedAsIInterface: IInterface;
  LSelectedAsTObject: TObject;
  LValue: TValue;
begin
  // Check if TargetBS is assigned
  if not Assigned(ATargetBS) then
    raise EioGenericException.Create(ClassName, 'Select<T>',
      Format('You have tried to make a selection by invoking the "SelectCurrent" method of the "%s" component but its "SelectorFor" property was left blank.' +
      #13#13'iORM does not know which target component to forward the selection to.'#13#13'Please set the property and try again.',
      [(ASender as TComponent).Name]));
  // C'era un problema se il target è un BS che espone un singolo oggetto e in
  // precedenza era stato impostato il suo dataObject a nil perchè in questo caso negli
  // ObjectBSA il ABSA si disattiva (Active = False) e quindi poi quando faceva
  // il SetDataObject sul TargetBSA dava un errore perchè non era attivo.
  if not ATargetBS.IsActive then
    ATargetBS.Open;
  // Check if TargetBS is still inactive
  if not ATargetBS.IsActive then
    raise EioGenericException.Create(ClassName, 'Select<T>',
      Format('You have tried to make a selection by invoking the "SelectCurrent" method of component "%s" but the target component of the selection ("%s") is not active.'
      + #13#13'iORM cannot forward the selection.'#13#13'Please make sure that the target component of the selection is active as well and try again.',
      [(ASender as TComponent).Name, ATargetBS.GetName]));

  // Parte che si occupa della richiesta dell'autorizzazione ad eseguire la selezione oppure no.
  //  Prima crea l'oggetto AuthorizationRequest, lo imposta con il TypeName dell'oggetto ricevuto come selezione
  //  e lo passa all'evento "BeforeReceiveSelection" dove, tra le altre cose, è possibile cambiare i valori delle
  //  proprietà della AuthorizationRequest se necesario, alla fine esegue la richiesta di autorizzazione.
  //  NB: Ho fatto così perchè ragionando molto sono giunto alla conclusione che non era possibile impostare
  //       la AuthorizationRequest in modo che andasse bene in qualunque situazione, dipende sempre da cosa
  //       vuole fare il programmatore e come quindi ho deciso di fare in modo che scrivendo un event handler
  //       (BeforeReceiveSelection...) sia possibile intervenire e impostare la richiesta di autorizzazione
  //       come si vuole
  LSelectedAsTObject := TioUtilities.GenericToTObject<T>(ASelected);
  LAuthDecisionRequest := TioAuthFactory.NewAuthDecisionRequest(LSelectedAsTObject.ClassName, atMakeSelection, itRegular, ATargetBS._InternalGetAuthorizationContext, False);
  if TioUtilities.IsAnInterface<T> then
  begin
    LSelectedAsIInterface := TioUtilities.CastObjectToGeneric<IInterface>(LSelectedAsTObject);
    ATargetBS.DoBeforeReceiveSelection(LSelectedAsIInterface, ASelectionType, LAuthDecisionRequest);
  end
  else
    ATargetBS.DoBeforeReceiveSelection(LSelectedAsTObject, ASelectionType, LAuthDecisionRequest);
  // Esegue la richiesta di autorizzazione
  TioApplication.AuthorizeByRequestObj(LAuthDecisionRequest);

  // Get the selection destination BindSourceAdapter
  LDestBSA := ATargetBS.GetActiveBindSourceAdapter;
  // If the selection is allowed then send a ntSaveRevertPoint notification
  if LDestBSA.Notify(ASender, TioBSNotification.Create(TioBSNotificationType.ntCanReceiveSelection)) then
    LDestBSA.Notify(ASender, TioBSNotification.Create(TioBSNotificationType.ntSaveRevertPoint))
  else
    raise EioGenericException.Create(ClassName, 'Select<T>', 'Master BindSource hasn''t saved a revert point');

  // Encapsulate the SelectedInstance into a TValue then assign it
  // as selection in a proper way
  // NB: Lasciare assolutamente così perchè ho già provato in vari modi ma mi dava sempre un errore
  // facendo così invece (cioè passando per un TValue) funziona correttamente.
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
  // Controlla che non sia già assegnato (lo stesso)
  if AETMFor = LMasterBindSource.ETMfor then
    Exit;
  // ETMfor must be different from itself
  if Assigned(AETMfor) and (AETMfor as TObject).Equals(LMasterBindSource as TObject) then
    raise EioGenericException.Create(Self.ClassName, 'SetETMfor', Format('The "ETMfor" property of the "%s" bind source must be different from itself.', [LMasterBindSource.GetName]));
  // Se è aperto e stiamo cambiando l'ETMfor (già verificato all'inizio) allora si chiude (se è il caso si riaprirà alla fine del metodo)
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
  // NB: All'inizio abbiamo già verificatoche sono diversi
  if Assigned(LMasterBindSource.ETMFor) then
    LMasterBindSource.ETMfor.UnregisterDetailBindSource(ABindSource);
  // Set the private field
  LMasterBindSource._InternalSetETMforPrivateField(AETMfor as IioBindSource);
  // Se il BS ETMfor è già attivo allora attiva automaticamente anche per se stesso
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

class function TioCommonBSBehavior.DetailObjLookup_ByLookupBindSource(const ABindSource: IioBindSource; const AFullPathFieldName: String; const [ref] AValue: TValue): TValue;
var
  I: Integer;
  LCleanFieldName: String;
  LLookupBindSourceName: String;
  LLookupBindSource: IioBindSource;
  LCurrentObjItem: TObject;
  LDetailObj: TObject;
  LOwner: TComponent;
  LDuckList: IioDuckTypedList;
begin
  // If AFullPathFieldName contains object lookup info...
  if DetailObjLookup_SplitFieldNameAndLookupInfo(AFullPathFieldName, SOLO_BINDSOURCE_SEPARATOR, LCleanFieldName, LLookupBindSourceName) then
  begin
    // Search for the lookup-bind-source
    LOwner := (ABindSource as TComponent).Owner;
    for I := 0 to LOwner.ComponentCount-1 do
    begin
      if LOwner.Components[I].Name = LLookupBindSourceName then
      begin
        // Checks whether the found component implements the IioBindSource interface.
        if not Supports(LOwner.Components[I], IioBindSource, LLookupBindSource) then
          raise EioGenericException.Create(ClassName, 'DetailObjLookup_ByLookupBindSource', Format('Lookup component named "%s" found but does not implement the "IioBindSource" interface', [LLookupBindSourceName]));
        // Check if LookupBindSource is active
        if not LLookupBindSource.IsActive then
          raise EioGenericException.Create(ClassName, 'DetailObjLookup_ByLookupBindSource', Format('Lookup BindSource named "%s" found but not active', [LLookupBindSourceName]));
        // Extract the new detail object:
        // If the DataObject of the LookupBindSource is a List then it loops until it finds the element with the searched ID
        if TioDuckTypedFactory.IsList(LLookupBindSource.DataObject) then
        begin
          LDuckList := TioDuckTypedFactory.DuckTypedList(LLookupBindSource.DataObject);
          for LCurrentObjItem in LDuckList do
          begin
            // If the current item isn't assigned then continue
            if not Assigned(LCurrentObjItem) then
              Continue;
            // If the current object ID equals the searched one then set it as the new detail object
            if TioUtilities.ObjToID(LCurrentObjItem) = AValue.AsInteger then
            begin
              // Clone the object or not depending on OnReceiveSelectionCloneObject property of the BindSource
              if ABindSource.OnReceiveSelectionCloneObject and not LLookupBindSource.IsInterfacePresenting then
                LDetailObj := TioUtilities.CloneObject(LCurrentObjItem)
              else
                LDetailObj := LCurrentObjItem;
              // Set the new detail object
              Result := DetailObjLookup_SetDetailObject(ABindSource, LDetailObj, LCleanFieldName, LDetailObj.ClassName);
              Exit;
            end;
          end;
          // If it gets here it means that it has not found the DetailObject with the searched ID and therefore raises an exception.
          raise EioGenericException.Create(ClassName, 'DetailObjLookup_ByLookupBindSource', Format('Looking Up for a lookup instance with ID equals to %d but I couldn''t find it', [AValue.Asinteger]));
        end
        // Else check if the DataObject (SingleObject) ID equals  the searched one
        else
        begin
          LDetailObj := LLookupBindSource.DataObject;
          if TioUtilities.ObjToID(LDetailObj) = AValue.AsInteger then
            Result := DetailObjLookup_SetDetailObject(ABindSource, LDetailObj, LCleanFieldName, LDetailObj.ClassName)
          else
            raise EioGenericException.Create(ClassName, 'DetailObjLookup_ByLookupBindSource', Format('Lookup BindSource named "%s" not found when searching on the owner component named "%s"', [AValue.Asinteger]));
        end;
      end;
    end;
    // Se arriva qui significa che non ha trovato il LookupBindSource
    // If it gets here it means that it has not found the DetailObject with the searched ID and therefore raises an exception.
    raise EioGenericException.Create(ClassName, 'DetailObjLookup_ByLookupBindSource', Format('Lookup BindSource named "%s" not found searching on the owner component named "%s"', [LLookupBindSourceName, LOwner.Name]));
  end
  else
    // else return the AValue as is
    Result := AValue;
end;

class function TioCommonBSBehavior.DetailObjLookup_ByTypeName(const ABindSource: IioBindSource; const AFullPathFieldName: String; const [ref] AValue: TValue): TValue;
var
  LCleanFieldName: String;
  LDetailTypeName: String;
  LDetailObj: TObject;
begin
  // If AFullPathFieldName contains object lookup info...
  if DetailObjLookup_SplitFieldNameAndLookupInfo(AFullPathFieldName, SOLO_CLASS_SEPARATOR, LCleanFieldName, LDetailTypeName) then
  begin
    // Load the new detail object
    LDetailObj := io.Load(LDetailTypeName).ByID(AValue.AsInteger).ToObject;
    // Set the new detail object
    Result := DetailObjLookup_SetDetailObject(ABindSource, LDetailObj, LCleanFieldName, LDetailTypeName);
  end
  else
    // else return the AValue as is
    Result := AValue;
end;

class procedure TioCommonBSBehavior.DetailObjLookup_ClearLookupInfoFromFieldName(var [ref] AFullPathFieldName: String);
var
  LDummyDetailTypeName: String;
begin
  DetailObjLookup_SplitFieldNameAndLookupInfo(AFullPathFieldName, SOLO_CLASS_SEPARATOR, AFullPathFieldName, LDummyDetailTypeName);
  DetailObjLookup_SplitFieldNameAndLookupInfo(AFullPathFieldName, SOLO_BINDSOURCE_SEPARATOR, AFullPathFieldName, LDummyDetailTypeName);
end;

class function TioCommonBSBehavior.DetailObjLookup_DetailObjID(const AFullPathFieldName: String; const [ref] AValue: TValue): TValue;
var
  LCleanFieldName: String;
  LDetailTypeName: String;
begin
  if DetailObjLookup_SplitFieldNameAndLookupInfo(AFullPathFieldName, SOLO_CLASS_SEPARATOR, LCleanFieldName, LDetailTypeName)
  or DetailObjLookup_SplitFieldNameAndLookupInfo(AFullPathFieldName, SOLO_BINDSOURCE_SEPARATOR, LCleanFieldName, LDetailTypeName) then
  begin
    if AValue.IsEmpty then
      Result := TValue.Empty
    else
      Result := TioUtilities.ObjToID(AValue.AsObject);
  end
  else
    Result := AValue;
end;

class function TioCommonBSBehavior.DetailObjLookup_SetDetailObject(const ABindSource: IioBindSource; ADetailObj: TObject; const APropertyName, ADetailTypeName: String): TValue;
var
  LAuthDecisionRequest: IioAuthDecisionRequest;
  LDetailIntf: IInterface;
  LDone: Boolean;
  LPreviousDetailObject: TObject;
  LSelectionType: TioSelectionType;
begin
  // Check the detail object
  if not Assigned(ADetailObj) then
    raise EioGenericException.Create(ClassName, 'DetailObjLookup_SetDetailObject', '"ADetailObj" parameter not assigned (nil)');
  // Parte che si occupa della richiesta dell'autorizzazione ad eseguire la selezione oppure no.
  //  Prima crea l'oggetto AuthorizationRequest, lo imposta con il TypeName dell'oggetto ricevuto come selezione
  //  e lo passa all'evento "BeforeReceiveSelection" dove, tra le altre cose, è possibile cambiare i valori delle
  //  proprietà della AuthorizationRequest se necesario, alla fine esegue la richiesta di autorizzazione.
  //  NB: Ho fatto così perchè ragionando molto sono giunto alla conclusione che non era possibile impostare
  //       la AuthorizationRequest in modo che andasse bene in qualunque situazione, dipende sempre da cosa
  //       vuole fare il programmatore e come quindi ho deciso di fare in modo che scrivendo un event handler
  //       (BeforeReceiveSelection...) sia possibile intervenire e impostare la richiesta di autorizzazione
  //       come si vuole
  LAuthDecisionRequest := TioAuthFactory.NewAuthDecisionRequest(ADetailObj.ClassName, atMakeSelection, itRegular, ABindSource._InternalGetAuthorizationContext, False);
  LSelectionType := TioSelectionType.stAppend;
  if TioUtilities.IsAnInterfaceTypeName(ADetailTypeName) then
  begin
    LDetailIntf := TioUtilities.CastObjectToGeneric<IInterface>(ADetailObj);
    ABindSource.DoBeforeReceiveSelection(LDetailIntf, LSelectionType, LAuthDecisionRequest);
  end
  else
    ABindSource.DoBeforeReceiveSelection(ADetailObj, LSelectionType, LAuthDecisionRequest);
  // Esegue la richiesta di autorizzazione
  TioApplication.AuthorizeByRequestObj(LAuthDecisionRequest);
  // ReceiveSelection event handler
  LDone := False;
  if TioUtilities.IsAnInterfaceTypeName(ADetailTypeName) then
    ABindSource.DoReceiveSelection(LDetailIntf, LSelectionType, LDone)
  else
    ABindSource.DoReceiveSelection(ADetailObj, LSelectionType, LDone);
  // Put the new detail object into the result TValue
  if not LDone then
  begin
    if Assigned(ADetailObj) then
      TValue.Make(@ADetailObj, ADetailObj.ClassInfo, Result)
    else
      Result := TValue.Empty;
  end;
  // AfterReceiveSelection event handler
  if TioUtilities.IsAnInterfaceTypeName(ADetailTypeName) then
    ABindSource.DoAfterReceiveSelection(LDetailIntf, LSelectionType)
  else
    ABindSource.DoAfterReceiveSelection(ADetailObj, LSelectionType);
  // If the OnReceiveSelectionFreeObject of the BindSource is True then get the previous detail object and free it
  if ABindSource.OnReceiveSelectionFreeObject and not TioUtilities.IsAnInterfaceTypeName(ADetailTypeName) then
  begin
    LPreviousDetailObject := TioUtilities.ResolveChildPropertyPath_GetFinalObj_ByStringPath(ABindSource.Current, APropertyName);
    if Assigned(LPreviousDetailObject) then
      LPreviousDetailObject.Free;
  end;
end;

class function TioCommonBSBehavior.DetailObjLookup_SplitFieldNameAndLookupInfo(const AFullPathFieldName: String; const ASeparator: Char; var OutFieldName,
  OutLookupInfo: String): Boolean;
var
  LPos: Integer;
begin
  LPos := Pos(ASeparator, AFullPathFieldName);
  Result := (LPos > 0);
  if Result then
  begin
    OutLookupInfo := Copy(AFullPathFieldName, LPos+1);
    OutFieldName := Copy(AFullPathFieldName, 1, LPos-1);
  end
  else
  begin
    OutLookupInfo := String.Empty;
    OutFieldName := AFullPathFieldName;
  end;
end;

class function TioCommonBSBehavior.GetFirstMasterPersistenceBindSource(const AStartBindSource: IioBindSource): IioBindSource;
begin
  if Assigned(AStartBindSource) then
  begin
    Result := AStartBindSource;
    while (not Result.IsMasterBS) and Result.HasMasterBS do
      Result := Result.MasterBindSource;
  end
  else
    Result := nil;
end;

end.
