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
unit iORM.Strategy.DB;

interface

uses
  iORM.Context.Interfaces,
  iORM.Context.Properties.Interfaces, iORM.Where.Interfaces,
  iORM.DB.Interfaces, FireDAC.Comp.DataSet, Data.DB,
  iORM.LiveBindings.BSPersistence;

type

  // Strategy class for database
  TioStrategyDB = class(TioStrategyIntf)
  private
    class procedure InsertObject_Internal(const AContext: IioContext; const ABlindInsertUpdate: Boolean);
    class procedure UpdateObject_Internal(const AContext: IioContext; const ABlindInsertUpdate: Boolean);
    class procedure DeleteObject_Internal(const AContext: IioContext);
    class procedure PreProcessRelationChildOnDelete(const AMasterContext: IioContext);
    class procedure PreProcessRelationChildOnPersist(const AMasterContext: IioContext);
    class procedure PostProcessRelationChildOnPersist(const AMasterContext: IioContext);
    class function ObjectExists(const AContext: IioContext): Boolean;
  protected
    // ---------- Begin intercepted methods (StrategyInterceptors) ----------
    class procedure _DoPersistObject(const AObj: TObject; const ARelationPropertyName: String; const ARelationOID: Integer; const ABlindInsertUpdate: Boolean;
      const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String); override;
    class procedure _DoPersistList(const AList: TObject; const ARelationPropertyName: String; const ARelationOID: Integer; const ABlindInsert: Boolean;
      const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String); override;
    class procedure _DoDeleteObject(const AObj: TObject); override;
    class procedure _DoDeleteList(const AList: TObject); override;
    class procedure _DoLoadList(const AWhere: IioWhere; const AList: TObject); override;
    class function _DoLoadObject(const AWhere: IioWhere; const AObj: TObject): TObject; override;
    // ---------- End intercepted methods (StrategyInterceptors) ----------
  public
    class procedure StartTransaction(const AConnectionName: String); override;
    class procedure CommitTransaction(const AConnectionName: String); override;
    class procedure RollbackTransaction(const AConnectionName: String); override;
    class function InTransaction(const AConnectionName: String): Boolean; override;
    class procedure Delete(const AWhere: IioWhere); override;
    class function LoadObjectByClassOnly(const AWhere: IioWhere; const AObj: TObject): TObject; override;
    class procedure LoadDataSet(const AWhere: IioWhere; const ADestDataSet: TFDDataSet); override;
    class function Count(const AWhere: IioWhere): Integer; override;
    // SQLDestinations
    class procedure SQLDest_LoadDataSet(const ASQLDestination: IioSQLDestination; const ADestDataSet: TFDDataSet); override;
    class procedure SQLDest_Execute(const ASQLDestination: IioSQLDestination); override;
  end;

implementation

uses
  iORM.Context.Factory, iORM.CommonTypes, iORM.Attributes,
  iORM.DB.ConnectionContainer, iORM.DB.Factory, iORM.DuckTyped.Interfaces,
  iORM.DuckTyped.Factory, iORM.Resolver.Interfaces, iORM.ObjectsForge.Factory,
  iORM.LazyLoad.Factory, iORM.Resolver.Factory, iORM.Where.Factory,
  iORM.Exceptions, iORM, System.SysUtils, System.Generics.Collections,
  iORM.Interceptor.CRUD, iORM.Interceptor.CRUD.Register, iORM.Utilities;

type

  IioContextCache = interface
    ['{FAFBB27B-3E84-4D23-8801-3C863FA3556B}']
    function GetContext(const AClassName: String; const AWhere: IioWhere): IioContext;
  end;

  TioContextCache = class(TInterfacedObject, IioContextCache)
  strict private
    FContainer: TDictionary<String, IioContext>;
  public
    constructor Create;
    destructor Destroy; override;
    function GetContext(const AClassName: String; const AWhere: IioWhere): IioContext;
  end;

{ TioStrategyDB }

class procedure TioStrategyDB.CommitTransaction(const AConnectionName: String);
begin
  inherited;
  TioDBFactory.Connection(AConnectionName).Commit;
end;

class function TioStrategyDB.Count(const AWhere: IioWhere): Integer;
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
      AContext := TioContextFactory.Context(AResolvedTypeName, AWhere, nil, nil, '', '');
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

class procedure TioStrategyDB.Delete(const AWhere: IioWhere);
var
  AResolvedTypeList: IioResolvedTypeList;
  AResolvedTypeName: String;
  AContext: IioContext;
  ATransactionCollection: IioTransactionCollection;
  // Nested
  procedure NestedDelete;
  var
    AQuery: IioQuery;
  begin
    // Create & execute query
    AQuery := TioDBFactory.QueryEngine.GetQueryDelete(AContext, False);
    AQuery.ExecSQL;
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
      AContext := TioContextFactory.Context(AResolvedTypeName, AWhere, nil, nil, '', '');
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

class procedure TioStrategyDB._DoDeleteList(const AList: TObject);
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
      Self._DoDeleteObject(AObj);
    end;
    Self.CommitTransaction('');
  except
    Self.RollbackTransaction('');
    raise;
  end;
end;

class procedure TioStrategyDB._DoDeleteObject(const AObj: TObject);
var
  LContext: IioContext;
begin
  inherited;
  // Check
  if not Assigned(AObj) then
    Exit;
  // Create Context (Create a dummy ioWhere first to pass ConnectionName parameter only).
  LContext := TioContextFactory.Context(AObj.ClassName, nil, AObj, nil, '', '');
  // If the object is of a class mapped as NotPersisted then exit
  if LContext.Map.GetTable.IsNotPersistedEntity then
    Exit;
  // Start transaction
  StartTransaction(LContext.GetTable.GetConnectionDefName);
  try
    // PreProcess (delete) relation childs (HasMany, HasOne)
    PreProcessRelationChildOnDelete(LContext);
    // Delete the object
    DeleteObject_Internal(LContext);
    // Commit
    CommitTransaction(LContext.GetTable.GetConnectionDefName);
  except
    // Rollback
    RollbackTransaction(LContext.GetTable.GetConnectionDefName);
    raise;
  end;
end;

class procedure TioStrategyDB.DeleteObject_Internal(const AContext: IioContext);
var
{$IFNDEF ioCRUDInterceptorsOff}
  LDone: Boolean;
{$ENDIF}
  LQuery: IioQuery;
begin
  inherited;
  // Delete the entity (Intercepted by CRUDInterceptors)
{$IFNDEF ioCRUDInterceptorsOff}
  LDone := False;
  TioCRUDInterceptorRegister.BeforeDelete(AContext, LDone);
  if not LDone then
  begin
{$ENDIF}
    LQuery := TioDBFactory.QueryEngine.GetQueryDelete(AContext, True);
    if not AContext.IDIsNull then
      LQuery.ExecSQL;
{$IFNDEF ioCRUDInterceptorsOff}
    TioCRUDInterceptorRegister.AfterDelete(AContext);
  end;
{$ENDIF}
end;

class procedure TioStrategyDB.InsertObject_Internal(const AContext: IioContext; const ABlindInsertUpdate: Boolean);
var
{$IFNDEF ioCRUDInterceptorsOff}
  LDone: Boolean;
{$ENDIF}
  LQuery: IioQuery;
begin
  inherited;
  // -----------------------------------------------------------
  // Get and execute a query to retrieve the next ID for the inserting object
  // before the insert query (for Firebird/Interbase)
  if (not ABlindInsertUpdate) and (TioConnectionManager.GetConnectionInfo(AContext.GetTable.GetConnectionDefName).KeyGenerationTime = kgtBeforeInsert) and AContext.IDIsNull
  then
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
{$IFNDEF ioCRUDInterceptorsOff}
  LDone := False;
  TioCRUDInterceptorRegister.BeforeInsert(AContext, LDone);
  if not LDone then
  begin
{$ENDIF}
    // Create and execute insert query and set the version/created/updated of the entity (Intercepted by crudInterceptors)
    LQuery := TioDBFactory.QueryEngine.GetQueryInsert(AContext);
    LQuery.ExecSQL;
    if not ABlindInsertUpdate then
    begin
      AContext.NextObjVersion(True);
      AContext.ObjCreated := LQuery.Connection.LastTransactionTimestamp;
      AContext.ObjUpdated := LQuery.Connection.LastTransactionTimestamp;
    end;
    // -----------------------------------------------------------
    // Get and execute a query to retrieve the last ID generated
    // in the last insert query.
    if (not ABlindInsertUpdate) and (TioConnectionManager.GetConnectionInfo(AContext.GetTable.GetConnectionDefName).KeyGenerationTime = kgtAfterInsert) and AContext.IDIsNull then
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
{$IFNDEF ioCRUDInterceptorsOff}
    TioCRUDInterceptorRegister.AfterInsert(AContext);
  end;
{$ENDIF}
end;

class function TioStrategyDB.InTransaction(const AConnectionName: String): Boolean;
begin
  inherited;
  Result := TioDBFactory.Connection(AConnectionName).InTransaction;
end;

class function TioStrategyDB.LoadObjectByClassOnly(const AWhere: IioWhere; const AObj: TObject): TObject;
var
  LContext: IioContext;
  LQuery: IioQuery;
begin
  inherited;
  // Init
  Result := AObj;
  // Get the Context
  LContext := TioContextFactory.Context(AWhere.TypeName, AWhere, Result, nil, '', '');
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

class function TioStrategyDB.ObjectExists(const AContext: IioContext): Boolean;
var
  AQuery: IioQuery;
begin
  inherited;
  // Generate and open the query
  AQuery := TioDBFactory.QueryEngine.GetQueryExists(AContext);
  AQuery.Open;
  try
    Result := AQuery.Fields[0].AsInteger <> 0;
  finally
    AQuery.Close;
  end;
end;

class procedure TioStrategyDB._DoPersistList(const AList: TObject; const ARelationPropertyName: String; const ARelationOID: Integer;
  const ABlindInsert: Boolean; const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String);
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
      _DoPersistObject(LObj, ARelationPropertyName, ARelationOID, ABlindInsert, AMasterBSPersistence, AMasterPropertyName, AMasterPropertyPath);
    // Commit the transaction
    CommitTransaction('');
  except
    RollbackTransaction('');
    raise;
  end;
end;

class procedure TioStrategyDB._DoPersistObject(const AObj: TObject; const ARelationPropertyName: String; const ARelationOID: Integer; const ABlindInsertUpdate: Boolean;
  const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String);
var
  LContext: IioContext;
begin
  inherited;
  // Check
  if not Assigned(AObj) then
    Exit;
  // Create Context
  LContext := TioContextFactory.Context(AObj.ClassName, nil, AObj, AMasterBSPersistence, AMasterPropertyName, AMasterPropertyPath);
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
    // PreProcess (persist) relation childs (BelongsTo)
    PreProcessRelationChildOnPersist(LContext);
    // Process the current object
    // --------------------------
    case LContext.ObjStatus of
      // Persist if dirty
      osDirty:
        begin
          // If SmartUpdateDetection system is not enabled or (if enabled) the object is to be persisted (according to the SmartUpdateDetection system)...
          if LContext.GetProperties.ObjStatusPropertyExist or (AMasterBSPersistence = nil) or (not AMasterBSPersistence.IsSmartUpdateDetectionEnabled) or
            AMasterBSPersistence.SmartUpdateDetection.IsToBePersisted(AObj, LContext.MasterPropertyPath) then
          begin
            // if (AContext.GetProperties.GetIdProperty.GetValue(AContext.DataObject).AsInteger <> IO_INTEGER_NULL_VALUE)
            if (not ABlindInsertUpdate) and (not LContext.IDIsNull) and Self.ObjectExists(LContext) then
              UpdateObject_Internal(LContext, ABlindInsertUpdate)
            else
              InsertObject_Internal(LContext, ABlindInsertUpdate);
            LContext.ObjStatus := osClean;
          end;
        end;
      // Delete if deleted
      osDeleted:
        DeleteObject_Internal(LContext);
    end;
    // --------------------------
    // PostProcess (persist) relation childs (HasMany, HasOne)
    PostProcessRelationChildOnPersist(LContext);
    // Commit
    CommitTransaction(LContext.GetTable.GetConnectionDefName);
  except
    // Rollback
    RollbackTransaction(LContext.GetTable.GetConnectionDefName);
    raise;
  end;
end;

class procedure TioStrategyDB.PreProcessRelationChildOnDelete(const AMasterContext: IioContext);
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
        _DoDeleteList(LMasterProp.GetRelationChildObject(AMasterContext.DataObject));
      // If relation HasOne
      rtHasOne:
        _DoDeleteObject(LMasterProp.GetRelationChildObject(AMasterContext.DataObject));
    end;
  end;
end;

class procedure TioStrategyDB.PostProcessRelationChildOnPersist(const AMasterContext: IioContext);
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
        _DoPersistList(LMasterProp.GetRelationChildObject(AMasterContext.DataObject), LMasterProp.GetRelationChildPropertyName,
          AMasterContext.GetProperties.GetIdProperty.GetValue(AMasterContext.DataObject).AsInteger, False, AMasterContext.MasterBSPersistence,
          LMasterProp.GetName, AMasterContext.MasterPropertyPath);
      // If relation HasOne
      rtHasOne:
        _DoPersistObject(LMasterProp.GetRelationChildObject(AMasterContext.DataObject), LMasterProp.GetRelationChildPropertyName,
          AMasterContext.GetProperties.GetIdProperty.GetValue(AMasterContext.DataObject).AsInteger, False, AMasterContext.MasterBSPersistence,
          LMasterProp.GetName, AMasterContext.MasterPropertyPath);
    end;
  end;
end;

class procedure TioStrategyDB.PreProcessRelationChildOnPersist(const AMasterContext: IioContext);
//ar
// LMasterProp: IioProperty;
begin
//  inherited;
//   // Loop for all properties
//   for LMasterProp in AMasterContext.GetProperties do
//     // If the property is write enabled and has a BelongsTo relation...
//     if LMasterProp.IsDBWriteEnabled and (LMasterProp.GetRelationType = rtBelongsTo) then
//       PersistObject(LMasterProp.GetRelationChildObject(AMasterContext.DataObject), '', 0, False, AMasterContext.MasterBSPersistence, LMasterProp.GetName,
//         AMasterContext.MasterPropertyPath);
end;

class procedure TioStrategyDB.RollbackTransaction(const AConnectionName: String);
begin
  inherited;
  TioDBFactory.Connection(AConnectionName).Rollback;
end;

class procedure TioStrategyDB.SQLDest_Execute(const ASQLDestination: IioSQLDestination);
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

class procedure TioStrategyDB.SQLDest_LoadDataSet(const ASQLDestination: IioSQLDestination; const ADestDataSet: TFDDataSet);
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

class procedure TioStrategyDB.StartTransaction(const AConnectionName: String);
begin
  inherited;
  TioDBFactory.Connection(AConnectionName).StartTransaction;
end;

class procedure TioStrategyDB.LoadDataSet(const AWhere: IioWhere; const ADestDataSet: TFDDataSet);
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
      LContext := TioContextFactory.Context(LResolvedTypeName, AWhere, nil, nil, '', '');
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

class procedure TioStrategyDB._DoLoadList(const AWhere: IioWhere; const AList: TObject);
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
{$IFNDEF ioCRUDInterceptorsOff}
    LDone: Boolean;
{$ENDIF}
    LQuery: IioQuery;
    LObj: TObject;
    LCurrentContext: IioContext;
  begin
    // NB: Se TrueClassMode = tcSmart in pratica LCurrentContext ora contiene la VirtualMap (o SuperMap) e la usa per
    //      creare il codice SQL della query poi, una volta aperta la query, inizia a ciclare per tutti i record/oggetti
    //      trovati dalla query stessa e per ognuno di essi si fa dare la mappa/context specifica della classe specifica
    //      dell'oggetto corrente.
    // Create & open query
    LQuery := TioDBFactory.QueryEngine.GetQuerySelectList(LOriginalContext);
    LQuery.Open;
    try
      // Loop for all records (objects) of the query
      while not LQuery.Eof do
      begin
        // If TrueClassMode is tvSmart then get the specific context for the current record/object else
        //  use the original context
        if LOriginalContext.GetTrueClass.Mode = tcSmart then
          LCurrentContext := LContextCache.GetContext(LQuery.ExtractTrueClassName(LOriginalContext), AWhere)
        else
          LCurrentContext := LOriginalContext;
        // Clean the DataObject (it contains the previous)
        LCurrentContext.DataObject := nil;
        // Create the object as TObject  (Intercepted by CRUDInterceptors)
{$IFNDEF ioCRUDInterceptorsOff}
        LDone := False;
        LObj := TioCRUDInterceptorRegister.BeforeLoad(LCurrentContext, nil, LDone);
        LCurrentContext.DataObject := LObj;
        if not LDone then
        begin
{$ENDIF}
          LObj := TioObjectMakerFactory.GetObjectMaker(LCurrentContext).MakeObject(LCurrentContext, LQuery);
{$IFNDEF ioCRUDInterceptorsOff}
          LObj := TioCRUDInterceptorRegister.AfterLoad(LCurrentContext, LObj);
        end;
{$ENDIF}
        // Add current object to the list
        LDuckTypedList.Add(LObj);
        // Next
        LQuery.Next;
      end;
    finally
      // Close query
      LQuery.Close;
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
      LOriginalContext := TioContextFactory.TrueClassVirtualContextIfEnabled(LResolvedTypeName, AWhere);
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

class function TioStrategyDB._DoLoadObject(const AWhere: IioWhere; const AObj: TObject): TObject;
var
  LResolvedTypeList: IioResolvedTypeList;
  LResolvedTypeName: String;
  LOriginalContext: IioContext;
  LTransactionCollection: IioTransactionCollection;
  // Nested
  function NestedLoadToObject: TObject;
  var
{$IFNDEF ioCRUDInterceptorsOff}
    LDone: Boolean;
{$ENDIF}
    LQuery: IioQuery;
    LCurrentContext: IioContext;
  begin
    // Init
    Result := AObj;
    // Create & open query
    LQuery := TioDBFactory.QueryEngine.GetQuerySelectObject(LOriginalContext);
    LQuery.Open;
    try
      // If a record is fuìound then load the object and return True
      if not LQuery.Eof then
      begin
        // If TrueClassMode is tvSmart then get the specific context for the current record/object else
        //  use the original context
        if LOriginalContext.GetTrueClass.Mode = tcSmart then
          LCurrentContext := TioContextFactory.Context(LQuery.ExtractTrueClassName(LOriginalContext), AWhere, Result, nil, '', '')
        else
          LCurrentContext := LOriginalContext;
        // Create the object as TObject (Intercepted by CRUDInterceptors)
{$IFNDEF ioCRUDInterceptorsOff}
        LDone := False;
        Result := TioCRUDInterceptorRegister.BeforeLoad(LCurrentContext, Result, LDone);
        LCurrentContext.DataObject := Result;
        if not LDone then
        begin
{$ENDIF}
          Result := TioObjectMakerFactory.GetObjectMaker(LCurrentContext).MakeObject(LCurrentContext, LQuery);
{$IFNDEF ioCRUDInterceptorsOff}
          Result := TioCRUDInterceptorRegister.AfterLoad(LCurrentContext, Result);
        end;
{$ENDIF}
      end;
    finally
      // Close query
      LQuery.Close;
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
      LOriginalContext := TioContextFactory.TrueClassVirtualContextIfEnabled(LResolvedTypeName, AWhere);
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

class procedure TioStrategyDB.UpdateObject_Internal(const AContext: IioContext; const ABlindInsertUpdate: Boolean);
var
{$IFNDEF ioCRUDInterceptorsOff}
  LDone: Boolean;
{$ENDIF}
  LQuery: IioQuery;
begin
  inherited;
  // Create and execute the query to update the entity into the DB cheking the version to avoid concurrency
  // conflict (if versioning is enabled for this type of entity) (Intercepted by CRUDInterceptors)
{$IFNDEF ioCRUDInterceptorsOff}
  LDone := False;
  TioCRUDInterceptorRegister.BeforeUpdate(AContext, LDone);
  if not LDone then
  begin
{$ENDIF}
    LQuery := TioDBFactory.QueryEngine.GetQueryUpdate(AContext);
    if LQuery.ExecSQL = 0 then
      raise EioConcurrencyConflictException.Create(ClassName, 'UpdateObject_Internal', AContext);
    if not ABlindInsertUpdate then
    begin
      AContext.NextObjVersion(True);
      AContext.ObjUpdated := LQuery.Connection.LastTransactionTimestamp;;
    end;
{$IFNDEF ioCRUDInterceptorsOff}
    TioCRUDInterceptorRegister.AfterUpdate(AContext);
  end;
{$ENDIF}
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

function TioContextCache.GetContext(const AClassName: String; const AWhere: IioWhere): IioContext;
begin
  // If the map is not already present in the cache then create and add it
  if not FContainer.ContainsKey(AClassName) then
    FContainer.Add(AClassName, TioContextFactory.Context(AClassName, AWhere, nil, nil, '', ''));
  // Return the requested context and set its DataObject to nil
  Result := FContainer.Items[AClassName];
  Result.DataObject := nil;
end;

end.
