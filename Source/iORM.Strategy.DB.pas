{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2016 Maurizio Del Magno                           }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  Licensed under the Apache License, Version 2.0 (the "License");          }
{  you may not use this file except in compliance with the License.         }
{  You may obtain a copy of the License at                                  }
{                                                                           }
{      http://www.apache.org/licenses/LICENSE-2.0                           }
{                                                                           }
{  Unless required by applicable law or agreed to in writing, software      }
{  distributed under the License is distributed on an "AS IS" BASIS,        }
{  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{  See the License for the specific language governing permissions and      }
{  limitations under the License.                                           }
{                                                                           }
{***************************************************************************}



unit iORM.Strategy.DB;

interface

uses
  iORM.Strategy.Interfaces, iORM.Context.Interfaces,
  iORM.Context.Properties.Interfaces, iORM.Where.Interfaces;

type

  // Strategy class for database
  TioStrategyDB = class(TioStrategyIntf)
  protected
    class procedure InsertObject(const AContext:IioContext; const ABlindInsert:Boolean);
    class procedure UpdateObject(const AContext:IioContext);
    class procedure DeleteObject_Internal(const AContext:IioContext);
    class procedure PreProcessRelationChild(const AContext:IioContext);
    class procedure PostProcessRelationChild(const AContext:IioContext);
    class procedure PersistRelationChildList(const AMasterContext:IioContext; const AMasterProperty:IioContextProperty);
    class procedure PersistRelationChildObject(const AMasterContext:IioContext; const AMasterProperty:IioContextProperty);
    class function ObjectExists(const AContext:IioContext): Boolean;
  public
    class procedure StartTransaction(const AConnectionName:String); override;
    class procedure CommitTransaction(const AConnectionName:String); override;
    class procedure RollbackTransaction(const AConnectionName:String); override;
    class procedure PersistObject(const AObj: TObject; const ARelationPropertyName:String; const ARelationOID:Integer; const ABlindInsert:Boolean; const AConnectionName:String); override;
    class procedure PersistCollection(const ACollection:TObject; const ARelationPropertyName:String; const ARelationOID:Integer; const ABlindInsert:Boolean; const AConnectionName:String); override;
    class procedure DeleteObject(const AObj: TObject; const AConnectionName:String); override;
    class procedure Delete(const AWhere: IioWhere); override;
    class procedure LoadList(const AWhere: IioWhere; const AList:TObject); override;
    class function LoadObject(const AWhere: IioWhere; const AObj:TObject): TObject; override;
  end;

implementation

uses
  iORM.Context.Factory, iORM.CommonTypes, iORM.Attributes, iORM.DB.Interfaces,
  iORM.DB.ConnectionContainer, iORM.DB.Factory, iORM.DuckTyped.Interfaces,
  iORM.DuckTyped.Factory, iORM.Resolver.Interfaces, iORM.ObjectsForge.Factory,
  iORM.LazyLoad.Factory, iORM.Resolver.Factory, iORM.Where.Factory;

{ TioStrategyDB }

class procedure TioStrategyDB.CommitTransaction(const AConnectionName: String);
begin
  inherited;
  TioDBFactory.Connection(AConnectionName).Commit;
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
      AQuery := TioDbFactory.QueryEngine.GetQueryDelete(AContext);
      AQuery.ExecSQL;
    end;
begin
  inherited;
  // Resolve the type and alias
  AResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(AWhere.TypeName, AWhere.TypeAlias, rmAll);
  // Get the transaction collection
  ATransactionCollection := TioDBFactory.TransactionCollection;
  try
    // Loop for all classes in the sesolved type list
    for AResolvedTypeName in AResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      AContext := TioContextFactory.Context(AResolvedTypeName, AWhere);
      // Start transaction
      ATransactionCollection.StartTransaction(AContext.GetConnectionDefName);
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

class procedure TioStrategyDB.DeleteObject(const AObj: TObject; const AConnectionName:String);
var
  AContext: IioContext;
begin
  inherited;
  // Check
  if not Assigned(AObj) then Exit;
  // Create Context
  AContext := TioContextFactory.Context(AObj.ClassName, nil, AObj, AConnectionName);
  // Execute
  Self.DeleteObject_Internal(AContext);
end;

class procedure TioStrategyDB.DeleteObject_Internal(const AContext: IioContext);
begin
  inherited;
  // Create and execute query
  TioDbFactory.QueryEngine.GetQueryDelete(AContext).ExecSQL;
end;

class procedure TioStrategyDB.InsertObject(const AContext: IioContext;
  const ABlindInsert: Boolean);
var
  AQuery: IioQuery;
  NextID: Integer;
begin
  inherited;
  // -----------------------------------------------------------
  // Get and execute a query to retrieve the next ID for the inserting object
  //  before the insert query (for Firebird/Interbase)
  if (not ABlindInsert) and (TioConnectionManager.GetConnectionInfo.ConnectionType = cdtFirebird) and AContext.IDIsNull then
  begin
    AQuery := TioDBFActory.QueryEngine.GetQueryNextID(AContext);
    try
      AQuery.Open;
      // Set the NextID as the ObjectID
      AContext.GetProperties.GetIdProperty.SetValue(
        AContext.DataObject,
        AQuery.Fields[0].AsInteger
      );
    finally
      AQuery.Close;
    end;
  end;
  // -----------------------------------------------------------

  // Create and execute insert query
  TioDbFactory.QueryEngine.GetQueryInsert(AContext).ExecSQL;

  // -----------------------------------------------------------
  // Get and execute a query to retrieve the last ID generated
  //  in the last insert query.
  if (not ABlindInsert) and ((TioConnectionManager.GetConnectionInfo.ConnectionType = cdtSQLite) or (TioConnectionManager.GetConnectionInfo.ConnectionType = cdtSQLServer))
    and AContext.IDIsNull then
  begin
    AQuery := TioDBFActory.QueryEngine.GetQueryNextID(AContext);
    try
      AQuery.Open;
      // Set the NextID as the ObjectID
      AContext.GetProperties.GetIdProperty.SetValue(
        AContext.DataObject,
        AQuery.Fields[0].AsInteger
      );
    finally
      AQuery.Close;
    end;
  end;
  // -----------------------------------------------------------
end;

class function TioStrategyDB.LoadObject(const AWhere: IioWhere;
  const AObj: TObject): TObject;
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
      AQuery := TioDbFactory.QueryEngine.GetQuerySelectForList(AContext);
      AQuery.Open;
      try
        // If a record is fuìound then load the object and return True
        if not AQuery.Eof then
          // Create the object as TObject
          Result := TioObjectMakerFactory.GetObjectMaker(AContext.IsClassFromField).MakeObject(AContext, AQuery);
      finally
        // Close query
        AQuery.Close;
      end;
    end;
begin
  inherited;
  // if it is a LazyLoad....
  if AWhere.IsLazy then
    Exit(   TioLazyLoadFactory.LazyLoadObject(AWhere.TypeInfo, AWhere.TypeName, AWhere.TypeAlias, '', 0, AWhere) as TObject   );
  // Resolve the type and alias
  AResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(AWhere.TypeName, AWhere.TypeAlias, rmAll);
  // Get the transaction collection
  ATransactionCollection := TioDBFactory.TransactionCollection;
  try
    // Loop for all classes in the sesolved type list
    for AResolvedTypeName in AResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      AContext := TioContextFactory.Context(AResolvedTypeName, AWhere, AObj);
      // Start transaction
      ATransactionCollection.StartTransaction(AContext.GetConnectionDefName);
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

class function TioStrategyDB.ObjectExists(const AContext: IioContext): Boolean;
var
  AQuery: IioQuery;
begin
  inherited;
  // Generate and open the query
  AQuery := TioDbFactory.QueryEngine.GetQueryForExists(AContext);
  AQuery.Open;
  try
    Result := AQuery.Fields[0].AsInteger <> 0;
  finally
    AQuery.Close;
  end;
end;

class procedure TioStrategyDB.PersistCollection(const ACollection: TObject;
  const ARelationPropertyName: String; const ARelationOID: Integer;
  const ABlindInsert: Boolean; const AConnectionName:String);
var
  ADuckTypedList: IioDuckTypedList;
  AObj: TObject;
begin
  inherited;
  // NB: Qui avvio la transazione per fare in modo che tutto il Persist di tutti gli oggetti contenuti
  //      nella collection vengano persistiti o annullati ma poi ogni chiamata a PersistObject riavvia
  //      una transazione per l'oggetto singolo (che non avrà praticamente effetto perchè inglobata
  //      da quella avviata qua sotto.
  //      Nel caso particolare in cui uno o più singoli oggetti contenuti dela collection siano di una
  //      qualche classe che opera su una ConnectionDef diversa da quella di default verrà avviata (all'interno
  //      della chiamata a "PersistObject" una transazione sulla Connection diversa da quella di default e quindi
  //      al di fuori della transazione principale sulla connessione di default avviata qui sotto e in pratica
  //      per questi oggetti ogni chiamata a "PersistObject" verrà eseguita nel contesto di una singola transazione
  //      slegata dalle altre e quindi è possibile che (solo in questo specifico e particolare caso) alcune operazioni
  //      vadano a buon fine mentre altre no.
  //      AL momento non ho una soluzione al problema.
  // NB: Qui non posso conoscere con certezza il tipo di oggetti realmente contenuto nella collection
  //      in quanto il tipo reale dell'oggetto potrebbe essere diverso dal genericType della lista stessa
  //      (a maggior ragione nel caso di una TList<IInterface> di interfacce, quindi avvio una transazione
  //      sulla connessione di default che va bene nel 99% delle volte (raramente l'applicazione dichiererà classi
  //      che operano su Database diversi contemporaneamente.
  Self.StartTransaction(AConnectionName);
  try
    // Wrap the DestList into a DuckTypedList
    ADuckTypedList := TioDuckTypedFactory.DuckTypedList(ACollection);
    // Loop the list
    for AObj in ADuckTypedList do
    begin
      // Persist object
      Self.PersistObject(AObj
                        , ARelationPropertyName
                        , ARelationOID
                        , ABlindInsert
                        , AConnectionName
                        );
    end;

    Self.CommitTransaction(AConnectionName);
  except
    Self.RollbackTransaction(AConnectionName);
    raise;
  end;
end;

class procedure TioStrategyDB.PersistObject(const AObj: TObject;
  const ARelationPropertyName: String; const ARelationOID: Integer;
  const ABlindInsert: Boolean; const AConnectionName:String);
var
  LContext: IioContext;
begin
  inherited;
  // Check
  if not Assigned(AObj) then Exit;
  // Create Context (Create a dummy ioWhere first to pass ConnectionName parameter only).
  LContext := TioContextFactory.Context(AObj.ClassName, nil, AObj, AConnectionName);
  // Start transaction
  Self.StartTransaction(LContext.GetConnectionDefName);
  try
    // Set/Update MasterID property if this is a relation child object (HasMany, HasOne, BelongsTo)
    if  (ARelationPropertyName <> '')
    and (ARelationOID <> 0)
    and (LContext.GetProperties.GetPropertyByName(ARelationPropertyName).GetRelationType = ioRTNone) // Altrimenti in alcuni casi particolare dava errori
      then LContext.GetProperties.GetPropertyByName(ARelationPropertyName).SetValue(LContext.DataObject, ARelationOID);
    // PreProcess (persist) relation childs (BelongsTo)
    Self.PreProcessRelationChild(LContext);
    // Process the current object
    // --------------------------
    case LContext.ObjectStatus of
      // DIRTY
      //  If the ID property of the object is not assigned
      //  then insert the object else update
      //  If the object is not present in the database then perform
      //  an Insert instead of an Update to prevent a data loss
      osDirty:
      begin
//        if (AContext.GetProperties.GetIdProperty.GetValue(AContext.DataObject).AsInteger <> IO_INTEGER_NULL_VALUE)
        if (not ABlindInsert) and (not LContext.IDIsNull) and Self.ObjectExists(LContext) then
          Self.UpdateObject(LContext)
        else
          Self.InsertObject(LContext, ABlindInsert);
        LContext.ObjectStatus := osClean;
      end;
      // DELETE
      osDeleted: begin
        Self.DeleteObject_Internal(LContext);
        LContext.ObjectStatus := osClean;
      end;
    end;
    // --------------------------
    // PostProcess (persist) relation childs (HasMany, HasOne)
    Self.PostProcessRelationChild(LContext);
    // Commit
    Self.CommitTransaction(LContext.GetConnectionDefName);
  except
    // Rollback
    Self.RollbackTransaction(LContext.GetConnectionDefName);
    raise;
  end;
end;

class procedure TioStrategyDB.PersistRelationChildList(
  const AMasterContext: IioContext; const AMasterProperty: IioContextProperty);
begin
  // Redirect to the internal PersistCollection_Internal (same of PersistCollection)
  Self.PersistCollection( AMasterProperty.GetRelationChildObject(AMasterContext.DataObject)
                         , AMasterProperty.GetRelationChildPropertyName
                         , AMasterContext.GetProperties.GetIdProperty.GetValue(AMasterContext.DataObject).AsInteger
                         , False // Blind
                         , AMasterContext.GetConnectionDefName
                         );
end;

class procedure TioStrategyDB.PersistRelationChildObject(
  const AMasterContext: IioContext; const AMasterProperty: IioContextProperty);
var
  AObj: TObject;
begin
  // Get the child object
  AObj := AMasterProperty.GetRelationChildObject(AMasterContext.DataObject);
  // Persist object
  Self.PersistObject(AObj
                    , AMasterProperty.GetRelationChildPropertyName
                    , AMasterContext.GetProperties.GetIdProperty.GetValue(AMasterContext.DataObject).AsInteger
                    , False // Blind
                    , AMasterContext.GetConnectionDefName
                    );
end;

class procedure TioStrategyDB.PostProcessRelationChild(
  const AContext: IioContext);
var
  Prop: IioContextProperty;
begin
  inherited;
  // Loop for all properties
  for Prop in AContext.GetProperties do
  begin
    // If the property is not WriteEnabled then skip it
    if not Prop.IsWriteEnabled then Continue;
    case Prop.GetRelationType of
      // If relation HasBelongsToOne
      ioRTBelongsTo: {Nothing};
      // If relation HasMany
      ioRTHasMany: PersistRelationChildList(AContext, Prop);
      // If relation HasOne
      ioRTHasOne: PersistRelationChildObject(AContext, Prop);
    end;
  end;
end;

class procedure TioStrategyDB.PreProcessRelationChild(
  const AContext: IioContext);
var
  Prop: IioContextProperty;
begin
  inherited;
  // Loop for all properties
  for Prop in AContext.GetProperties do
  begin
    // If the property is not WriteEnabled then skip it
    if not Prop.IsWriteEnabled then Continue;
    case Prop.GetRelationType of
      // If relation BelongsTo: persist the child object to retrieve the ID (if new object or ID changed)
      ioRTBelongsTo: begin
//        io.Persist(Prop.GetRelationChildObject(AContext.DataObject));
        {Nothing}  // Non persiste più nulla in caso di relazione BelongsTo
      end;
      // If relation HasMany
      ioRTHasMany: {Nothing};
      // If relation HasOne
      ioRTHasOne: {Nothing};
    end;
  end;
end;

class procedure TioStrategyDB.RollbackTransaction(
  const AConnectionName: String);
begin
  inherited;
  TioDBFactory.Connection(AConnectionName).Rollback;
end;

class procedure TioStrategyDB.StartTransaction(const AConnectionName: String);
begin
  inherited;
  TioDBFactory.Connection(AConnectionName).StartTransaction;
end;

class procedure TioStrategyDB.LoadList(const AWhere: IioWhere;
  const AList: TObject);
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
      AQuery := TioDbFactory.QueryEngine.GetQuerySelectForList(AContext);
      AQuery.Open;
      try
        // Loop
        while not AQuery.Eof do
        begin
          // Clean the DataObject (it contains the previous)
          AContext.DataObject := nil;
          // Create the object as TObject
          AObj := TioObjectMakerFactory.GetObjectMaker(AContext.IsClassFromField).MakeObject(AContext, AQuery);
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
  AResolvedTypeList := TioResolverFactory.GetResolver(rsByDependencyInjection).Resolve(AWhere.TypeName, AWhere.TypeAlias, rmAll);
  // Wrap the list into a DuckTypedList
  ADuckTypedList := TioDuckTypedFactory.DuckTypedList(AList);
  // Get the transaction collection
  ATransactionCollection := TioDBFactory.TransactionCollection;
  try
    // Loop for all classes in the sesolved type list
    for AResolvedTypeName in AResolvedTypeList do
    begin
      // Get the Context for the current ResolverTypeName
      AContext := TioContextFactory.Context(AResolvedTypeName, AWhere);
      // Start transaction
      ATransactionCollection.StartTransaction(AContext.GetConnectionDefName);
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
  AQuery: IioQuery;
begin
  inherited;
  // Create and execute query
  TioDbFactory.QueryEngine.GetQueryUpdate(AContext).ExecSQL;
end;

end.
