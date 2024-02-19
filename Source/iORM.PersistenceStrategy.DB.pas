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
unit iORM.PersistenceStrategy.DB;

interface

uses
  iORM.Context.Interfaces,
  iORM.Context.Properties.Interfaces, iORM.Where.Interfaces,
  iORM.DB.Interfaces, FireDAC.Comp.DataSet, Data.DB,
  iORM.LiveBindings.BSPersistence, iORM.CommonTypes;

type

  // Strategy class for database
  TioPersistenceStrategyDB = class(TioPersistenceStrategyIntf)
  private
    class procedure InsertObject_Internal(const AContext: IioContext);
    class procedure UpdateObject_Internal(const AContext: IioContext);
    class procedure DeleteObject_Internal(const AContext: IioContext);
    class procedure PreProcessRelationChildOnDelete(const AMasterContext: IioContext);
    class procedure PreProcessRelationChildOnPersist(const AMasterContext: IioContext);
    class procedure PostProcessRelationChildOnPersist(const AMasterContext: IioContext);
    class function ObjectExists(const AContext: IioContext): Boolean;
    class function LoadObjVersion_FromEntity_Internal(const AContext: IioContext): Integer;
    class function LoadObjVersion_FromETM_Internal(const AContext: IioContext): Integer;
  protected
    // ---------- Begin intercepted methods (StrategyInterceptors) ----------
    class procedure _DoPersistObject(const AObj: TObject; const AIntent: TioPersistenceIntentType; const ARelationPropertyName: String;
      const ARelationOID: Integer; const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String; const ABlindLevel: Byte); override;
    class procedure _DoPersistList(const AList: TObject; const AIntent: TioPersistenceIntentType; const ARelationPropertyName: String;
      const ARelationOID: Integer; const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String; const ABlindLevel: Byte); override;
    class procedure _DoDeleteObject(const AObj: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte); override;
    class procedure _DoDeleteList(const AList: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte); override;
    class procedure _DoLoadList(const AWhere: IioWhere; const AList: TObject; const AIntent: TioPersistenceIntentType); override;
    class function _DoLoadObject(const AWhere: IioWhere; const AObj: TObject; const AIntent: TioPersistenceIntentType): TObject; override;
    // ---------- End intercepted methods (StrategyInterceptors) ----------
  public
    class procedure StartTransaction(const AConnectionName: String); override;
    class procedure CommitTransaction(const AConnectionName: String); override;
    class procedure RollbackTransaction(const AConnectionName: String); override;
    class function InTransaction(const AConnectionName: String): Boolean; override;
    class procedure Delete(const AWhere: IioWhere); override;
    class function LoadObjectByClassOnly(const AWhere: IioWhere; const AObj: TObject; const AIntent: TioPersistenceIntentType): TObject; override;
    class procedure LoadDataSet(const AWhere: IioWhere; const ADestDataSet: TFDDataSet); override;
    class function LoadObjVersion(const AContext: IioContext): Integer; override;
    class function Count(const AWhere: IioWhere): Integer; override;
    // SQLDestinations
    class procedure SQLDest_LoadDataSet(const ASQLDestination: IioSQLDestination; const ADestDataSet: TFDDataSet); override;
    class procedure SQLDest_Execute(const ASQLDestination: IioSQLDestination); override;
  end;

implementation

uses
  iORM.Context.Factory, iORM.Attributes,
  iORM.DB.ConnectionContainer, iORM.DB.Factory, iORM.DuckTyped.Interfaces,
  iORM.DuckTyped.Factory, iORM.Resolver.Interfaces, iORM.ObjectsForge.Factory,
  iORM.LazyLoad.Factory, iORM.Resolver.Factory, iORM.Where.Factory,
  iORM.Exceptions, iORM, System.SysUtils, System.Generics.Collections,
  iORM.Interceptor.CRUD, iORM.Interceptor.CRUD.Register, iORM.Utilities;

type

  IioContextCache = interface
    ['{FAFBB27B-3E84-4D23-8801-3C863FA3556B}']
    function GetContext(const AIntent: TioPersistenceIntentType; const AClassName: String; const AWhere: IioWhere; const ABlindLevel: Byte): IioContext;
  end;

  TioContextCache = class(TInterfacedObject, IioContextCache)
  strict private
    FContainer: TDictionary<String, IioContext>;
  public
    constructor Create;
    destructor Destroy; override;
    function GetContext(const AIntent: TioPersistenceIntentType; const AClassName: String; const AWhere: IioWhere; const ABlindLevel: Byte): IioContext;
  end;

  { TioStrategyDB }

class procedure TioPersistenceStrategyDB.CommitTransaction(const AConnectionName: String);
begin
  inherited;
  TioDBFactory.Connection(AConnectionName).Commit;
end;

class function TioPersistenceStrategyDB.Count(const AWhere: IioWhere): Integer;
var
  AResolvedTypeList: IioResolvedTypeList;
  AResolvedTypeName: String;
  AContext: IioContext;
  ATransactionCollection: IioTransactionCollection;
  // Nested
  procedure NestedCount;
  var
    AQuery: IioQuery;
  begin
    AQuery := TioDBFactory.QueryEngine.GetQueryCount(AContext);
    AQuery.Open;
    try
      Result := Result + AQuery.Fields[0].AsInteger;
    finally
      AQuery.Close;
    end;
  end;

begin
  inherited;
  Result := 0;
  // Resolve the type and alias
  AResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(AWhere.TypeName, AWhere.TypeAlias, rmAllDistinctByConnectionAndTable);
  // Get the transaction collection
  ATransactionCollection := TioDBFactory.TransactionCollection;
  try
    // Loop for all classes in the sesolved type list
    for AResolvedTypeName in AResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      AContext := TioContextFactory.Context(itRegular, AResolvedTypeName, AWhere, nil, nil, '', '', BL_DEFAULT);
      // If the object is of a class mapped as NotPersisted then continue
      if AContext.Map.GetTable.IsNotPersistedEntity then
        Exit;
      // Start transaction
      ATransactionCollection.StartTransaction(AContext.GetTable.GetConnectionDefName);
      // Get the count value for the current resolved type
      NestedCount;
    end;
    // Commit ALL transactions
    ATransactionCollection.CommitAll;
  except
    // Rollback ALL transactions
    ATransactionCollection.RollbackAll;
    raise;
  end;
end;

class procedure TioPersistenceStrategyDB.Delete(const AWhere: IioWhere);
var
  AResolvedTypeList: IioResolvedTypeList;
  AResolvedTypeName: String;
  AContext: IioContext;
  ATransactionCollection: IioTransactionCollection;
  // Nested
  procedure NestedDelete;
  var
    LQuery: IioQuery;
  begin
    // Create & execute query
    LQuery := TioDBFactory.QueryEngine.GetQueryDelete(AContext, False);
    LQuery.ExecSQL;
  end;

begin
  inherited;
  // Resolve the type and alias
  AResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(AWhere.TypeName, AWhere.TypeAlias, rmAllDistinctByConnectionAndTable);
  // Get the transaction collection
  ATransactionCollection := TioDBFactory.TransactionCollection;
  try
    // Loop for all classes in the sesolved type list
    for AResolvedTypeName in AResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      AContext := TioContextFactory.Context(itRegular, AResolvedTypeName, AWhere, nil, nil, '', '', BL_DEFAULT);
      // If the object is of a class mapped as NotPersisted then skip it
      if AContext.Map.GetTable.IsNotPersistedEntity then
        Continue;
      // Start transaction
      ATransactionCollection.StartTransaction(AContext.GetTable.GetConnectionDefName);
      // Load the current class data into the list
      NestedDelete;
    end;
    // Commit ALL transactions
    ATransactionCollection.CommitAll;
  except
    // Rollback ALL transactions
    ATransactionCollection.RollbackAll;
    raise;
  end;
end;

class procedure TioPersistenceStrategyDB._DoDeleteList(const AList: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte);
var
  ADuckTypedList: IioDuckTypedList;
  AObj: TObject;
begin
  inherited;
  // NB: Qui avvio la transazione per fare in modo che tutto il Persist di tutti gli oggetti contenuti
  // nella collection vengano persistiti o annullati ma poi ogni chiamata a PersistObject riavvia
  // una transazione per l'oggetto singolo (che non avrà praticamente effetto perchè inglobata
  // da quella avviata qua sotto.
  // Nel caso particolare in cui uno o più singoli oggetti contenuti dela collection siano di una
  // qualche classe che opera su una ConnectionDef diversa da quella di default verrà avviata (all'interno
  // della chiamata a "PersistObject" una transazione sulla Connection diversa da quella di default e quindi
  // al di fuori della transazione principale sulla connessione di default avviata qui sotto e in pratica
  // per questi oggetti ogni chiamata a "PersistObject" verrà eseguita nel contesto di una singola transazione
  // slegata dalle altre e quindi è possibile che (solo in questo specifico e particolare caso) alcune operazioni
  // vadano a buon fine mentre altre no.
  // AL momento non ho una soluzione al problema.
  // NB: Qui non posso conoscere con certezza il tipo di oggetti realmente contenuto nella collection
  // in quanto il tipo reale dell'oggetto potrebbe essere diverso dal genericType della lista stessa
  // (a maggior ragione nel caso di una TList<IInterface> di interfacce, quindi avvio una transazione
  // sulla connessione di default che va bene nel 99% delle volte (raramente l'applicazione dichiererà classi
  // che operano su Database diversi contemporaneamente.
  Self.StartTransaction('');
  try
    // Wrap the DestList into a DuckTypedList
    ADuckTypedList := TioDuckTypedFactory.DuckTypedList(AList);
    // Loop the list and delete objects
    for AObj in ADuckTypedList do
    begin
      // Persist object
      Self._DoDeleteObject(AObj, AIntent, ABlindLevel);
    end;
    Self.CommitTransaction('');
  except
    Self.RollbackTransaction('');
    raise;
  end;
end;

class procedure TioPersistenceStrategyDB._DoDeleteObject(const AObj: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte);
var
  LContext: IioContext;

{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioCRUDInterceptorsOff}
  LDoneByInterceptor: Boolean;
{$ENDIF}
{$ENDREGION}
begin
  inherited;
  // Check
  if not Assigned(AObj) then
    Exit;
  // Create Context (Create a dummy ioWhere first to pass ConnectionName parameter only).
  LContext := TioContextFactory.Context(AIntent, AObj.ClassName, nil, AObj, nil, '', '', ABlindLevel);
  LContext.ActionType := atDelete;
  // If the object is of a class mapped as NotPersisted then exit
  if LContext.Map.GetTable.IsNotPersistedEntity then
    Exit;
  // Start transaction
  StartTransaction(LContext.GetTable.GetConnectionDefName);
  try

{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioCRUDInterceptorsOff}
    LDoneByInterceptor := False;
    TioCRUDInterceptorRegister.BeforeDelete(LContext, LDoneByInterceptor);
    if not LDoneByInterceptor then
    begin
{$ENDIF}
{$ENDREGION}
      // PreProcess (delete) relation childs (HasMany, HasOne)
      PreProcessRelationChildOnDelete(LContext);
      // Delete the object
      DeleteObject_Internal(LContext);

{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioCRUDInterceptorsOff}
      TioCRUDInterceptorRegister.AfterDelete(LContext);
    end;
{$ENDIF}
{$ENDREGION}
    // Commit
    CommitTransaction(LContext.GetTable.GetConnectionDefName);

  except
    on E: Exception do
    begin
      // Rollback
      RollbackTransaction(LContext.GetTable.GetConnectionDefName);
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioCRUDInterceptorsOff}
      if TioCRUDInterceptorRegister.OnDeleteException(LContext, E) then
{$ENDIF}
{$ENDREGION}
        raise;
    end;
  end;
end;

class procedure TioPersistenceStrategyDB.DeleteObject_Internal(const AContext: IioContext);
var
  LQuery: IioQuery;
begin
  inherited;
  // If the ID is null then exit because the entity was not persisted
  if AContext.IDIsNull then
    Exit;
  // Conflict strategy: check if there is a persistence conflict or prepare the where object of the context
  // to consider the version property (or some other property useful for conflict detection)
  if AContext.BlindLevel_Do_DetectConflicts then
    AContext.CheckDeleteConflict(AContext);
  // Create and execute the query to delete the entity on DB cheking the version to avoid concurrency
  // conflict (if versioning is enabled for this type of entity)
  if not AContext.ConflictDetected then
  begin
    LQuery := TioDBFactory.QueryEngine.GetQueryDelete(AContext, AContext.BlindLevel_Do_DetectConflicts);
    AContext.ConflictDetected := LQuery.ExecSQL = 0;
  end;
  // Conflict strategy: if a conclict is detected then resolve it
  // note: if the ConflictStrategy resolves the conflict then it must try to run the query again
  // but without checking the ObjVersion (otherwise it would obviously fail again)
  if AContext.ConflictDetected then
  begin
    AContext.ResolveDeleteConflict(AContext);
    if AContext.ConflictState = csResolved then
    begin
      AContext.BlindLevel_Reset_DetectConflicts;
      TioDBFactory.QueryEngine.GetQueryDelete(AContext, True).ExecSQL;
    end;
  end;
end;

class procedure TioPersistenceStrategyDB.InsertObject_Internal(const AContext: IioContext);
var
  LQuery: IioQuery;
begin
  inherited;



//  AContext.GetTable.conne



  // Conflict strategy: check if there is a persistence conflict
  if AContext.BlindLevel_Do_DetectConflicts then
    AContext.CheckInsertConflict(AContext);
  // Conflict strategy: if a conclict is detected then resolve it
  if AContext.ConflictDetected then
  begin
    AContext.ResolveInsertConflict(AContext);
    if AContext.ConflictState > csResolved then // if Rejected or RejectedRaise
      Exit;
  end;
  // -----------------------------------------------------------
  // Get and execute a query to retrieve the next ID for the inserting object
  // before the insert query (for Firebird/Interbase)
  if (TioConnectionManager.GetConnectionInfo(AContext.GetTable.GetConnectionDefName).KeyGenerationTime = kgtBeforeInsert)
  and (AContext.BlindLevel_Do_AutoUpdateProps or AContext.GetProperties.ContainsHasManyOrHasOneProperties)
  and AContext.IDIsNull then
  begin
    LQuery := TioDBFactory.QueryEngine.GetQueryNextID(AContext);
    try
      LQuery.Open;
      // Set the NextID as the ObjectID
      AContext.GetProperties.GetIdProperty.SetValue(AContext.DataObject, LQuery.Fields[0].AsInteger);
    finally
      LQuery.Close;
    end;
  end;
  // -----------------------------------------------------------
  // Create and execute insert query and set the version/created/updated of the entity (Intercepted by crudInterceptors)
  LQuery := TioDBFactory.QueryEngine.GetQueryInsert(AContext);
  LQuery.ExecSQL;
  if AContext.BlindLevel_Do_AutoUpdateProps then
  begin
    AContext.ObjVersion := AContext.ObjNextVersion;
    AContext.ObjCreated := LQuery.Connection.LastTransactionTimestamp;
    AContext.ObjCreatedUserID := TioConnectionManager.GetCurrentConnectionInfo.CurrentUserID;
    AContext.ObjCreatedUserName := TioConnectionManager.GetCurrentConnectionInfo.CurrentUserName;
    AContext.ObjUpdated := LQuery.Connection.LastTransactionTimestamp;
    AContext.ObjUpdatedUserID := TioConnectionManager.GetCurrentConnectionInfo.CurrentUserID;
    AContext.ObjUpdatedUserName := TioConnectionManager.GetCurrentConnectionInfo.CurrentUserName;
  end;
  // -----------------------------------------------------------
  // Get and execute a query to retrieve the last ID generated
  // in the last insert query.
  if (TioConnectionManager.GetConnectionInfo(AContext.GetTable.GetConnectionDefName).KeyGenerationTime = kgtAfterInsert)
  and (AContext.BlindLevel_Do_AutoUpdateProps or AContext.GetProperties.ContainsHasManyOrHasOneProperties)
  and AContext.IDIsNull then
  begin
    LQuery := TioDBFactory.QueryEngine.GetQueryNextID(AContext);
    try
      LQuery.Open;
      // Set the NextID as the ObjectID
      AContext.GetProperties.GetIdProperty.SetValue(AContext.DataObject, LQuery.Fields[0].AsInteger);
    finally
      LQuery.Close;
    end;
  end;
  // -----------------------------------------------------------
  AContext.ObjStatus := osClean;
end;

class function TioPersistenceStrategyDB.InTransaction(const AConnectionName: String): Boolean;
begin
  inherited;
  Result := TioDBFactory.Connection(AConnectionName).InTransaction;
end;

class function TioPersistenceStrategyDB.LoadObjectByClassOnly(const AWhere: IioWhere; const AObj: TObject; const AIntent: TioPersistenceIntentType): TObject;
var
  LContext: IioContext;
  LQuery: IioQuery;
begin
  inherited;
  // Init
  Result := AObj;
  // Get the Context
  LContext := TioContextFactory.Context(AIntent, AWhere.TypeName, AWhere, Result, nil, '', '', BL_DEFAULT);
  // If the object is of a class mapped as NotPersisted then skip it
  if LContext.Map.GetTable.IsNotPersistedEntity then
    Exit;
  // Create & open query
  LQuery := TioDBFactory.QueryEngine.GetQuerySelectObject(LContext);
  LQuery.Open;
  try
    // Create the object as TObject
    if not LQuery.IsEmpty then
      Result := TioObjectMakerFactory.GetObjectMaker(LContext).MakeObject(LContext, LQuery);
  finally
    // Close query
    LQuery.Close;
  end;
end;

class function TioPersistenceStrategyDB.LoadObjVersion(const AContext: IioContext): Integer;
begin
  // NB: Ho riflettuto bene sul come ottenere l'ultima ObjVersion (la più alta) assegnata
  // per poi aggiungere 1 e ottenere la prossima e ho idnividuato 3 metodi:
  // 1) SENZA ETM: fa una query che prende l'ObjVersion dell'oggetto dal DB (normale tabella della classe della entity);
  // siccome possono verificarsi "salti" tra la versione in memoria e quella sul DB
  // (es: due utenti con stesso oggetto in memoria ver. 5, il primo salva e non ci sono conflitti, ora sul DB c'è la ver. 6, il secondo salva
  // successivamente e la nuova versione deve essere la 7) in questo caso l'unico modo è di interrogare il DB e farsi dare la versione più alta presente.
  // Se un oggetto viene eliminato sul DB e poi qualcuno lo ripersiste (magari lo aveva in memoria da prima del delete) l'ObjVersion ricomincia da 1
  // e non vedo soluzione a questa cosa.
  // 2) CON ETM: se c'è l'ETM per la classe dell'oggetto che si vuole persistere si farà la stessa cosa del punto uno ma in più, se non riuscisse
  // ad avere l'ObjVersion perchè l'entità è stata eliminata nel frattempo, allora si eseguirà una seconda query per chiedere all'ETM
  // l'ultimo ObjVersion (il maggiore) registrato. In questo modo se l'oggetto era stato eliminato risolviamo il problema del punto 1 ma
  // questa penso sarà una cosa non frequente, negli altri casi invece (quindi normalmente) continuiamo a usare il punto 1 che dovrebbe essere
  // leggermente più efficiente.
  inherited;
  // Step 1: Prova a caricare l'ObjVersion dalla tabella su cui è mappata l'entità
  Result := LoadObjVersion_FromEntity_Internal(AContext);
  // Step 2: Se lo step precedente non ha avuto successo prova a caricare l'ObjVersion dall'ETM (se c'è)
  if (Result = OBJVERSION_NULL) and Assigned(AContext.GetTable.EtmTimeSlotClass) then
    Result := LoadObjVersion_FromETM_Internal(AContext);
end;

class function TioPersistenceStrategyDB.LoadObjVersion_FromEntity_Internal(const AContext: IioContext): Integer;
var
  LQuery: IioQuery;
begin
  // Create & open query
  LQuery := TioDBFactory.QueryEngine.GetQuerySelectLastObjVersionFromEntity(AContext);
  LQuery.Open;
  try
    if not LQuery.Eof then
      Result := LQuery.Fields[0].AsInteger
    else
      Result := OBJVERSION_NULL;
  finally
    LQuery.Close;
  end;
end;

class function TioPersistenceStrategyDB.LoadObjVersion_FromETM_Internal(const AContext: IioContext): Integer;
var
  LQuery: IioQuery;
begin
  // Create & open query
  LQuery := TioDBFactory.QueryEngine.GetQuerySelectLastObjVersionFromEtm(AContext);
  LQuery.Open;
  try
    // note: ho provato a usare "AsInteger" sul campo ma dava problemi quindi ho deciso di testare "IsNull"
    if LQuery.Eof or LQuery.Fields[0].IsNull then
      Result := OBJVERSION_NULL
    else
      Result := LQuery.Fields[0].AsInteger
  finally
    LQuery.Close;
  end;
end;

class function TioPersistenceStrategyDB.ObjectExists(const AContext: IioContext): Boolean;
var
  LQuery: IioQuery;
begin
  inherited;
  // Generate and open the query
  LQuery := TioDBFactory.QueryEngine.GetQueryExists(AContext);
  LQuery.Open;
  try
    Result := LQuery.Fields[0].AsInteger <> 0;
  finally
    LQuery.Close;
  end;
end;

class procedure TioPersistenceStrategyDB._DoPersistList(const AList: TObject; const AIntent: TioPersistenceIntentType; const ARelationPropertyName: String;
      const ARelationOID: Integer; const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String; const ABlindLevel: Byte);
var
  LDuckTypedList: IioDuckTypedList;
  LObj: TObject;
begin
  inherited;
  // NB: Qui avvio la transazione per fare in modo che tutto il Persist di tutti gli oggetti contenuti
  // nella collection vengano persistiti o annullati ma poi ogni chiamata a PersistObject riavvia
  // una transazione per l'oggetto singolo (che non avrà praticamente effetto perchè inglobata
  // da quella avviata qua sotto.
  // Nel caso particolare in cui uno o più singoli oggetti contenuti dela collection siano di una
  // qualche classe che opera su una ConnectionDef diversa da quella di default verrà avviata (all'interno
  // della chiamata a "PersistObject" una transazione sulla Connection diversa da quella di default e quindi
  // al di fuori della transazione principale sulla connessione di default avviata qui sotto e in pratica
  // per questi oggetti ogni chiamata a "PersistObject" verrà eseguita nel contesto di una singola transazione
  // slegata dalle altre e quindi è possibile che (solo in questo specifico e particolare caso) alcune operazioni
  // vadano a buon fine mentre altre no.
  // AL momento non ho una soluzione al problema.
  // NB: Qui non posso conoscere con certezza il tipo di oggetti realmente contenuto nella collection
  // in quanto il tipo reale dell'oggetto potrebbe essere diverso dal genericType della lista stessa
  // (a maggior ragione nel caso di una TList<IInterface> di interfacce, quindi avvio una transazione
  // sulla connessione di default che va bene nel 99% delle volte (raramente l'applicazione dichiererà classi
  // che operano su Database diversi contemporaneamente.
  StartTransaction('');
  try
    // Wrap the DestList into a DuckTypedList
    LDuckTypedList := TioDuckTypedFactory.DuckTypedList(AList);
    // Loop the list
    for LObj in LDuckTypedList do
      _DoPersistObject(LObj, AIntent, ARelationPropertyName, ARelationOID, AMasterBSPersistence, AMasterPropertyName, AMasterPropertyPath, ABlindLevel);
    // Commit the transaction
    CommitTransaction('');
  except
    RollbackTransaction('');
    raise;
  end;
end;

class procedure TioPersistenceStrategyDB._DoPersistObject(const AObj: TObject; const AIntent: TioPersistenceIntentType; const ARelationPropertyName: String;
      const ARelationOID: Integer; const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String; const ABlindLevel: Byte);
var
  LContext: IioContext;

{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioCRUDInterceptorsOff}
  LDoneByInterceptor: Boolean;

  procedure _Interceptors_InterceptBeforeAction;
  begin
    LDoneByInterceptor := False;
    case LContext.ActionType of
      atUpdate:
        TioCRUDInterceptorRegister.BeforeUpdate(LContext, LDoneByInterceptor);
      atInsert:
        TioCRUDInterceptorRegister.BeforeInsert(LContext, LDoneByInterceptor);
      atDelete:
        TioCRUDInterceptorRegister.BeforeDelete(LContext, LDoneByInterceptor);
    end;
  end;
  procedure _Interceptors_InterceptAfterAction;
  begin
    case LContext.ActionType of
      atUpdate:
        TioCRUDInterceptorRegister.AfterUpdate(LContext);
      atInsert:
        TioCRUDInterceptorRegister.AfterInsert(LContext);
      atDelete:
        TioCRUDInterceptorRegister.AfterDelete(LContext);
    end;
  end;
  function _Interceptors_InterceptException(const AException: Exception): Boolean;
  begin
    case LContext.ActionType of
      atUpdate:
        Result := TioCRUDInterceptorRegister.OnUpdateException(LContext, AException);
      atInsert:
        Result := TioCRUDInterceptorRegister.OnInsertException(LContext, AException);
      atDelete:
        Result := TioCRUDInterceptorRegister.OnDeleteException(LContext, AException);
    else
      Result := True; // Per sicurezza
    end;
  end;
{$ENDIF}
{$ENDREGION}
  procedure _DetectPersistActionType;
  begin
    case LContext.ObjStatus of
      osDirty:
        begin
          // note: if SmartUpdateDetection system is not enabled or (if enabled) the object is to be persisted (according to the SmartUpdateDetection system)...
          if LContext.GetProperties.ObjStatusPropertyExist or (AMasterBSPersistence = nil) or (not AMasterBSPersistence.IsSmartUpdateDetectionEnabled) or
            AMasterBSPersistence.SmartUpdateDetection.IsToBePersisted(AObj, LContext.MasterPropertyPath) then
          begin
            // old code: if (AContext.GetProperties.GetIdProperty.GetValue(AContext.DataObject).AsInteger <> IO_INTEGER_NULL_VALUE)
            if LContext.IDIsNull or (LContext.BlindLevel_Do_DetectObjExists and not ObjectExists(LContext)) then
              LContext.ActionType := atInsert
            else
              LContext.ActionType := atUpdate;
          end;
        end;
      osDeleted:
      else
        LContext.ActionType := atDoNotPersist;
    end;
  end;

begin
  inherited;
  // Check
  if not Assigned(AObj) then
    Exit;
  // Create Context
  LContext := TioContextFactory.Context(AIntent, AObj.ClassName, nil, AObj, AMasterBSPersistence, AMasterPropertyName, AMasterPropertyPath, ABlindLevel);
  // If the object is of a class mapped as NotPersisted then exit
  if LContext.Map.GetTable.IsNotPersistedEntity then
    Exit;
  // Start transaction
  StartTransaction(LContext.GetTable.GetConnectionDefName);
  try
    // Set/Update MasterID property if this is a relation child object (HasMany, HasOne, BelongsTo)
    // NB: (LContext.GetProperties.GetPropertyByName(ARelationPropertyName).GetRelationType = rtNone) perchè altrimenti in alcuni casi particolare dava errori
    LContext.RelationOID := ARelationOID;
    if (ARelationPropertyName <> '') and (ARelationPropertyName <> IO_HASMANY_CHILD_VIRTUAL_PROPERTY_NAME) and (ARelationOID <> 0) and
      (LContext.GetProperties.GetPropertyByName(ARelationPropertyName).GetRelationType = rtNone) then
      LContext.GetProperties.GetPropertyByName(ARelationPropertyName).SetValue(LContext.DataObject, ARelationOID);

    // Detect the persist action type
    _DetectPersistActionType;

{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioCRUDInterceptorsOff}
    // Interceptors: intercept the "before" action
    _Interceptors_InterceptBeforeAction;
    if not LDoneByInterceptor then
    begin
{$ENDIF}
{$ENDREGION}
      // PreProcess (persist) relation childs (BelongsTo)
      PreProcessRelationChildOnPersist(LContext);
      // Process the current object
      // --------------------------
      case LContext.ActionType of
        atInsert:
          InsertObject_Internal(LContext);
        atUpdate:
          UpdateObject_Internal(LContext);
        atDelete:
          begin
            // PreProcess (delete) relation childs (HasMany, HasOne)
            PreProcessRelationChildOnDelete(LContext);
            DeleteObject_Internal(LContext);
          end;
      end;
      // --------------------------
      // PostProcess (persist) relation childs (HasMany, HasOne)
      PostProcessRelationChildOnPersist(LContext);

{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioCRUDInterceptorsOff}
      // Intercept the "after" action
      _Interceptors_InterceptAfterAction;
    end;
{$ENDIF}
{$ENDREGION}
    // Commit
    CommitTransaction(LContext.GetTable.GetConnectionDefName);

  except
    on E: Exception do
    begin
      // Rollback
      RollbackTransaction(LContext.GetTable.GetConnectionDefName);
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioCRUDInterceptorsOff}
      if _Interceptors_InterceptException(E) then
{$ENDIF}
{$ENDREGION}
        raise;
    end;
  end;
end;

class procedure TioPersistenceStrategyDB.PreProcessRelationChildOnDelete(const AMasterContext: IioContext);
var
  LMasterProp: IioProperty;
begin
  inherited;
  // Loop for all properties
  for LMasterProp in AMasterContext.GetProperties do
  begin
    // If the property is not WriteEnabled then skip it
    if not LMasterProp.IsDBWriteEnabled then
      Continue;
    case LMasterProp.GetRelationType of
      // If relation HasMany
      rtHasMany:
        _DoDeleteList(LMasterProp.GetRelationChildObject(AMasterContext.DataObject), AMasterContext.IntentType, AMasterContext.BlindLevel);
      // If relation HasOne
      rtHasOne:
        _DoDeleteObject(LMasterProp.GetRelationChildObject(AMasterContext.DataObject), AMasterContext.IntentType, AMasterContext.BlindLevel);
    end;
  end;
end;

class procedure TioPersistenceStrategyDB.PostProcessRelationChildOnPersist(const AMasterContext: IioContext);
var
  LMasterProp: IioProperty;
begin
  inherited;
  // Loop for all properties
  for LMasterProp in AMasterContext.GetProperties do
  begin
    // If the property is not WriteEnabled then skip it
    if not LMasterProp.IsDBWriteEnabled then
      Continue;
    case LMasterProp.GetRelationType of
      // If relation HasMany
      rtHasMany:
        _DoPersistList(LMasterProp.GetRelationChildObject(AMasterContext.DataObject), AMasterContext.IntentType,
          LMasterProp.GetRelationChildPropertyName, AMasterContext.GetProperties.GetIdProperty.GetValue(AMasterContext.DataObject).AsInteger,
          AMasterContext.MasterBSPersistence, LMasterProp.GetName, AMasterContext.MasterPropertyPath, AMasterContext.BlindLevel);
      // If relation HasOne
      rtHasOne:
        _DoPersistObject(LMasterProp.GetRelationChildObject(AMasterContext.DataObject), AMasterContext.IntentType,
          LMasterProp.GetRelationChildPropertyName, AMasterContext.GetProperties.GetIdProperty.GetValue(AMasterContext.DataObject).AsInteger,
          AMasterContext.MasterBSPersistence, LMasterProp.GetName, AMasterContext.MasterPropertyPath, AMasterContext.BlindLevel);
    end;
  end;
end;

class procedure TioPersistenceStrategyDB.PreProcessRelationChildOnPersist(const AMasterContext: IioContext);
// ar
// LMasterProp: IioProperty;
begin
  // inherited;
  // // Loop for all properties
  // for LMasterProp in AMasterContext.GetProperties do
  // // If the property is write enabled and has a BelongsTo relation...
  // if LMasterProp.IsDBWriteEnabled and (LMasterProp.GetRelationType = rtBelongsTo) then
  // PersistObject(LMasterProp.GetRelationChildObject(AMasterContext.DataObject), '', 0, False, AMasterContext.MasterBSPersistence, LMasterProp.GetName,
  // AMasterContext.MasterPropertyPath);
end;

class procedure TioPersistenceStrategyDB.RollbackTransaction(const AConnectionName: String);
begin
  inherited;
  TioDBFactory.Connection(AConnectionName).Rollback;
end;

class procedure TioPersistenceStrategyDB.SQLDest_Execute(const ASQLDestination: IioSQLDestination);
var
  LQry: IioQuery;
begin
  inherited;
  // Start transaction
  io.StartTransaction(ASQLDestination.GetConnectionDefName);
  try
    // Get the query object
    LQry := TioDBFactory.Query(ASQLDestination.GetConnectionDefName);
    // Set the SQL command text
    LQry.SQL.Text := ASQLDestination.GetSQL;
    LQry.ExecSQL;
    // Commit
    io.CommitTransaction(ASQLDestination.GetConnectionDefName);
  except
    // Rollback
    io.RollbackTransaction(ASQLDestination.GetConnectionDefName);
    raise;
  end;
end;

class procedure TioPersistenceStrategyDB.SQLDest_LoadDataSet(const ASQLDestination: IioSQLDestination; const ADestDataSet: TFDDataSet);
var
  LQry: IioQuery;
begin
  inherited;
  // Start transaction
  io.StartTransaction(ASQLDestination.GetConnectionDefName);
  try
    // Get the query object
    LQry := TioDBFactory.Query(ASQLDestination.GetConnectionDefName);
    // Set the SQL command text
    LQry.SQL.Text := ASQLDestination.GetSQL;
    LQry.GetQuery.FetchOptions.Unidirectional := False;
    LQry.Open;
    try
      LQry.GetQuery.FetchAll;
      // Copy data to the MemoryTable
      ADestDataSet.Data := LQry.GetQuery.Data;
      ADestDataSet.First;
    finally
      LQry.Close;
    end;
    // Commit
    io.CommitTransaction(ASQLDestination.GetConnectionDefName);
  except
    // Rollback
    io.RollbackTransaction(ASQLDestination.GetConnectionDefName);
    raise;
  end;
end;

class procedure TioPersistenceStrategyDB.StartTransaction(const AConnectionName: String);
begin
  inherited;
  TioDBFactory.Connection(AConnectionName).StartTransaction;
end;

class procedure TioPersistenceStrategyDB.LoadDataSet(const AWhere: IioWhere; const ADestDataSet: TFDDataSet);
var
  LResolvedTypeList: IioResolvedTypeList;
  LResolvedTypeName: String;
  LContext: IioContext;
  LTransactionCollection: IioTransactionCollection;
  // Nested
  procedure NestedLoadToMemTable;
  var
    LQry: IioQuery;
  begin
    // Create & open query
    LQry := TioDBFactory.QueryEngine.GetQuerySelectList(LContext);
    LQry.Open;
    try
      // Copy data to the MemoryTable
      // NB: Per poter fare in modo che i dati rimangano anche con più passaggi
      // successivi in base a quante classi implementano l'interfaccia che si sta
      // caricando (se si tratta di un'interfaccia ovviamente) ho dovuto implementare due chiamate
      // differenti a CopyDataSet perchè se mantenevo l'opzione 'coStructure' ogni volta azzerava
      // i records e quindi la prima volta la eseguq con lìopzione sopra citata mentre le volte successive no.
      // Per sapere se è il primo passaggio verifico se la MemTable.Active = True perchè ho notato che al primo
      // passaggio la attiva automaticamente.
      if ADestDataSet.FieldCount > 0 then
      begin
        if not ADestDataSet.Active then
          ADestDataSet.Open;
        ADestDataSet.CopyDataSet(LQry.GetQuery, [coAppend])
      end
      else
        ADestDataSet.CopyDataSet(LQry.GetQuery, [coStructure, coAppend]);
    finally
      LQry.Close;
    end;
  end;

begin
  inherited;
  // Resolve the type and alias
  LResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(AWhere.TypeName, AWhere.TypeAlias, rmAllDistinctByConnectionAndTable);
  // Get the transaction collection
  LTransactionCollection := TioDBFactory.TransactionCollection;
  try
    // Loop for all classes in the sesolved type list
    for LResolvedTypeName in LResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      LContext := TioContextFactory.Context(itRegular, LResolvedTypeName, AWhere, nil, nil, '', '', BL_DEFAULT);
      // If the object is of a class mapped as NotPersisted then skip it
      if LContext.Map.GetTable.IsNotPersistedEntity then
        Continue;
      // Start transaction
      LTransactionCollection.StartTransaction(LContext.GetTable.GetConnectionDefName);
      // Load the current class data into the list
      NestedLoadToMemTable;
    end;
    // Commit ALL transactions
    LTransactionCollection.CommitAll;
  except
    // Rollback ALL transactions
    LTransactionCollection.RollbackAll;
    raise;
  end;
end;

class procedure TioPersistenceStrategyDB._DoLoadList(const AWhere: IioWhere; const AList: TObject; const AIntent: TioPersistenceIntentType);
var
  LResolvedTypeList: IioResolvedTypeList;
  LResolvedTypeName: String;
  LOriginalContext: IioContext;
  LContextCache: IioContextCache;
  LTransactionCollection: IioTransactionCollection;
  LDuckTypedList: IioDuckTypedList;
  // Nested
  procedure NestedLoadToList;
  var
    LQuery: IioQuery;
    LObj: TObject;
    LCurrentContext: IioContext;
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioCRUDInterceptorsOff}
    LDoneByInterceptor: Boolean;
{$ENDIF}
{$ENDREGION}
  begin
    // NB: Se TrueClassMode = tcSmart in pratica LCurrentContext ora contiene la VirtualMap (o SuperMap) e la usa per
    // creare il codice SQL della query poi, una volta aperta la query, inizia a ciclare per tutti i record/oggetti
    // trovati dalla query stessa e per ognuno di essi si fa dare la mappa/context specifica della classe specifica
    // dell'oggetto corrente.
    // Create & open query
    LQuery := TioDBFactory.QueryEngine.GetQuerySelectList(LOriginalContext);
    LQuery.Open;
    try
      try
        // Loop for all records (objects) of the query
        while not LQuery.Eof do
        begin
          // If TrueClassMode is tvSmart then get the specific context for the current record/object else
          // use the original context
          if LOriginalContext.GetTrueClass.Mode = tcSmart then
            LCurrentContext := LContextCache.GetContext(AIntent, LQuery.ExtractTrueClassName(LOriginalContext), AWhere, BL_DEFAULT)
          else
            LCurrentContext := LOriginalContext;
          // Clean the DataObject (it contains the previous)
          LCurrentContext.DataObject := nil;
          // Create the object as TObject  (Intercepted by CRUDInterceptors)
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioCRUDInterceptorsOff}
          LDoneByInterceptor := False;
          LObj := TioCRUDInterceptorRegister.BeforeLoad(LCurrentContext, nil, LDoneByInterceptor);
          LCurrentContext.DataObject := LObj;
          if not LDoneByInterceptor then
          begin
{$ENDIF}
{$ENDREGION}
            LObj := TioObjectMakerFactory.GetObjectMaker(LCurrentContext).MakeObject(LCurrentContext, LQuery);
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioCRUDInterceptorsOff}
            LObj := TioCRUDInterceptorRegister.AfterLoad(LCurrentContext, LObj);
          end;
{$ENDIF}
{$ENDREGION}
          // Add current object to the list
          LDuckTypedList.Add(LObj);
          // Next
          LQuery.Next;
        end;
      finally
        // Close query
        LQuery.Close;
      end;
    except
      on E: Exception do
      begin
        // Note: Rollback in the except section of the main method (_DoLoadList)s
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioCRUDInterceptorsOff}
        if TioCRUDInterceptorRegister.OnLoadException(LCurrentContext, E) then
{$ENDIF}
{$ENDREGION}
          raise;
      end;
    end;
  end;

begin
  inherited;
  // Resolve the type and alias
  LResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(AWhere.TypeName, AWhere.TypeAlias, rmAllDistinctByConnectionAndTable);
  // Wrap the list into a DuckTypedList
  LDuckTypedList := TioDuckTypedFactory.DuckTypedList(AList);
  // Create the IioContext cache (optimization)
  LContextCache := TioContextCache.Create;
  // Get the transaction collection
  LTransactionCollection := TioDBFactory.TransactionCollection;
  try
    // Loop for all classes in the resolved type list
    for LResolvedTypeName in LResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      LOriginalContext := TioContextFactory.TrueClassVirtualContextIfEnabled(AIntent, LResolvedTypeName, AWhere, BL_DEFAULT);
      // If the object is of a class mapped as NotPersisted then skip it
      if LOriginalContext.Map.GetTable.IsNotPersistedEntity then
        Continue;
      // Start transaction
      LTransactionCollection.StartTransaction(LOriginalContext.GetTable.GetConnectionDefName);
      // Load the current class data into the list
      NestedLoadToList;
    end;
    // Commit ALL transactions
    LTransactionCollection.CommitAll;
  except
    // Rollback ALL transactions
    LTransactionCollection.RollbackAll;
    raise;
  end;
end;

class function TioPersistenceStrategyDB._DoLoadObject(const AWhere: IioWhere; const AObj: TObject; const AIntent: TioPersistenceIntentType): TObject;
var
  LResolvedTypeList: IioResolvedTypeList;
  LResolvedTypeName: String;
  LOriginalContext: IioContext;
  LTransactionCollection: IioTransactionCollection;
  // Nested
  function NestedLoadToObject: TObject;
  var
    LQuery: IioQuery;
    LCurrentContext: IioContext;

{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioCRUDInterceptorsOff}
    LDoneByInterceptor: Boolean;
{$ENDIF}
{$ENDREGION}
  begin
    // Init
    Result := AObj;
    // Create & open query
    LQuery := TioDBFactory.QueryEngine.GetQuerySelectObject(LOriginalContext);
    LQuery.Open;
    try
      try
        // If a record is found then load the object and return True
        if not LQuery.Eof then
        begin
          // If TrueClassMode is tvSmart then get the specific context for the current record/object else
          // use the original context
          if LOriginalContext.GetTrueClass.Mode = tcSmart then
            LCurrentContext := TioContextFactory.Context(AIntent, LQuery.ExtractTrueClassName(LOriginalContext), AWhere, Result, nil, '', '', BL_DEFAULT)
          else
            LCurrentContext := LOriginalContext;
          // Create the object as TObject (Intercepted by CRUDInterceptors)

{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioCRUDInterceptorsOff}
          LDoneByInterceptor := False;
          Result := TioCRUDInterceptorRegister.BeforeLoad(LCurrentContext, Result, LDoneByInterceptor);
          LCurrentContext.DataObject := Result;
          if not LDoneByInterceptor then
          begin
{$ENDIF}
{$ENDREGION}
            Result := TioObjectMakerFactory.GetObjectMaker(LCurrentContext).MakeObject(LCurrentContext, LQuery);

{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioCRUDInterceptorsOff}
            Result := TioCRUDInterceptorRegister.AfterLoad(LCurrentContext, Result);
          end;
{$ENDIF}
{$ENDREGION}
        end;
      finally
        // Close query
        LQuery.Close;
      end;
    except
      on E: Exception do
      begin
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioCRUDInterceptorsOff}
        if TioCRUDInterceptorRegister.OnLoadException(LCurrentContext, E) then
{$ENDIF}
{$ENDREGION}
          raise;
      end;
    end;
  end;

begin
  inherited;
  Result := nil;
  // Resolve the type and alias
  LResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(AWhere.TypeName, AWhere.TypeAlias, rmAllDistinctByConnectionAndTable);
  // Get the transaction collection
  LTransactionCollection := TioDBFactory.TransactionCollection;
  try
    // Loop for all classes in the sesolved type list
    for LResolvedTypeName in LResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      LOriginalContext := TioContextFactory.TrueClassVirtualContextIfEnabled(AIntent, LResolvedTypeName, AWhere, BL_DEFAULT);
      // If the object is of a class mapped as NotPersisted then skip it
      if LOriginalContext.Map.GetTable.IsNotPersistedEntity then
        Continue;
      // Start transaction
      LTransactionCollection.StartTransaction(LOriginalContext.GetTable.GetConnectionDefName);
      // Load the current class object is founded
      Result := NestedLoadToObject;
      // If there is a result (an object) then exit;
      if Assigned(Result) then
        Break;
    end;
    // Commit ALL transactions
    LTransactionCollection.CommitAll;
  except
    // Rollback ALL transactions
    LTransactionCollection.RollbackAll;
    raise;
  end;
end;

class procedure TioPersistenceStrategyDB.UpdateObject_Internal(const AContext: IioContext);
var
  LQuery: IioQuery;
begin
  inherited;
  // Conflict strategy: check if there is a persistence conflict or prepare the where object of the context
  // to consider the version property (or some other property useful for conflict detection)
  if AContext.BlindLevel_Do_DetectConflicts then
    AContext.CheckUpdateConflict(AContext);
  // Create and execute the query to update the entity on DB cheking the version to avoid concurrency
  // conflict (if versioning is enabled for this type of entity)
  if not AContext.ConflictDetected then
  begin
    LQuery := TioDBFactory.QueryEngine.GetQueryUpdate(AContext);
    AContext.ConflictDetected := LQuery.ExecSQL = 0;
  end;
  // Conflict strategy: if a conclict is detected then resolve it
  // note: if the ConflictStrategy resolves the conflict then it must try to run the query again
  // but without checking the ObjVersion (otherwise it would obviously fail again)
  if AContext.ConflictDetected then
  begin
    AContext.ResolveUpdateConflict(AContext);
    if AContext.ConflictState = csResolved then
    begin
      AContext.BlindLevel_Reset_DetectConflicts;
      TioDBFactory.QueryEngine.GetQueryUpdate(AContext).ExecSQL;
    end;
  end;
  // If there is no conflict or there is a conflict but it has been resolved…
  if AContext.BlindLevel_Do_AutoUpdateProps and ((not AContext.ConflictDetected) or (AContext.ConflictState <= csResolved)) then
  begin
    AContext.ObjVersion := AContext.ObjNextVersion;
    AContext.ObjUpdated := LQuery.Connection.LastTransactionTimestamp;;
    AContext.ObjUpdatedUserID := TioConnectionManager.GetCurrentConnectionInfo.CurrentUserID;
    AContext.ObjUpdatedUserName := TioConnectionManager.GetCurrentConnectionInfo.CurrentUserName;
    AContext.ObjStatus := osClean;
  end;
end;

{ TioContextCache }

constructor TioContextCache.Create;
begin
  FContainer := TDictionary<String, IioContext>.Create;
end;

destructor TioContextCache.Destroy;
begin
  FContainer.Free;
  inherited;
end;

function TioContextCache.GetContext(const AIntent: TioPersistenceIntentType; const AClassName: String; const AWhere: IioWhere; const ABlindLevel: Byte): IioContext;
begin
  // If the map is not already present in the cache then create and add it
  if not FContainer.ContainsKey(AClassName) then
    FContainer.Add(AClassName, TioContextFactory.Context(AIntent, AClassName, AWhere, nil, nil, '', '', ABlindLevel));
  // Return the requested context and set its DataObject to nil
  Result := FContainer.Items[AClassName];
  Result.DataObject := nil;
end;

end.
