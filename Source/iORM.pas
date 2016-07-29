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



unit iORM;

interface

uses
  iORM.DependencyInjection,
  iORM.Context.Properties.Interfaces,
  iORM.context.interfaces,
  iORM.Context.Factory,
  iORM.CommonTypes,
  iORM.DB.Interfaces,
  iORM.LiveBindings.Interfaces,
  iORM.Global.Factory,
  iORM.DB.ConnectionContainer, iORM.Where.Interfaces, iORM.Where.Factory,
  System.TypInfo, System.Classes, Data.Bind.ObjectScope, ObjMapper;

type

  // TObject class helper
  TioTObjectHelper = class helper for TObject
  public
    procedure ioPersist;
    procedure ioDelete;
    function ioAsInterface<T:IInterface>: T;
  end;

  // TioBaseBindSource class helper (PrototypeBindSource and so on)
  TioBindSourceHelper = class helper for TioBaseBindSource
  public
    function ioGetDetailBindSourceAdapter(const AOwner:TComponent; const AMasterPropertyName:String; const AWhere: IioWhere = nil): TBindSourceAdapter;
    function ioGetNaturalObjectBindSourceAdapter(const AOwner:TComponent): TBindSourceAdapter;
    procedure Append;
  end;

  // iORM
  io = class
  strict protected
    class procedure PersistObject(const AContext:IioContext; const ARelationPropertyName:String=''; const ARelationOID:Integer=0; const ABlindInsert:Boolean=False);
    class procedure InsertObject(const AContext:IioContext; const ABlindInsert:Boolean);
    class procedure UpdateObject(const AContext:IioContext);
    class procedure DeleteObject(const AContext:IioContext);
    class procedure PreProcessRelationChild(const AContext:IioContext);
    class procedure PostProcessRelationChild(const AContext:IioContext);
    class procedure PersistRelationChildList(const AMasterContext:IioContext; const AMasterProperty:IioContextProperty);
    class procedure PersistRelationChildObject(const AMasterContext:IioContext; const AMasterProperty:IioContextProperty);
    class procedure PersistCollection_Internal(const ACollection:TObject; const ARelationPropertyName:String=''; const ARelationOID:Integer=0; const ABlindInsert:Boolean=False);
    class function ObjectExists(const AContext:IioContext): Boolean;
  public
    class function GlobalFactory: TioGlobalFactoryRef;
    class function di: TioDependencyInjectionRef;
    class function RefTo(const ATypeName:String; const ATypeAlias:String=''): IioWhere; overload;
    class function RefTo(const AClassRef:TioClassRef; const ATypeAlias:String=''): IioWhere; overload;
    class function RefTo<T>(const ATypeAlias:String=''): IioWhere<T>; overload;
    class function Load(const ATypeName:String; const ATypeAlias:String=''): IioWhere; overload;
    class function Load(const ATypeInfo:PTypeInfo; const ATypeAlias:String=''): IioWhere; overload;
    class function Load(const AClassRef:TioClassRef; const ATypeAlias:String=''): IioWhere; overload;
    class function Load<T>(const ATypeAlias:String=''): IioWhere<T>; overload;
    class procedure Delete(const AObj: TObject); overload;
    class procedure Delete(const AIntfObj: IInterface); overload;
    class procedure Persist(const AObj: TObject; const ARelationPropertyName:String; const ARelationOID:Integer; const ABlindInsert:Boolean=False); overload;
    class procedure Persist(const AObj: TObject; const ABlindInsert:Boolean=False); overload;
    class procedure Persist(const AIntfObj: IInterface; const ABlindInsert:Boolean=False); overload;
    class procedure PersistCollection(const ACollection: TObject; const ABlindInsert:Boolean=False); overload;
    class procedure PersistCollection(const AIntfCollection: IInterface; const ABlindInsert:Boolean=False); overload;
    class procedure StartTransaction(const AConnectionName:String='');
    class procedure CommitTransaction(const AConnectionName:String='');
    class procedure RollbackTransaction(const AConnectionName:String='');
    class procedure AutoCreateDatabase(const RaiseExceptionIfNotAvailable:Boolean=True);
    class function Connections: TioConnectionManagerRef;
    class function Where: IioWhere; overload;
    class function Where<T>: IioWhere<T>; overload;
    class function Where(const ATextCondition:String): IioWhere; overload;
    class function Where<T>(const ATextCondition:String): IioWhere<T>; overload;
    class function SQL(const ASQL:String): IioSQLDestination;
    class function Mapper:omRef;
  end;

implementation

uses
  iORM.DuckTyped.Interfaces,
  iORM.DuckTyped.Factory,
  iORM.DuckTyped.StreamObject,
  iORM.Attributes,
  iORM.Exceptions,
  System.SysUtils,
  iORM.DB.Factory,
  iORM.DB.DBCreator.Factory, iORM.Rtti.Utilities;


{ io }

class function io.Load(const ATypeName, ATypeAlias: String): IioWhere;
begin
  Result := TioWhereFactory.NewWhere;
  Result.SetType(ATypeName, ATypeAlias, nil);
end;

class function io.Load<T>(const ATypeAlias:String): IioWhere<T>;
begin
  Result := TioWhereFactory.NewWhere<T>;
  Result.SetType(TioRttiUtilities.GenericToString<T>, ATypeAlias, TypeInfo(T));
end;

class function io.Where: IioWhere;
begin
  Result := TioWhereFactory.NewWhere;
end;

class function io.Where(const ATextCondition: String): IioWhere;
begin
  Result := Self.Where.Add(ATextCondition);
end;

class function io.Where<T>(const ATextCondition: String): IioWhere<T>;
begin
  Result := Self.Where<T>.Add(ATextCondition);
end;

class function io.Where<T>: IioWhere<T>;
begin
  Result := TioWhereFactory.NewWhere<T>;
end;

class function io.ObjectExists(const AContext: IioContext): Boolean;
var
  AQuery: IioQuery;
begin
  // Generate and open the query
  AQuery := TioDbFactory.QueryEngine.GetQueryForExists(AContext);
  AQuery.Open;
  try
    Result := AQuery.Fields[0].AsInteger <> 0;
  finally
    AQuery.Close;
  end;
end;

class function io.Mapper: omRef;
begin
  Result := ObjMapper.om;
end;

class procedure io.Persist(const AObj: TObject; const ARelationPropertyName:String; const ARelationOID:Integer; const ABlindInsert:Boolean);
var
  AContext: IioContext;
begin
  // Check
  if not Assigned(AObj) then Exit;
  // Create Context
  AContext := TioContextFactory.Context(AObj.ClassName, nil, AObj);
  // Execute
  Self.PersistObject(AContext, ARelationPropertyName, ARelationOID, ABlindInsert);
end;

class procedure io.Persist(const AIntfObj: IInterface; const ABlindInsert:Boolean);
begin
  Self.Persist(AIntfObj as TObject, ABlindInsert);
end;

class procedure io.PersistCollection(const ACollection: TObject; const ABlindInsert:Boolean);
begin
  // Redirect to the internal PersistCollection_Internal (same of PersistRelationChildList)
  PersistCollection_Internal(ACollection, '', 0, ABlindInsert);
end;

class procedure io.Persist(const AObj: TObject;
  const ABlindInsert: Boolean);
begin
  Self.Persist(AObj, '', 0, ABlindInsert);
end;

class procedure io.PersistCollection(const AIntfCollection: IInterface; const ABlindInsert:Boolean);
begin
  Self.PersistCollection(AIntfCollection as TObject, ABlindInsert);
end;

class procedure io.PersistCollection_Internal(const ACollection: TObject;
  const ARelationPropertyName: String; const ARelationOID: Integer; const ABlindInsert:Boolean);
var
  ADuckTypedList: IioDuckTypedList;
  AObj: TObject;
  AContext: IioContext;
begin
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
  Self.StartTransaction;
  try
    // Wrap the DestList into a DuckTypedList
    ADuckTypedList := TioDuckTypedFactory.DuckTypedList(ACollection);
    // Loop the list
    for AObj in ADuckTypedList do
    begin
      // Create context for current object
      AContext := TioContextFactory.Context(AObj.ClassName, nil, AObj);
      // Persist object
      Self.PersistObject(AContext
                        , ARelationPropertyName
                        , ARelationOID
                        , ABlindInsert
                        );
    end;

    Self.CommitTransaction;
  except
    Self.RollbackTransaction;
    raise;
  end;
end;

class procedure io.PersistRelationChildList(const AMasterContext:IioContext; const AMasterProperty:IioContextProperty);
begin
  // Redirect to the internal PersistCollection_Internal (same of PersistCollection)
  PersistCollection_Internal( AMasterProperty.GetRelationChildObject(AMasterContext.DataObject)
                            , AMasterProperty.GetRelationChildPropertyName
                            , AMasterContext.GetProperties.GetIdProperty.GetValue(AMasterContext.DataObject).AsInteger
                            );
end;

class procedure io.PersistRelationChildObject(const AMasterContext: IioContext;
  const AMasterProperty: IioContextProperty);
var
  AObj: TObject;
  AContext: IioContext;
begin
  // Get the child object
  AObj := AMasterProperty.GetRelationChildObject(AMasterContext.DataObject);
  // Create context for current child object
  AContext := TioContextFactory.Context(AObj.ClassName, nil, AObj);
  // Persist object
  Self.PersistObject(AContext
                    , AMasterProperty.GetRelationChildPropertyName
                    , AMasterContext.GetProperties.GetIdProperty.GetValue(AMasterContext.DataObject).AsInteger
                    );
end;

class procedure io.PreProcessRelationChild(const AContext: IioContext);
var
  Prop: IioContextProperty;
begin
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

class procedure io.PostProcessRelationChild(const AContext: IioContext);
var
  Prop: IioContextProperty;
begin
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

class procedure io.PersistObject(const AContext:IioContext; const ARelationPropertyName:String=''; const ARelationOID:Integer=0; const ABlindInsert:Boolean=False);
begin
  Self.StartTransaction(AContext.GetConnectionDefName);
  try
    // Set/Update MasterID property if this is a relation child object (HasMany, HasOne, BelongsTo)
    if  (ARelationPropertyName <> '')
    and (ARelationOID <> 0)
    and (AContext.GetProperties.GetPropertyByName(ARelationPropertyName).GetRelationType = ioRTNone) // Altrimenti in alcuni casi particolare dava errori
      then AContext.GetProperties.GetPropertyByName(ARelationPropertyName).SetValue(AContext.DataObject, ARelationOID);
    // PreProcess (persist) relation childs (BelongsTo)
    Self.PreProcessRelationChild(AContext);
    // Process the current object
    // --------------------------
    case AContext.ObjectStatus of
      // DIRTY
      //  If the ID property of the object is not assigned
      //  then insert the object else update
      //  If the object is not present in the database then perform
      //  an Insert instead of an Update to prevent a data loss
      osDirty:
      begin
//        if (AContext.GetProperties.GetIdProperty.GetValue(AContext.DataObject).AsInteger <> IO_INTEGER_NULL_VALUE)
        if (not ABlindInsert) and (not AContext.IDIsNull) and Self.ObjectExists(AContext) then
          Self.UpdateObject(AContext)
        else
          Self.InsertObject(AContext, ABlindInsert);
        AContext.ObjectStatus := osClean;
      end;
      // DELETE
      osDeleted: begin
        Self.DeleteObject(AContext);
        AContext.ObjectStatus := osClean;
      end;
    end;
    // --------------------------
    // PostProcess (persist) relation childs (HasMany, HasOne)
    Self.PostProcessRelationChild(AContext);

    Self.CommitTransaction(AContext.GetConnectionDefName);
  except
    Self.RollbackTransaction(AContext.GetConnectionDefName);
    raise;
  end;
end;

class function io.RefTo(const AClassRef: TioClassRef; const ATypeAlias:String=''): IioWhere;
begin
  Result := Self.Load(AClassRef, ATypeAlias);
end;

class function io.RefTo(const ATypeName, ATypeAlias: String): IioWhere;
begin
  Result := Self.Load(ATypeName, ATypeAlias);
end;

class function io.RefTo<T>(const ATypeAlias:String=''): IioWhere<T>;
begin
  Result := Self.Load<T>(ATypeAlias);
end;

class procedure io.RollbackTransaction(const AConnectionName:String);
begin
  TioDBFactory.Connection(AConnectionName).Rollback;
end;

class function io.SQL(const ASQL: String): IioSQLDestination;
begin
  Result := TioDBFactory.SQLDestination(ASQL);
end;

class procedure io.StartTransaction(const AConnectionName:String);
begin
  TioDBFactory.Connection(AConnectionName).StartTransaction;
end;

class procedure io.UpdateObject(const AContext: IioContext);
var
  AQuery: IioQuery;
begin
  // Create and execute query
  TioDbFactory.QueryEngine.GetQueryUpdate(AContext).ExecSQL;
end;

class procedure io.AutoCreateDatabase(const RaiseExceptionIfNotAvailable:Boolean);
begin
  // The AutoCreateDatabase feature is available only for SQLite database
  if TioConnectionManager.GetConnectionInfo.ConnectionType = cdtSQLite then
    TioDBCreatorFactory.GetDBCreator.AutoCreateDatabase
  else if RaiseExceptionIfNotAvailable then
    raise EioException.Create(ClassName + ':  "AutoCreateDatabase" feature is available for SQLite RDBMS only.');
end;

class procedure io.CommitTransaction(const AConnectionName:String);
begin
  TioDBFactory.Connection(AConnectionName).Commit;
end;

class function io.Connections: TioConnectionManagerRef;
begin
  Result := Self.GlobalFactory.DBFactory.ConnectionManager;
end;

class procedure io.Delete(const AObj: TObject);
var
  AContext: IioContext;
begin
  // Check
  if not Assigned(AObj) then Exit;
  // Create Context
  AContext := TioContextFactory.Context(AObj.ClassName, nil, AObj);
  // Execute
  Self.DeleteObject(AContext);
end;

class procedure io.Delete(const AIntfObj: IInterface);
begin
  Self.Delete(AIntfObj as TObject);
end;

class procedure io.DeleteObject(const AContext: IioContext);
begin
  // Create and execute query
  TioDbFactory.QueryEngine.GetQueryDelete(AContext).ExecSQL;
end;

class function io.di: TioDependencyInjectionRef;
begin
  Result := TioDependencyInjection;
end;

class function io.GlobalFactory: TioGlobalFactoryRef;
begin
  Result := TioGlobalFactory;
end;

class procedure io.InsertObject(const AContext: IioContext; const ABlindInsert:Boolean);
var
  AQuery: IioQuery;
  NextID: Integer;
begin
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

class function io.Load(const AClassRef:TioClassRef; const ATypeAlias:String): IioWhere;
begin
  Result := Self.Load(AClassref.ClassInfo, ATypeAlias);
end;

class function io.Load(const ATypeInfo: PTypeInfo;
  const ATypeAlias: String): IioWhere;
begin
  Result := TioWhereFactory.NewWhere;
  Result.SetType(TioRttiUtilities.TypeInfoToTypeName(ATypeInfo), ATypeAlias, ATypeInfo);
end;

{ TioTObjectHelper }

procedure TioTObjectHelper.ioDelete;
begin
  io.Delete(Self);
end;

function TioTObjectHelper.ioAsInterface<T>: T;
begin
  if not Supports(Self, GetTypeData(TypeInfo(T))^.Guid, Result) then
    raise EioException.Create(Self.ClassName + ': interface non implemented by object!');
end;

procedure TioTObjectHelper.ioPersist;
begin
  io.Persist(Self);
end;

{ TioBindSourceHelper }

procedure TioBindSourceHelper.Append;
begin
  Self.InternalAdapter.Append;
end;

function TioBindSourceHelper.ioGetDetailBindSourceAdapter(
  const AOwner: TComponent; const AMasterPropertyName: String;
  const AWhere: IioWhere): TBindSourceAdapter;
var
  AContainedBSA: IioContainedBindSourceAdapter;
begin
  Result := nil;
  if Supports(Self.InternalAdapter, IioContainedBindSourceAdapter, AContainedBSA) then
    Result := AContainedBSA.NewDetailBindSourceAdapter(AOwner, AMasterPropertyName, AWhere);
end;

function TioBindSourceHelper.ioGetNaturalObjectBindSourceAdapter(
  const AOwner: TComponent): TBindSourceAdapter;
begin
  Result := (Self.InternalAdapter as IioNaturalBindSourceAdapterSource).NewNaturalObjectBindSourceAdapter(AOwner);
end;



initialization

  // Initialize the dependency injection container
  TioDependencyInjectionContainer.Build;

  // Register as default DuckTypedStreamObject invoker
  //  NB: L'ho messo qui perchè altrimenti nella unit dove è dichiarata la classe non
  //       venive eseguito
  io.di.RegisterClass<TioDuckTypedStreamObject>
                        .Implements<IioDuckTypedStreamObject>
                        .DisableMapImplemetersRef  // Evita un AV error probabilmente causato dal fatto che i vari containers della parte ORM non sono ancora a posto
                        .Execute;
end.








