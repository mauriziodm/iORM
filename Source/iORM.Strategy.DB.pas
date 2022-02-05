{ *************************************************************************** }
{ }
{ iORM - (interfaced ORM) }
{ }
{ Copyright (C) 2015-2016 Maurizio Del Magno }
{ }
{ mauriziodm@levantesw.it }
{ mauriziodelmagno@gmail.com }
{ https://github.com/mauriziodm/iORM.git }
{ }
{ }
{ *************************************************************************** }
{ }
{ This file is part of iORM (Interfaced Object Relational Mapper). }
{ }
{ Licensed under the GNU Lesser General Public License, Version 3; }
{ you may not use this file except in compliance with the License. }
{ }
{ iORM is free software: you can redistribute it and/or modify }
{ it under the terms of the GNU Lesser General Public License as published }
{ by the Free Software Foundation, either version 3 of the License, or }
{ (at your option) any later version. }
{ }
{ iORM is distributed in the hope that it will be useful, }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the }
{ GNU Lesser General Public License for more details. }
{ }
{ You should have received a copy of the GNU Lesser General Public License }
{ along with iORM.  If not, see <http://www.gnu.org/licenses/>. }
{ }
{ *************************************************************************** }

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
  protected
    class procedure InsertObject(const AContext: IioContext; const ABlindInsert: Boolean);
    class procedure UpdateObject(const AContext: IioContext);
    class procedure DeleteObject_Internal(const AContext: IioContext);
    class procedure PreProcessRelationChildOnDelete(const AMasterContext: IioContext);
    class procedure PreProcessRelationChildOnPersist(const AMasterContext: IioContext);
    class procedure PostProcessRelationChildOnPersist(const AMasterContext: IioContext);
    class function ObjectExists(const AContext: IioContext): Boolean;
  public
    class procedure StartTransaction(const AConnectionName: String); override;
    class procedure CommitTransaction(const AConnectionName: String); override;
    class procedure RollbackTransaction(const AConnectionName: String); override;
    class function InTransaction(const AConnectionName: String): Boolean; override;
    class procedure PersistObject(const AObj: TObject; const ARelationPropertyName: String; const ARelationOID: Integer; const ABlindInsert: Boolean;
      const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String); override;
    class procedure PersistCollection(const ACollection: TObject; const ARelationPropertyName: String; const ARelationOID: Integer; const ABlindInsert: Boolean;
      const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String); override;
    class procedure DeleteObject(const AObj: TObject); override;
    class procedure DeleteCollection(const ACollection: TObject); override;
    class procedure Delete(const AWhere: IioWhere); override;
    class procedure LoadList(const AWhere: IioWhere; const AList: TObject); override;
    class function LoadObject(const AWhere: IioWhere; const AObj: TObject): TObject; override;
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
  iORM.Exceptions, iORM, System.SysUtils;

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
    AQuery := TioDBFactory.QueryEngine.GetQueryDelete(AContext);
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

class procedure TioStrategyDB.DeleteCollection(const ACollection: TObject);
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
    ADuckTypedList := TioDuckTypedFactory.DuckTypedList(ACollection);
    // Loop the list and delete objects
    for AObj in ADuckTypedList do
    begin
      // Persist object
      Self.DeleteObject(AObj);
    end;
    Self.CommitTransaction('');
  except
    Self.RollbackTransaction('');
    raise;
  end;
end;

// class procedure TioStrategyDB.DeleteObject(const AObj: TObject);
// var
// AContext: IioContext;
// begin
// inherited;
// // Check
// if not Assigned(AObj) then
// Exit;
// // Create Context
// AContext := TioContextFactory.Context(AObj.ClassName, nil, AObj);
// // Execute
// Self.DeleteObject_Internal(AContext);
// end;

class procedure TioStrategyDB.DeleteObject(const AObj: TObject);
var
  LContext: IioContext;
begin
  inherited;
  // Check
  if not Assigned(AObj) then
    Exit;
  // Create Context (Create a dummy ioWhere first to pass ConnectionName parameter only).
  LContext := TioContextFactory.Context(AObj.ClassName, nil, AObj, nil, '', '');
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
begin
  inherited;
  // If the ID is not null (object not persisted) then delete it from the DB
  if not AContext.IDIsNull then
    // Create and execute query
    TioDBFactory.QueryEngine.GetQueryDelete(AContext).ExecSQL;
end;

class procedure TioStrategyDB.InsertObject(const AContext: IioContext; const ABlindInsert: Boolean);
var
  AQuery: IioQuery;
begin
  inherited;
  // -----------------------------------------------------------
  // Get and execute a query to retrieve the next ID for the inserting object
  // before the insert query (for Firebird/Interbase)
  if (not ABlindInsert) and (TioConnectionManager.GetConnectionInfo(AContext.GetTable.GetConnectionDefName).ConnectionType = cdtFirebird) and AContext.IDIsNull
  then
  begin
    AQuery := TioDBFactory.QueryEngine.GetQueryNextID(AContext);
    try
      AQuery.Open;
      // Set the NextID as the ObjectID
      AContext.GetProperties.GetIdProperty.SetValue(AContext.DataObject, AQuery.Fields[0].AsInteger);
    finally
      AQuery.Close;
    end;
  end;
  // -----------------------------------------------------------

  // Create and execute insert query and set the version of the entity
  // (if it's not a BlindInsert and versioning is enabled for this entity type)
  TioDBFactory.QueryEngine.GetQueryInsert(AContext).ExecSQL;
  if not ABlindInsert then
    AContext.ObjVersion := AContext.TransactionTimestamp;

  // -----------------------------------------------------------
  // Get and execute a query to retrieve the last ID generated
  // in the last insert query.
  if (not ABlindInsert) and ((TioConnectionManager.GetConnectionInfo(AContext.GetTable.GetConnectionDefName).ConnectionType = cdtSQLite) or
    (TioConnectionManager.GetConnectionInfo(AContext.GetTable.GetConnectionDefName).ConnectionType = cdtSQLServer)) and AContext.IDIsNull then
  begin
    AQuery := TioDBFactory.QueryEngine.GetQueryNextID(AContext);
    try
      AQuery.Open;
      // Set the NextID as the ObjectID
      AContext.GetProperties.GetIdProperty.SetValue(AContext.DataObject, AQuery.Fields[0].AsInteger);
    finally
      AQuery.Close;
    end;
  end;
  // -----------------------------------------------------------
end;

class function TioStrategyDB.InTransaction(const AConnectionName: String): Boolean;
begin
  inherited;
  Result := TioDBFactory.Connection(AConnectionName).InTransaction;
end;

class function TioStrategyDB.LoadObject(const AWhere: IioWhere; const AObj: TObject): TObject;
var
  AResolvedTypeList: IioResolvedTypeList;
  AResolvedTypeName: String;
  AContext: IioContext;
  ATransactionCollection: IioTransactionCollection;
  // Nested
  function NestedLoadToObject: TObject;
  var
    AQuery: IioQuery;
  begin
    // Init
    Result := nil;
    // Create & open query
    // AQuery := TioDbFactory.QueryEngine.GetQuerySelectForList(AContext); // NB: Prima era così ma probabilmente era una svista
    AQuery := TioDBFactory.QueryEngine.GetQuerySelectObject(AContext);
    AQuery.Open;
    try
      // If a record is fuìound then load the object and return True
      if not AQuery.Eof then
        // Create the object as TObject
        Result := TioObjectMakerFactory.GetObjectMaker(AContext.IsTrueClass).MakeObject(AContext, AQuery);
    finally
      // Close query
      AQuery.Close;
    end;
  end;

begin
  inherited;
  Result := nil;
  // Resolve the type and alias
  AResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(AWhere.TypeName, AWhere.TypeAlias, rmAllDistinctByConnectionAndTable);
  // Get the transaction collection
  ATransactionCollection := TioDBFactory.TransactionCollection;
  try
    // Loop for all classes in the sesolved type list
    for AResolvedTypeName in AResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      AContext := TioContextFactory.Context(AResolvedTypeName, AWhere, AObj, nil, '', '');
      // Start transaction
      ATransactionCollection.StartTransaction(AContext.GetTable.GetConnectionDefName);
      // Load the current class object is founded
      Result := NestedLoadToObject;
      // If there is a result (an object) then exit;
      if Assigned(Result) then
        Break;
    end;
    // Commit ALL transactions
    ATransactionCollection.CommitAll;
  except
    // Rollback ALL transactions
    ATransactionCollection.RollbackAll;
    raise;
  end;
end;

class function TioStrategyDB.LoadObjectByClassOnly(const AWhere: IioWhere; const AObj: TObject): TObject;
var
  AContext: IioContext;
  AQuery: IioQuery;
begin
  inherited;
  // Init
  Result := AObj;
  // Get the Context
  AContext := TioContextFactory.Context(AWhere.TypeName, AWhere, Result, nil, '', '');
  // Create & open query
  AQuery := TioDBFactory.QueryEngine.GetQuerySelectObject(AContext);
  AQuery.Open;
  try
    // Create the object as TObject
    if not AQuery.IsEmpty then
      Result := TioObjectMakerFactory.GetObjectMaker(AContext.IsTrueClass).MakeObject(AContext, AQuery);
  finally
    // Close query
    AQuery.Close;
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

class procedure TioStrategyDB.PersistCollection(const ACollection: TObject; const ARelationPropertyName: String; const ARelationOID: Integer;
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
    LDuckTypedList := TioDuckTypedFactory.DuckTypedList(ACollection);
    // Loop the list
    for LObj in LDuckTypedList do
      PersistObject(LObj, ARelationPropertyName, ARelationOID, ABlindInsert, AMasterBSPersistence, AMasterPropertyName, AMasterPropertyPath);
    // Commit the transaction
    CommitTransaction('');
  except
    RollbackTransaction('');
    raise;
  end;
end;

class procedure TioStrategyDB.PersistObject(const AObj: TObject; const ARelationPropertyName: String; const ARelationOID: Integer; const ABlindInsert: Boolean;
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


    if (not AMasterBSPersistence.IsSmartUpdateDetectionEnabled) or AMasterBSPersistence.SmartUpdateDetection.IsToBePersisted(AObj, LContext.MasterPropertyPath) then
    begin


      case LContext.ObjStatus of
        // Persist if dirty
        osDirty:
          begin
            // if (AContext.GetProperties.GetIdProperty.GetValue(AContext.DataObject).AsInteger <> IO_INTEGER_NULL_VALUE)
            if (not ABlindInsert) and (not LContext.IDIsNull) and Self.ObjectExists(LContext) then
              UpdateObject(LContext)
            else
              InsertObject(LContext, ABlindInsert);
            LContext.ObjStatus := osClean;
          end;
        // Delete if deleted
        osDeleted:
          DeleteObject_Internal(LContext);
      end;


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
        DeleteCollection(LMasterProp.GetRelationChildObject(AMasterContext.DataObject));
      // If relation HasOne
      rtHasOne:
        DeleteObject(LMasterProp.GetRelationChildObject(AMasterContext.DataObject));
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
        PersistCollection(LMasterProp.GetRelationChildObject(AMasterContext.DataObject), LMasterProp.GetRelationChildPropertyName,
          AMasterContext.GetProperties.GetIdProperty.GetValue(AMasterContext.DataObject).AsInteger, False, AMasterContext.MasterBSPersistence,
          LMasterProp.GetName, AMasterContext.MasterPropertyPath);
      // If relation HasOne
      rtHasOne:
        PersistObject(LMasterProp.GetRelationChildObject(AMasterContext.DataObject), LMasterProp.GetRelationChildPropertyName,
          AMasterContext.GetProperties.GetIdProperty.GetValue(AMasterContext.DataObject).AsInteger, False, AMasterContext.MasterBSPersistence,
          LMasterProp.GetName, AMasterContext.MasterPropertyPath);
    end;
  end;
end;

class procedure TioStrategyDB.PreProcessRelationChildOnPersist(const AMasterContext: IioContext);
//var
//  LMasterProp: IioProperty;
begin
  inherited;
//  // Loop for all properties
//  for LMasterProp in AMasterContext.GetProperties do
//    // If the property is write enabled and has a BelongsTo relation...
//    if LMasterProp.IsDBWriteEnabled and (LMasterProp.GetRelationType = rtBelongsTo) then
//      PersistObject(LMasterProp.GetRelationChildObject(AMasterContext.DataObject), '', 0, False, AMasterContext.MasterBSPersistence, LMasterProp.GetName,
//        AMasterContext.MasterPropertyPath);
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
  AResolvedTypeList: IioResolvedTypeList;
  AResolvedTypeName: String;
  AContext: IioContext;
  ATransactionCollection: IioTransactionCollection;
  // Nested
  procedure NestedLoadToMemTable;
  var
    LQry: IioQuery;
  begin
    // Create & open query
    LQry := TioDBFactory.QueryEngine.GetQuerySelectList(AContext);
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
  AResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(AWhere.TypeName, AWhere.TypeAlias, rmAllDistinctByConnectionAndTable);
  // Get the transaction collection
  ATransactionCollection := TioDBFactory.TransactionCollection;
  try
    // Loop for all classes in the sesolved type list
    for AResolvedTypeName in AResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      AContext := TioContextFactory.Context(AResolvedTypeName, AWhere, nil, nil, '', '');
      // Start transaction
      ATransactionCollection.StartTransaction(AContext.GetTable.GetConnectionDefName);
      // Load the current class data into the list
      NestedLoadToMemTable;
    end;
    // Commit ALL transactions
    ATransactionCollection.CommitAll;
  except
    // Rollback ALL transactions
    ATransactionCollection.RollbackAll;
    raise;
  end;
end;

class procedure TioStrategyDB.LoadList(const AWhere: IioWhere; const AList: TObject);
var
  AResolvedTypeList: IioResolvedTypeList;
  AResolvedTypeName: String;
  AContext: IioContext;
  ATransactionCollection: IioTransactionCollection;
  ADuckTypedList: IioDuckTypedList;
  // Nested
  procedure NestedLoadToList;
  var
    AQuery: IioQuery;
    AObj: TObject;
  begin
    // Create & open query
    AQuery := TioDBFactory.QueryEngine.GetQuerySelectList(AContext);
    AQuery.Open;
    try
      // Loop
      while not AQuery.Eof do
      begin
        // Clean the DataObject (it contains the previous)
        AContext.DataObject := nil;
        // Create the object as TObject
        AObj := TioObjectMakerFactory.GetObjectMaker(AContext.IsTrueClass).MakeObject(AContext, AQuery);
        // Add current object to the list
        ADuckTypedList.Add(AObj);
        // Next
        AQuery.Next;
      end;
    finally
      // Close query
      AQuery.Close;
    end;
  end;

begin
  inherited;
  // Resolve the type and alias
  AResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(AWhere.TypeName, AWhere.TypeAlias, rmAllDistinctByConnectionAndTable);
  // Wrap the list into a DuckTypedList
  ADuckTypedList := TioDuckTypedFactory.DuckTypedList(AList);
  // Get the transaction collection
  ATransactionCollection := TioDBFactory.TransactionCollection;
  try
    // Loop for all classes in the sesolved type list
    for AResolvedTypeName in AResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      AContext := TioContextFactory.Context(AResolvedTypeName, AWhere, nil, nil, '', '');
      // Start transaction
      ATransactionCollection.StartTransaction(AContext.GetTable.GetConnectionDefName);
      // Load the current class data into the list
      NestedLoadToList;
    end;
    // Commit ALL transactions
    ATransactionCollection.CommitAll;
  except
    // Rollback ALL transactions
    ATransactionCollection.RollbackAll;
    raise;
  end;
end;

class procedure TioStrategyDB.UpdateObject(const AContext: IioContext);
var
  LQuery: IioQuery;
begin
  inherited;
  // Create and execute the query to update the entity into the DB cheking the version to avoid concurrrency
  // conflict (if versioning is enabled for this type of entity)
  LQuery := TioDBFactory.QueryEngine.GetQueryUpdate(AContext);
  if LQuery.ExecSQL > 0 then
    AContext.ObjVersion := AContext.TransactionTimestamp
  else
    raise EioConcurrencyConflictException.Create(Self.ClassName, 'UpdateObject', AContext);
end;

end.
