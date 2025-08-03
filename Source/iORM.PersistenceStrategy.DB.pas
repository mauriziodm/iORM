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
  iORM.LiveBindings.BSPersistence, iORM.CommonTypes,
  iORM.SynchroStrategy.Custom,
  iORM.PersistenceStrategy.Interfaces;

type

  // Strategy class for database
  TioPersistenceStrategyDB = class(TioPersistenceStrategyIntf)
  private
    // persistence internal
    class procedure InsertObject_Internal(const AContext: IioContext);
    class procedure UpdateObject_Internal(const AContext: IioContext);
    class procedure DeleteObject_Internal(const AContext: IioContext);
    // pre-process post-process internal
    class procedure PreProcessRelationChildOnDelete(const AMasterContext: IioContext);
    class procedure PreProcessRelationChildOnPersist(const AMasterContext: IioContext);
    class procedure PostProcessRelationChildOnPersist(const AMasterContext: IioContext);
    // transactions internal
    class procedure StartTransaction_Internal(const AConnectionName: String); static; inline;
    class procedure CommitTransaction_Internal(const AConnectionName: String); static; inline;
    class procedure RollbackTransaction_Internal(const AConnectionName: String); static; inline;
    class function InTransaction_Internal(const AConnectionName: String): Boolean; static; inline;
    // other internal
    class function ObjectExists(const AContext: IioContext): Boolean;
    class function LoadObjVersion_FromEntity_Internal(const AContext: IioContext): Integer;
    class function LoadObjVersion_FromETM_Internal(const AContext: IioContext): Integer;
  protected
    // ========== BEGIN OF METHODS TO BE OVERRIDED FROM CONCRETE PERSISTENCE STRATEGIES ==========
    // Persistence
    // ---------- Begin intercepted methods (CRUD Interceptors) ----------
    class procedure _DoDeleteList(const APSRequest: IioPersistenceStrategyRequest); override;
    class procedure _DoDeleteObject(const APSRequest: IioPersistenceStrategyRequest); override;
    class procedure _DoLoadList(const APSRequest: IioPersistenceStrategyRequest); override;
    class procedure _DoLoadObject(const APSRequest: IioPersistenceStrategyRequest); override;
    class procedure _DoPersistList(const APSRequest: IioPersistenceStrategyRequest); override;
    class procedure _DoPersistObject(const APSRequest: IioPersistenceStrategyRequest); override;
    // ---------- End intercepted methods (CRUD Interceptors) ----------
    class procedure _DoDelete(const APSRequest: IioPersistenceStrategyRequest); override;
    class procedure _DoLoadCount(const APSRequest: IioPersistenceStrategyRequest); override;
    class procedure _DoLoadDataSet(const APSRequest: IioPersistenceStrategyRequest); override;
    class procedure _DoLoadMax(const APSRequest: IioPersistenceStrategyRequest); override;
    class procedure _DoLoadMin(const APSRequest: IioPersistenceStrategyRequest); override;
    class procedure _DoLoadObjectByClassOnly(const APSRequest: IioPersistenceStrategyRequest); override;
    class function _DoLoadObjVersion(const AContext: IioContext): Integer; override;
    // Transaction
    class procedure _DoStartTransaction(const APSRequest: IioPersistenceStrategyRequest); override;
    class procedure _DoCommitTransaction(const APSRequest: IioPersistenceStrategyRequest); override;
    class procedure _DoRollbackTransaction(const APSRequest: IioPersistenceStrategyRequest); override;
    class procedure _DoInTransaction(const APSRequest: IioPersistenceStrategyRequest); override;
    // SynchroStrategy
    class procedure _DoSynchronization(const APSRequest: IioPersistenceStrategyRequest); override;
    // SQLDestinations
    class procedure _DoSQLDest_LoadDataSet(const APSRequest: IioPersistenceStrategyRequest); override;
    class procedure _DoSQLDest_Execute(const APSRequest: IioPersistenceStrategyRequest); override;
    // ========== END OF METHODS TO BE OVERRIDED FROM CONCRETE PERSISTENCE STRATEGIES ==========
  end;

implementation

uses
  iORM.Context.Factory, iORM.Attributes,
  iORM.DB.ConnectionContainer, iORM.DB.Factory, iORM.DuckTyped.Interfaces,
  iORM.DuckTyped.Factory, iORM.Resolver.Interfaces, iORM.ObjectsForge.Factory,
  iORM.Resolver.Factory,
  iORM, System.SysUtils, System.Generics.Collections,
  iORM.Interceptor.CRUD.Register,
  iORM.PersistenceStrategy.Factory,
  iORM.Abstraction;

type

  IioContextCache = interface
    ['{FAFBB27B-3E84-4D23-8801-3C863FA3556B}']
    function GetContext(const APSRequest: IioPersistenceStrategyRequest; const AClassName: String): IioContext;
//    function GetContext(const AIntent: TioPersistenceIntentType; const AClassName: String; const AWhere: IioWhere; const ABlindLevel: Byte; const ASessionData: IioSessionData): IioContext;
  end;

  TioContextCache = class(TInterfacedObject, IioContextCache)
  strict private
    FContainer: TDictionary<String, IioContext>;
  public
    constructor Create;
    destructor Destroy; override;
    function GetContext(const APSRequest: IioPersistenceStrategyRequest; const AClassName: String): IioContext;
//    function GetContext(const AIntent: TioPersistenceIntentType; const AClassName: String; const AWhere: IioWhere; const ABlindLevel: Byte; const ASessionData: IioSessionData): IioContext;
  end;

{ TioStrategyDB }

class procedure TioPersistenceStrategyDB._DoCommitTransaction(const APSRequest: IioPersistenceStrategyRequest);
begin
  CommitTransaction_Internal(APSRequest.Connection);
end;

class procedure TioPersistenceStrategyDB._DoLoadCount(const APSRequest: IioPersistenceStrategyRequest);
var
  LResolvedTypeList: IioResolvedTypeList;
  LResolvedTypeName: String;
  LContext: IioContext;
  LTransactionCollection: IioTransactionCollection;
  // Nested
  procedure NestedCount;
  var
    AQuery: IioQuery;
  begin
    AQuery := TioDBFactory.QueryEngine.GetQueryCount(LContext);
    AQuery.Open;
    try
      APSRequest.ResultAsInteger := APSRequest.ResultAsInteger + AQuery.Fields[0].AsInteger;
    finally
      AQuery.Close;
    end;
  end;

begin
  inherited;
  // Resolve the type and alias
  LResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(APSRequest.Where.TypeName, APSRequest.Where.TypeAlias, rmAllDistinctByConnectionAndTable);
  // Get the transaction collection
  LTransactionCollection := TioDBFactory.TransactionCollection;
  try
    // Loop for all classes in the sesolved type list
    for LResolvedTypeName in LResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      LContext := TioContextFactory.Context_PSRequest(APSRequest, LResolvedTypeName);
      LContext.ActionType := atSelect;
      // If the object is of a class mapped as NotPersisted then continue
      if LContext.Map.GetTable.IsNotPersistedEntity then
        Exit;
      // Start transaction
      LTransactionCollection.StartTransaction(LContext.ConnectionNameResolved);
      // Get the count value for the current resolved type
      NestedCount;
    end;
    // Commit ALL transactions
    LTransactionCollection.CommitAll;
  except
    // Rollback ALL transactions
    LTransactionCollection.RollbackAll;
    raise;
  end;
end;

class procedure TioPersistenceStrategyDB._DoDelete(const APSRequest: IioPersistenceStrategyRequest);
var
  LResolvedTypeList: IioResolvedTypeList;
  LResolvedTypeName: String;
  LContext: IioContext;
  LTransactionCollection: IioTransactionCollection;
  // Nested
  procedure NestedDelete;
  var
    LQuery: IioQuery;
  begin
    // Create & execute query
    LQuery := TioDBFactory.QueryEngine.GetQueryDelete(LContext, False);
    LQuery.ExecSQL;
  end;

begin
  // Resolve the type and alias
  LResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(APSRequest.Where.TypeName, APSRequest.Where.TypeAlias, rmAllDistinctByConnectionAndTable);
  // Get the transaction collection
  LTransactionCollection := TioDBFactory.TransactionCollection;
  try
    // Loop for all classes in the sesolved type list
    for LResolvedTypeName in LResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      LContext := TioContextFactory.Context_PSRequest(APSRequest, LResolvedTypeName);
      LContext.ActionType := atDelete;
      // If the object is of a class mapped as NotPersisted then skip it
      if LContext.Map.GetTable.IsNotPersistedEntity then
        Continue;
      // Start transaction
      LTransactionCollection.StartTransaction(LContext.ConnectionNameResolved);
      // Load the current class data into the list
      NestedDelete;
    end;
    // Commit ALL transactions
    LTransactionCollection.CommitAll;
  except
    // Rollback ALL transactions
    LTransactionCollection.RollbackAll;
    raise;
  end;
end;

class procedure TioPersistenceStrategyDB._DoDeleteList(const APSRequest: IioPersistenceStrategyRequest);
var
  LDuckTypedList: IioDuckTypedList;
  LCurrentObj: TObject;
begin
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
// TODO: Probabilmente anche qui dovrei usare una TransactionCollection (come per LoadList e PersistList ad esempio) perchè può riguardare più oggetti mappati anche su connessioni diverse
  _DoStartTransaction(APSRequest);
  try
    // Wrap the DestList into a DuckTypedList
    LDuckTypedList := TioDuckTypedFactory.DuckTypedList(APSRequest.ListDTO);
    // Loop the list and delete objects
// TODO: Vedere se si possono eliminare le variabili LDuckTypedList e LCurrentObj
    for LCurrentObj in LDuckTypedList do
    begin
      // Delete current object
      APSRequest.DTO := LCurrentObj;
      _DoDeleteObject(APSRequest);
    end;
    _DoCommitTransaction(APSRequest);
  except
    _DoRollbackTransaction(APSRequest);
    raise;
  end;
end;

class procedure TioPersistenceStrategyDB._DoDeleteObject(const APSRequest: IioPersistenceStrategyRequest);
var
  LContext: IioContext;
begin
  // Check
  if not Assigned(APSRequest.DTO) then
    Exit;
  // Create Context (Create a dummy ioWhere first to pass ConnectionName parameter only).
  LContext := TioContextFactory.Context_PSRequest(APSRequest, APSRequest.DTO.ClassName);
  LContext.ActionType := atDelete;
  // If the object is of a class mapped as NotPersisted then exit
  if LContext.Map.GetTable.IsNotPersistedEntity then
    Exit;
  // Start transaction
  StartTransaction_Internal(LContext.ConnectionNameResolved);
  try
    // access-token validation
    // note: The anonymous method of type "TioTokenValidateMethod" can return true or false
    //        to authorize or not the operation to be performed. But be careful, if the operation
    //        is not authorized simply returning false will not raise any exception so the operation
    //        will not be performed but the user will probably not notice the lack of authorization;
    //        If you want to inform the user of the failed authorization, you need to raise an exception
    //        within the annoying method itself (TioTokenValidateMethod).
    LContext.PSRequest.ForceAuthDecision := LContext.IDIsNull;
    if TioApplication.ProvideAuthDecisionCRUD(LContext as IioAuthDecisionRequest) then
    begin
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioCRUDInterceptorsOff}
      if not TioCRUDInterceptorRegister.BeforeDelete(LContext) then
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
    end;
    // Commit
    CommitTransaction_Internal(LContext.ConnectionNameResolved);
  except
    on E: Exception do
    begin
      // Rollback
      RollbackTransaction_Internal(LContext.ConnectionNameResolved);
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioCRUDInterceptorsOff}
      if TioCRUDInterceptorRegister.OnDeleteException(LContext, E) then
{$ENDIF}
{$ENDREGION}
        raise;
    end;
  end;
end;

class procedure TioPersistenceStrategyDB.CommitTransaction_Internal(const AConnectionName: String);
begin
  TioDBFactory.Connection(AConnectionName).Commit;
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
    AContext.CheckDeleteConflict;
  // Create and execute the query to delete the entity on DB cheking the version to avoid concurrency
  // conflict (if versioning is enabled for this type of entity)
  if not AContext.ConflictDetected then
  begin
    LQuery := TioDBFactory.QueryEngine.GetQueryDelete(AContext, AContext.BlindLevel_Do_DetectConflicts);
    AContext.ConflictDetected := (LQuery.ExecSQL = 0) and AContext.BlindLevel_Do_DetectConflicts;
  end;
  // Conflict strategy: if a conclict is detected then resolve it
  // note: if the ConflictStrategy resolves the conflict then it must try to run the query again
  // but without checking the ObjVersion (otherwise it would obviously fail again)
  if AContext.ConflictDetected then
  begin
    AContext.ResolveDeleteConflict;
    if AContext.ConflictState = csResolved then
    begin
      AContext.BlindLevel_Reset_DetectConflicts;
      TioDBFactory.QueryEngine.GetQueryDelete(AContext, True).ExecSQL;
    end;
  end;
end;

class procedure TioPersistenceStrategyDB._DoSynchronization(const APSRequest: IioPersistenceStrategyRequest);
var
  LPayload: TioCustomSynchroStrategy_Payload;
begin
  LPayload := APSRequest.Obj1 as TioCustomSynchroStrategy_Payload;
  LPayload.Initialize;
  LPayload.LoadFromClient;
  LPayload.PersistAndReloadFromServer;
  LPayload.PersistToClient;
  LPayload.Finalize;
end;

class procedure TioPersistenceStrategyDB.InsertObject_Internal(const AContext: IioContext);
var
  LQuery: IioQuery;
begin
  inherited;
  // -----------------------------------------------------------
  // Detection and resolution of any conflicts (if not disabled by BlindLevel).
  // Conflict strategy: check if there is a persistence conflict
  if AContext.BlindLevel_Do_DetectConflicts then
    AContext.CheckInsertConflict;
  // Conflict strategy: if a conclict is detected then resolve it
  if AContext.ConflictDetected then
  begin
    AContext.ResolveInsertConflict;
    if AContext.ConflictState > csResolved then // if Rejected or RejectedRaise
      Exit;
  end;
  // -----------------------------------------------------------
  // If a SynchroStrategy is assigned and active (local remote and not connected device) and the object ID
  // is not assigned then it asks the SynchroStrategy for a temporary local ID.
  // Note: Obviously if a new ID is assigned by SynchroStrategy this will disable the normal ID generation (if generated ID is not NULL)
  AContext.SynchroStrategy_GenerateLocalID;
  // -----------------------------------------------------------
  // Get and execute a query to retrieve the next ID for the inserting object
  // before the insert query (for Firebird/Interbase)
  // Note: If KeyGenerationTime = kgtBeforeInsert and the ID is not assigned then I always request
  // a new ID even if the BlindLevel is set to disable the assignment to the object,
  // this is because the ID MUST be assigned (always if it is null)
  // otherwise the object would persist on the DB with ID zero.
  if (TioConnectionManager.GetConnectionInfo(AContext.GetTable.GetTableConnectionName).KeyGenerationTime = kgtBeforeInsert) and AContext.IDIsNull then
  begin
    LQuery := TioDBFactory.QueryEngine.GetQueryNextID(AContext);
    try
      LQuery.Open;
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
    AContext.ObjCreatedUserID := AContext.PSREquest.UsrOID;
    AContext.ObjCreatedUserName := AContext.PSREquest.Usr;
    AContext.ObjUpdated := LQuery.Connection.LastTransactionTimestamp;
    AContext.ObjUpdatedUserID := AContext.PSREquest.UsrOID;
    AContext.ObjUpdatedUserName := AContext.PSREquest.Usr;
  end;
  // -----------------------------------------------------------
  // Get and execute a query to retrieve the last ID generated
  // in the last insert query.
  // Note: If KeyGenerationTime = kgtAfterInsert and the ID is not assigned then it requests a new ID
  // only if the BlindLevel enables reloading of the assigned ID or if the object contains at least
  // one property with a HasMany or HasOne relation.
  if (TioConnectionManager.GetConnectionInfo(AContext.GetConnectionNameResolved).KeyGenerationTime = kgtAfterInsert) and
    (AContext.BlindLevel_Do_AutoUpdateProps or AContext.GetProperties.ContainsHasManyOrHasOneProperties) and AContext.IDIsNull then
  begin
    LQuery := TioDBFactory.QueryEngine.GetQueryNextID(AContext);
    try
      LQuery.Open;
      AContext.GetProperties.GetIdProperty.SetValue(AContext.DataObject, LQuery.Fields[0].AsInteger);
    finally
      LQuery.Close;
    end;
  end;
  // -----------------------------------------------------------
  AContext.ObjStatus := osClean;
end;

class function TioPersistenceStrategyDB.InTransaction_Internal(const AConnectionName: String): Boolean;
begin
  Result := InTransaction_Internal(AConnectionName);
end;

class procedure TioPersistenceStrategyDB._DoInTransaction(const APSRequest: IioPersistenceStrategyRequest);
begin
  APSRequest.ResultAsBoolean := InTransaction_Internal(APSRequest.Connection);
end;

class procedure TioPersistenceStrategyDB._DoLoadObjectByClassOnly(const APSRequest: IioPersistenceStrategyRequest);
var
  LContext: IioContext;
  LQuery: IioQuery;
begin
  // Get the Context
  LContext := TioContextFactory.Context_PSRequest(APSRequest, APSRequest.Where.TypeName);
  LContext.ActionType := atSelect;
  // If the object is of a class mapped as NotPersisted then skip it
  if LContext.Map.GetTable.IsNotPersistedEntity then
    Exit;
  // Create & open query
  LQuery := TioDBFactory.QueryEngine.GetQuerySelectObject(LContext);
  LQuery.Open;
  try
    // Create the object as TObject
    if not LQuery.IsEmpty then
      TioObjectMakerFactory.GetObjectMaker(LContext).MakeObject(LContext, LQuery);
  finally
    // Close query
    LQuery.Close;
  end;
end;

class function TioPersistenceStrategyDB._DoLoadObjVersion(const AContext: IioContext): Integer;
begin
  // NB: Ho riflettuto bene sul come ottenere l'ultima ObjVersion (la più alta) assegnata
  // per poi aggiungere 1 e ottenere la prossima e ho individuato 2 metodi:
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

class procedure TioPersistenceStrategyDB._DoLoadMax(const APSRequest: IioPersistenceStrategyRequest);
var
  LResolvedTypeList: IioResolvedTypeList;
  LResolvedTypeName: String;
  LContext: IioContext;
  LTransactionCollection: IioTransactionCollection;
  // Nested
  procedure NestedMax;
  var
    LProperty: IioProperty;
    AQuery: IioQuery;
  begin
    LProperty := LContext.GetProperties.GetPropertyByName(APSRequest.PropName, True);
    AQuery := TioDBFactory.QueryEngine.GetQueryMax(LContext, LProperty);
    AQuery.Open;
    try
      if AQuery.Fields[0].AsInteger > APSRequest.ResultAsInteger then
        APSRequest.ResultAsInteger := AQuery.Fields[0].AsInteger;
    finally
      AQuery.Close;
    end;
  end;

begin
  // Resolve the type and alias
  LResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(APSRequest.Where.TypeName, APSRequest.Where.TypeAlias, rmAllDistinctByConnectionAndTable);
  // Get the transaction collection
  LTransactionCollection := TioDBFactory.TransactionCollection;
  try
    // Loop for all classes in the sesolved type list
    for LResolvedTypeName in LResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      LContext := TioContextFactory.Context_PSRequest(APSRequest, LResolvedTypeName);
      LContext.ActionType := atSelect;
      // If the object is of a class mapped as NotPersisted then continue
      if LContext.Map.GetTable.IsNotPersistedEntity then
        Exit;
      // Start transaction
      LTransactionCollection.StartTransaction(LContext.ConnectionNameResolved);
      // Get the count value for the current resolved type
      NestedMax;
    end;
    // Commit ALL transactions
    LTransactionCollection.CommitAll;
  except
    // Rollback ALL transactions
    LTransactionCollection.RollbackAll;
    raise;
  end;
end;

class procedure TioPersistenceStrategyDB._DoLoadMin(const APSRequest: IioPersistenceStrategyRequest);
var
  LResolvedTypeList: IioResolvedTypeList;
  LResolvedTypeName: String;
  LContext: IioContext;
  LTransactionCollection: IioTransactionCollection;
  // Nested
  procedure NestedMin;
  var
    LProperty: IioProperty;
    AQuery: IioQuery;
  begin
    LProperty := LContext.GetProperties.GetPropertyByName(APSRequest.PropName, True);
    AQuery := TioDBFactory.QueryEngine.GetQueryMin(LContext, LProperty);
    AQuery.Open;
    try
      if AQuery.Fields[0].AsInteger < APSRequest.ResultAsInteger then
        APSRequest.ResultAsInteger := AQuery.Fields[0].AsInteger;
    finally
      AQuery.Close;
    end;
  end;

begin
  // Resolve the type and alias
  LResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(APSRequest.Where.TypeName, APSRequest.Where.TypeAlias, rmAllDistinctByConnectionAndTable);
  // Get the transaction collection
  LTransactionCollection := TioDBFactory.TransactionCollection;
  try
    // Loop for all classes in the sesolved type list
    for LResolvedTypeName in LResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      LContext := TioContextFactory.Context_PSRequest(APSRequest, LResolvedTypeName);
      LContext.ActionType := atSelect;
      // If the object is of a class mapped as NotPersisted then continue
      if LContext.Map.GetTable.IsNotPersistedEntity then
        Exit;
      // Start transaction
      LTransactionCollection.StartTransaction(LContext.ConnectionNameResolved);
      // Get the count value for the current resolved type
      NestedMin;
    end;
    // Commit ALL transactions
    LTransactionCollection.CommitAll;
  except
    // Rollback ALL transactions
    LTransactionCollection.RollbackAll;
    raise;
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

class procedure TioPersistenceStrategyDB._DoPersistList(const APSRequest: IioPersistenceStrategyRequest);
var
  LDuckTypedList: IioDuckTypedList;
  LCurrentObj: TObject;
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
// TODO: Probabilmente anche qui dovrei usare una TransactionCollection (come per LoadList e PersistList ad esempio) perchè può riguardare più oggetti mappati anche su connessioni diverse
  _DoStartTransaction(APSRequest);
  try
    // Wrap the DestList into a DuckTypedList
    LDuckTypedList := TioDuckTypedFactory.DuckTypedList(APSRequest.ListDTO);
    // Loop the list
// TODO: Vedere se si possono eliminare le variabili LDuckTypedList e LCurrentObj
    for LCurrentObj in LDuckTypedList do
    begin
      APSRequest.DTO := LCurrentObj;
      _DoPersistObject(APSRequest);
    end;
    _DoCommitTransaction(APSRequest);
  except
    _DoRollbackTransaction(APSRequest);
    raise;
  end;
end;

class procedure TioPersistenceStrategyDB._DoPersistObject(const APSRequest: IioPersistenceStrategyRequest);
var
  LContext: IioContext;
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioCRUDInterceptorsOff}
  function _Interceptors_InterceptBeforeAction: Boolean;
  begin
    case LContext.ActionType of
      atUpdate:
        Result := TioCRUDInterceptorRegister.BeforeUpdate(LContext);
      atInsert:
        Result := TioCRUDInterceptorRegister.BeforeInsert(LContext);
      atDelete:
        Result := TioCRUDInterceptorRegister.BeforeDelete(LContext);
    else
      Result := False;
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
    // If the ObjStatus is osDirty (or not exists) or IntentType is for revert or synchro operation then persist the object
    if (LContext.ObjStatus = osDirty) or (LContext.Intent > itRegular) then
    begin
      // note: if SmartUpdateDetection system is not enabled or (if enabled) the object is to be persisted (according to the SmartUpdateDetection system)...
      if LContext.GetProperties.ObjStatusPropertyExist or (APSRequest.MasterBSPersistence = nil) or (not APSRequest.MasterBSPersistence.IsSmartUpdateDetectionEnabled) or
        APSRequest.MasterBSPersistence.SmartUpdateDetection.IsToBePersisted(APSRequest.DTO, LContext.MasterPropertyPath) then
      begin
        // old code: if (AContext.GetProperties.GetIdProperty.GetValue(AContext.DataObject).AsInteger <> IO_INTEGER_NULL_VALUE)
        if LContext.IDIsNull or (LContext.BlindLevel_Do_DetectObjExists and not ObjectExists(LContext)) then
          LContext.ActionType := atInsert
        else
          LContext.ActionType := atUpdate;
      end;
    end
    // Else if ObjStatus is osDelete then delete the obj
    // Mauri 18/07/2024: Verificando su una app. che stava facendo Omar Bossoni dove aveva il problema che mettendo l'ObjStatus
    //                    degli oggetti di dettaglio di una relazione HasMany a osDelete poi quando si chiamava il Persist non venivano
    //                    eliminati, ho visto che (forse per mio errore) nelle righe sotto se l'ObjStatus rilevato era appunto
    //                    osDeleted non impostava LContext.ActionType a atDelete bensì a atDoNotPersist. Solo che non sono sicuro che sia
    //                    un errore quanto invece mi sembra di ricordare di avere fatto una modifica del genere che o è andata perduta
    //                    oppure in qualche caso particolare (delete da BindSource?) andata settato così altrimenti dava problemi.
    //                    Quindi ora lo metto a atDelete perchè è più sensato e risolve il problema di Omar ma scrivo questo commento
    //                    così ricordo il caso.
    else if LContext.ObjStatus = osDeleted then
      LContext.ActionType := atDelete;
  end;

begin
  // Check
  if not Assigned(APSRequest.DTO) then
    Exit;
  // Create Context
  LContext := TioContextFactory.Context_PSRequest(APSRequest, APSRequest.DTO.ClassName);
  // If the object is of a class mapped as NotPersisted then exit
  if LContext.Map.GetTable.IsNotPersistedEntity then
    Exit;
  // Start transaction
  StartTransaction_Internal(LContext.ConnectionNameResolved);
  try
    // Set/Update MasterID property if this is a relation child object (HasMany, HasOne, BelongsTo)
    // NB: (LContext.GetProperties.GetPropertyByName(ARelationPropertyName).GetRelationType = rtNone) perchè altrimenti in alcuni casi particolare dava errori
    if (APSRequest.RelationPropName <> '') and (APSRequest.RelationPropName <> IO_HASMANY_CHILD_VIRTUAL_PROPERTY_NAME) and (APSRequest.RelationOID <> 0) and
      (LContext.GetProperties.GetPropertyByName(APSRequest.RelationPropName).GetRelationType = rtNone) then
      LContext.GetProperties.GetPropertyByName(APSRequest.RelationPropName).SetValue(LContext.DataObject, APSRequest.RelationOID);
    // Detect the persist action type
    _DetectPersistActionType;
    // access-token validation
    // note: The anonymous method of type "TioTokenValidateMethod" can return true or false
    //        to authorize or not the operation to be performed. But be careful, if the operation
    //        is not authorized simply returning false will not raise any exception so the operation
    //        will not be performed but the user will probably not notice the lack of authorization;
    //        If you want to inform the user of the failed authorization, you need to raise an exception
    //        within the annoying method itself (TioTokenValidateMethod).
    if TioApplication.ProvideAuthDecisionCRUD(LContext as IioAuthDecisionRequest) then
    begin
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioCRUDInterceptorsOff}
      // Interceptors: intercept the "before" action
      if not _Interceptors_InterceptBeforeAction then
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
    end;
    // Commit
    CommitTransaction_Internal(LContext.ConnectionNameResolved);
  except
    on E: Exception do
    begin
      // Rollback
      RollbackTransaction_Internal(LContext.ConnectionNameResolved);
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
  LChildPSRequest: IioPersistenceStrategyRequest;
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
      // TODO: Non sono sicuro che così vada bene perchè in questo modo elimina gli oggetti child presenti attualmente nella lista
      // quindi se prima di aver chiamato il DELETE avessi eliminato qualche oggetto child della lista stessa da codice
      // (quindi non dal binding che ha un meccanismo dedicato) questo oggetto che ho eliminato dalla lista ma che magari
      // non ho candellato dal DB non verrebbe eliminato apppunto dal DM. Quindi mi rimane il dubbio (anche in altre parti)
      // che non sia meglio fare un DELETE di quelli non con gli oggetti in modo da eliminare tutti i child direttamente
      // sul DB senza passare dagli oggetti (però questo salterebbe ETM ad esempio); oppure ancora fare prima un reload
      // di tutti gli oggetti child e poi eliminarli uno ad uno come oggetti, questo risolverebbe tutto però con
      // una minore efficienza.
      // If relation HasMany
      rtHasMany:
      begin
        // Create the child PSRequest and execute it
        LChildPSRequest := TioPersistenceStrategyFactory.NewPSRequest_PrePostRelationChild_DeleteList(AMasterContext, LMasterProp);
        // NB: richiamo "io._ExecutePSRequest" perchè in questo modo usa la persistence strategy corretta nel caso
        //      la classe interessata fosse mappata su una connessione diversa (http p DB)
        io._ExecutePSRequest(LChildPSRequest);
      end;
      // If relation HasOne
      rtHasOne:
      begin
        // Create the child PSRequest and execute it
        LChildPSRequest := TioPersistenceStrategyFactory.NewPSRequest_PrePostRelationChild_DeleteObject(AMasterContext, LMasterProp);
        // NB: richiamo "io._ExecutePSRequest" perchè in questo modo usa la persistence strategy corretta nel caso
        //      la classe interessata fosse mappata su una connessione diversa (http p DB)
        io._ExecutePSRequest(LChildPSRequest);
      end;
    end;
  end;
end;

class procedure TioPersistenceStrategyDB.PostProcessRelationChildOnPersist(const AMasterContext: IioContext);
var
  LChildPSRequest: IioPersistenceStrategyRequest;
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
      begin
        // Create the child PSRequest and execute it
        LChildPSRequest := TioPersistenceStrategyFactory.NewPSRequest_PrePostRelationChild_PersistList(AMasterContext, LMasterProp);
        // NB: richiamo "io._ExecutePSRequest" perchè in questo modo usa la persistence strategy corretta nel caso
        //      la classe interessata fosse mappata su una connessione diversa (http p DB)
        io._ExecutePSRequest(LChildPSRequest);
      end;
      // If relation HasOne
      rtHasOne:
      begin
        // Create the child PSRequest and execute it
        LChildPSRequest := TioPersistenceStrategyFactory.NewPSRequest_PrePostRelationChild_PersistObject(AMasterContext, LMasterProp);
        // NB: richiamo "io._ExecutePSRequest" perchè in questo modo usa la persistence strategy corretta nel caso
        //      la classe interessata fosse mappata su una connessione diversa (http p DB)
        io._ExecutePSRequest(LChildPSRequest);
      end;
    end;
  end;
end;

class procedure TioPersistenceStrategyDB.PreProcessRelationChildOnPersist(const AMasterContext: IioContext);
var
  LChildPSRequest: IioPersistenceStrategyRequest;
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
      // HasMany or HasOne: if the intent is Revert or Synchro then delete all HasMany details before persist
      rtHasMany, rtHasOne:
        if AMasterContext.Intent > itRegular then
        begin
          // Create the child PSRequest and execute it
          LChildPSRequest := TioPersistenceStrategyFactory.NewPSRequest_PrePostRelationChild_Delete(AMasterContext, LMasterProp);
          // NB: richiamo "io._ExecutePSRequest" perchè in questo modo usa la persistence strategy corretta nel caso
          //      la classe interessata fosse mappata su una connessione diversa (http p DB)
          io._ExecutePSRequest(LChildPSRequest);
        end;
      // BelongsTo
      rtBelongsTo:
        ;
      // Do nothing  for the moment;
    end;
  end;
end;

class procedure TioPersistenceStrategyDB.RollbackTransaction_Internal(const AConnectionName: String);
begin
  TioDBFactory.Connection(AConnectionName).Rollback;
end;

class procedure TioPersistenceStrategyDB.StartTransaction_Internal(const AConnectionName: String);
begin
  TioDBFactory.Connection(AConnectionName).StartTransaction;
end;

class procedure TioPersistenceStrategyDB._DoRollbackTransaction(const APSRequest: IioPersistenceStrategyRequest);
begin
  RollbackTransaction_Internal(APSRequest.Connection);
end;

class procedure TioPersistenceStrategyDB._DoSQLDest_Execute(const APSRequest: IioPersistenceStrategyRequest);
var
  LQry: IioQuery;
  LSQLDest: IioSQLDestination;
begin
  // extract SQLDestination
  LSQLDest := APSRequest.Intf1 as IioSQLDestination;
  // Start transaction
  io.StartTransaction(LSQLDest.GetConnectionDefName);
  try
    // Get the query object
    LQry := TioDBFactory.Query(LSQLDest.GetConnectionDefName);
    // Set the SQL command text
    LQry.SQL.Text := LSQLDest.GetSQL;
    LQry.ExecSQL;
    // Commit
    io.CommitTransaction(LSQLDest.GetConnectionDefName);
  except
    // Rollback
    io.RollbackTransaction(LSQLDest.GetConnectionDefName);
    raise;
  end;
end;

class procedure TioPersistenceStrategyDB._DoSQLDest_LoadDataSet(const APSRequest: IioPersistenceStrategyRequest);
var
  LDestDataSet: TFDDataSet;
  LQry: IioQuery;
  LSQLDest: IioSQLDestination;
begin
  // extract SQLDestination & DestDataSet objects
  LDestDataSet := APSRequest.Obj1 as TFDDataSet;
  LSQLDest := APSRequest.Intf1 as IioSQLDestination;
  // Start transaction
  io.StartTransaction(LSQLDest.GetConnectionDefName);
  try
    // Get the query object
    LQry := TioDBFactory.Query(LSQLDest.GetConnectionDefName);
    // Set the SQL command text
    LQry.SQL.Text := LSQLDest.GetSQL;
    LQry.GetQuery.FetchOptions.Unidirectional := False;
    LQry.Open;
    try
      LQry.GetQuery.FetchAll;
      // Copy data to the MemoryTable
      LDestDataSet.Data := LQry.GetQuery.Data;
      LDestDataSet.First;
    finally
      LQry.Close;
    end;
    // Commit
    io.CommitTransaction(LSQLDest.GetConnectionDefName);
  except
    // Rollback
    io.RollbackTransaction(LSQLDest.GetConnectionDefName);
    raise;
  end;
end;

class procedure TioPersistenceStrategyDB._DoStartTransaction(const APSRequest: IioPersistenceStrategyRequest);
begin
  StartTransaction_Internal(APSRequest.Connection);
end;

class procedure TioPersistenceStrategyDB._DoLoadDataSet(const APSRequest: IioPersistenceStrategyRequest);
var
  LDestDataSet: TFDDataSet;
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
      // i records e quindi la prima volta la eseguq con l'opzione sopra citata mentre le volte successive no.
      // Per sapere se è il primo passaggio verifico se la MemTable.Active = True perchè ho notato che al primo
      // passaggio la attiva automaticamente.
      if LDestDataSet.FieldCount > 0 then
      begin
        if not LDestDataSet.Active then
          LDestDataSet.Open;
        LDestDataSet.CopyDataSet(LQry.GetQuery, [coAppend])
      end
      else
        LDestDataSet.CopyDataSet(LQry.GetQuery, [coStructure, coAppend]);
    finally
      LQry.Close;
    end;
  end;

begin
  inherited;
  // Extract the destination DataSet
  LDestDataSet := APSRequest.Obj1 as TFDDataSet;
  // Resolve the type and alias
  LResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(APSRequest.Where.TypeName, APSRequest.Where.TypeAlias, rmAllDistinctByConnectionAndTable);
  // Get the transaction collection
  LTransactionCollection := TioDBFactory.TransactionCollection;
  try
    // Loop for all classes in the sesolved type list
    for LResolvedTypeName in LResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      LContext := TioContextFactory.Context_PSRequest(APSRequest, LResolvedTypeName);
      LContext.ActionType := atSelect;
      // If the object is of a class mapped as NotPersisted then skip it
      if LContext.Map.GetTable.IsNotPersistedEntity then
        Continue;
      // Start transaction
      LTransactionCollection.StartTransaction(LContext.ConnectionNameResolved);
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

class procedure TioPersistenceStrategyDB._DoLoadList(const APSRequest: IioPersistenceStrategyRequest);
var
  LResolvedTypeList: IioResolvedTypeList;
  LResolvedTypeName: String;
  LOriginalContext: IioContext;
  // TODO: Non potrei usarlo anche in PersistList, DeleteList ecc.?
  LContextCache: IioContextCache;
  LTransactionCollection: IioTransactionCollection;
  LDuckTypedList: IioDuckTypedList;
  // Nested
  procedure NestedLoadToList;
  var
    LQuery: IioQuery;
    LCurrentContext: IioContext;
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
            LCurrentContext := LContextCache.GetContext(APSRequest, LQuery.ExtractTrueClassName(LOriginalContext))
          else
            LCurrentContext := LOriginalContext;
          LCurrentContext.ActionType := atSelect;
          // access-token validation
          // note: The anonymous method of type "TioTokenValidateMethod" can return true or false
          //        to authorize or not the operation to be performed. But be careful, if the operation
          //        is not authorized simply returning false will not raise any exception so the operation
          //        will not be performed but the user will probably not notice the lack of authorization;
          //        If you want to inform the user of the failed authorization, you need to raise an exception
          //        within the annoying method itself (TioTokenValidateMethod).
          if TioApplication.ProvideAuthDecisionCRUD(LCurrentContext as IioAuthDecisionRequest) then
          begin
            // Clean the DataObject (it contains the previous)
            LCurrentContext.DataObject := nil;
            // Create the object as TObject  (Intercepted by CRUDInterceptors)
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioCRUDInterceptorsOff}
            if not TioCRUDInterceptorRegister.BeforeLoad(LCurrentContext) then
            begin
{$ENDIF}
{$ENDREGION}
              TioObjectMakerFactory.GetObjectMaker(LCurrentContext).MakeObject(LCurrentContext, LQuery);
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioCRUDInterceptorsOff}
              TioCRUDInterceptorRegister.AfterLoad(LCurrentContext);
            end;
{$ENDIF}
{$ENDREGION}
            // Add current object to the list
            LDuckTypedList.Add(LCurrentContext.DataObject);
          end;
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
  // Resolve the type and alias
  LResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(APSRequest.Where.TypeName, APSRequest.Where.TypeAlias, rmAllDistinctByConnectionAndTable);
  // Wrap the list into a DuckTypedList
  LDuckTypedList := TioDuckTypedFactory.DuckTypedList(APSRequest.ListDTO);
  // Create the IioContext cache (optimization)
  LContextCache := TioContextCache.Create;
  // Get the transaction collection
  LTransactionCollection := TioDBFactory.TransactionCollection;
  try
    // Loop for all classes in the resolved type list
    for LResolvedTypeName in LResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      LOriginalContext := TioContextFactory.TrueClassVirtualContextIfEnabled(APSRequest, LResolvedTypeName);
      // If the object is of a class mapped as NotPersisted then skip it
      if LOriginalContext.Map.GetTable.IsNotPersistedEntity then
        Continue;
      // Start transaction
      LTransactionCollection.StartTransaction(LOriginalContext.ConnectionNameResolved);
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

class procedure TioPersistenceStrategyDB._DoLoadObject(const APSRequest: IioPersistenceStrategyRequest);
var
  LResolvedTypeList: IioResolvedTypeList;
  LResolvedTypeName: String;
  LOriginalContext: IioContext;
  LTransactionCollection: IioTransactionCollection;
  // Nested
  procedure NestedLoadObject;
  var
    LQuery: IioQuery;
    LCurrentContext: IioContext;
  begin
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
            LCurrentContext := TioContextFactory.Context_PSRequest(APSRequest, LQuery.ExtractTrueClassName(LOriginalContext))
          else
            LCurrentContext := LOriginalContext;
          LCurrentContext.ActionType := atSelect;
          // access-token validation
          // note: The anonymous method of type "TioTokenValidateMethod" can return true or false
          //        to authorize or not the operation to be performed. But be careful, if the operation
          //        is not authorized simply returning false will not raise any exception so the operation
          //        will not be performed but the user will probably not notice the lack of authorization;
          //        If you want to inform the user of the failed authorization, you need to raise an exception
          //        within the annoying method itself (TioTokenValidateMethod).
          if TioApplication.ProvideAuthDecisionCRUD(LCurrentContext as IioAuthDecisionRequest) then
          begin
            // Create the object as TObject (Intercepted by CRUDInterceptors)
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioCRUDInterceptorsOff}
            if not TioCRUDInterceptorRegister.BeforeLoad(LCurrentContext) then
            begin
{$ENDIF}
{$ENDREGION}
              TioObjectMakerFactory.GetObjectMaker(LCurrentContext).MakeObject(LCurrentContext, LQuery);
{$REGION '-----INTERCEPTORS-----'}
{$IFNDEF ioCRUDInterceptorsOff}
              TioCRUDInterceptorRegister.AfterLoad(LCurrentContext);
            end;
{$ENDIF}
{$ENDREGION}
          end;
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
  // Resolve the type and alias
  LResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(APSRequest.Where.TypeName, APSRequest.Where.TypeAlias, rmAllDistinctByConnectionAndTable);
  // Get the transaction collection
  LTransactionCollection := TioDBFactory.TransactionCollection;
  try
    // Loop for all classes in the sesolved type list
    for LResolvedTypeName in LResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      LOriginalContext := TioContextFactory.TrueClassVirtualContextIfEnabled(APSRequest, LResolvedTypeName);
      // If the object is of a class mapped as NotPersisted then skip it
      if LOriginalContext.Map.GetTable.IsNotPersistedEntity then
        Continue;
      // Start transaction
      LTransactionCollection.StartTransaction(LOriginalContext.ConnectionNameResolved);
      // Load the current class object is founded
      NestedLoadObject;
      // If there is a result (an object) then exit;
      if Assigned(APSRequest.DTO) then
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
    AContext.CheckUpdateConflict;
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
    AContext.ResolveUpdateConflict;
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
    AContext.ObjUpdatedUserID := AContext.PSREquest.UsrOID;
    AContext.ObjUpdatedUserName := AContext.PSREquest.Usr;
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

function TioContextCache.GetContext(const APSRequest: IioPersistenceStrategyRequest; const AClassName: String): IioContext;
begin
  // If the map is not already present in the cache then create and add it
  if not FContainer.ContainsKey(AClassName) then
    FContainer.Add(AClassName, TioContextFactory.Context_PSRequest(APSRequest, AClassName));
  // Return the requested context and set its DataObject to nil
  Result := FContainer.Items[AClassName];
  Result.DataObject := nil;
end;

end.
