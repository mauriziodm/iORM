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

  // iORM
  io = class
  public
    class function GlobalFactory: TioGlobalFactoryRef;
    class function di: TioDependencyInjectionRef;
    class function RefTo(const ATypeName:String; const ATypeAlias:String=''): IioWhere; overload;
    class function RefTo(const AClassRef:TioClassRef; const ATypeAlias:String=''): IioWhere; overload;
    class function RefTo<T>(const ATypeAlias:String=''): IioWhere<T>; overload;
    class function RefTo(const AWhere:IioWhere): IioWhere; overload;
    class function Load(const ATypeName:String; const ATypeAlias:String=''): IioWhere; overload;
    class function Load(const ATypeInfo:PTypeInfo; const ATypeAlias:String=''): IioWhere; overload;
    class function Load(const AClassRef:TioClassRef; const ATypeAlias:String=''): IioWhere; overload;
    class function Load<T>(const ATypeAlias:String=''): IioWhere<T>; overload;
    class function Load(const AWhere:IioWhere): IioWhere; overload;
    class procedure Delete(const AObj: TObject; const AConnectionName:String=''); overload;
    class procedure Delete(const AIntfObj: IInterface; const AConnectionName:String=''); overload;
    class procedure Persist(const AObj: TObject; const ARelationPropertyName:String; const ARelationOID:Integer; const ABlindInsert:Boolean; const AConnectionName:String); overload;
    class procedure Persist(const AObj: TObject; const ABlindInsert:Boolean=False); overload;
    class procedure Persist(const AObj: TObject; const AConnectionName:String; const ABlindInsert:Boolean=False); overload;
    class procedure Persist(const AIntfObj: IInterface; const ABlindInsert:Boolean=False); overload;
    class procedure Persist(const AIntfObj: IInterface; const AConnectionName:String; const ABlindInsert:Boolean=False); overload;
    class procedure PersistCollection(const ACollection: TObject; const ABlindInsert:Boolean=False); overload;
    class procedure PersistCollection(const ACollection: TObject; const AConnectionName:String; const ABlindInsert:Boolean=False); overload;
    class procedure PersistCollection(const AIntfCollection: IInterface; const ABlindInsert:Boolean=False); overload;
    class procedure PersistCollection(const AIntfCollection: IInterface; const AConnectionName:String; const ABlindInsert:Boolean=False); overload;
    class procedure StartTransaction(const AConnectionName:String='');
    class procedure CommitTransaction(const AConnectionName:String='');
    class procedure RollbackTransaction(const AConnectionName:String='');
    class procedure AutoCreateDatabase(const RaiseExceptionIfNotAvailable:Boolean=True);  // Default connection only for the moment
    class function Connections: TioConnectionManagerRef;
    class function Where: IioWhere; overload;
    class function Where<T>: IioWhere<T>; overload;
    class function Where(const ATextCondition:String): IioWhere; overload;
    class function Where<T>(const ATextCondition:String): IioWhere<T>; overload;
    class function SQL(const ASQL:String): IioSQLDestination; overload;
    class function SQL(const ASQLDestination:IioSQLDestination): IioSQLDestination; overload;
    class function Mapper:omRef;
    class function NewThreadSafe<T>(const AObj:T; const AOwnObj:Boolean=True): IioThreadSafe<T>;
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
  iORM.DB.DBCreator.Factory, iORM.Rtti.Utilities, iORM.Strategy.Factory,
  iORM.Context.Container;


{ io }

class function io.Load(const ATypeName, ATypeAlias: String): IioWhere;
begin
  Result := TioWhereFactory.NewWhere;
  Result.TypeName := ATypeName;
  Result.TypeAlias := ATypeAlias;
  Result.TypeInfo := nil;
end;

class function io.Load(const AWhere: IioWhere): IioWhere;
begin
  Result := AWhere;
end;

class function io.Load<T>(const ATypeAlias:String): IioWhere<T>;
begin
  Result := TioWhereFactory.NewWhere<T>;
  Result.TypeName := TioRttiUtilities.GenericToString<T>;
  Result.TypeAlias := ATypeAlias;
  Result.TypeInfo := TypeInfo(T);
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

class function io.Mapper: omRef;
begin
  Result := ObjMapper.om;
end;

class function io.NewThreadSafe<T>(const AObj: T;
  const AOwnObj: Boolean): IioThreadSafe<T>;
begin
  Result := TioThreadSafe<T>.Create(AObj, AOwnObj);
end;

class procedure io.Persist(const AObj: TObject; const ARelationPropertyName:String; const ARelationOID:Integer; const ABlindInsert:Boolean; const AConnectionName:String);
begin
  // Get the strategy and call the proper funtionality
  TioStrategyFactory.GetStrategy(AConnectionName).PersistObject(AObj, ARelationPropertyName, ARelationOID, ABlindInsert, AConnectionName);
end;

class procedure io.Persist(const AIntfObj: IInterface; const ABlindInsert:Boolean);
begin
  Self.Persist(AIntfObj as TObject, ABlindInsert);
end;

class procedure io.PersistCollection(const ACollection: TObject; const ABlindInsert:Boolean);
begin
  // Redirect to the internal PersistCollection_Internal (same of PersistRelationChildList)
  TioStrategyFactory.GetStrategy('').PersistCollection(ACollection, '', 0, ABlindInsert, '');
end;

class procedure io.Persist(const AObj: TObject;
  const ABlindInsert: Boolean);
begin
  Self.Persist(AObj, '', 0, ABlindInsert, '');
end;

class procedure io.Persist(const AObj: TObject; const AConnectionName: String;
  const ABlindInsert: Boolean);
begin
  Self.Persist(AObj, '', 0, ABlindInsert, AConnectionName);
end;

class procedure io.Persist(const AIntfObj: IInterface;
  const AConnectionName: String; const ABlindInsert: Boolean);
begin
  Self.Persist(AIntfObj as TObject, AConnectionName, ABlindInsert);
end;

class procedure io.PersistCollection(const AIntfCollection: IInterface; const ABlindInsert:Boolean);
begin
  Self.PersistCollection(AIntfCollection as TObject, ABlindInsert);
end;

class procedure io.PersistCollection(const ACollection: TObject;
  const AConnectionName: String; const ABlindInsert: Boolean);
begin
  // Redirect to the internal PersistCollection_Internal (same of PersistRelationChildList)
  TioStrategyFactory.GetStrategy('').PersistCollection(ACollection, '', 0, ABlindInsert, AConnectionName);
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
  TioStrategyFactory.GetStrategy(AConnectionName).RollbackTransaction(AConnectionName);
end;

class function io.SQL(const ASQL: String): IioSQLDestination;
begin
  Result := TioDBFactory.SQLDestination(ASQL);
end;

class function io.SQL(
  const ASQLDestination: IioSQLDestination): IioSQLDestination;
begin
  Result := ASQLDestination;
end;

class procedure io.StartTransaction(const AConnectionName:String);
begin
  TioStrategyFactory.GetStrategy(AConnectionName).StartTransaction(AConnectionName);
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
  TioStrategyFactory.GetStrategy(AConnectionName).CommitTransaction(AConnectionName);
end;

class function io.Connections: TioConnectionManagerRef;
begin
  Result := Self.GlobalFactory.DBFactory.ConnectionManager;
end;

class procedure io.Delete(const AObj: TObject; const AConnectionName:String='');
begin
  TioStrategyFactory.GetStrategy(AConnectionName).DeleteObject(AObj, AConnectionName);
end;

class procedure io.Delete(const AIntfObj: IInterface; const AConnectionName:String='');
begin
  Self.Delete(AIntfObj as TObject, AConnectionName);
end;

class function io.di: TioDependencyInjectionRef;
begin
  Result := TioDependencyInjection;
end;

class function io.GlobalFactory: TioGlobalFactoryRef;
begin
  Result := TioGlobalFactory;
end;

class function io.Load(const AClassRef:TioClassRef; const ATypeAlias:String): IioWhere;
begin
  Result := Self.Load(AClassref.ClassInfo, ATypeAlias);
end;

class function io.Load(const ATypeInfo: PTypeInfo;
  const ATypeAlias: String): IioWhere;
begin
  Result := TioWhereFactory.NewWhere;
  Result.TypeName := TioRttiUtilities.TypeInfoToTypeName(ATypeInfo);
  Result.TypeAlias := ATypeAlias;
  Result.TypeInfo := ATypeInfo;
end;

class procedure io.PersistCollection(const AIntfCollection: IInterface;
  const AConnectionName: String; const ABlindInsert: Boolean);
begin
  Self.PersistCollection(AIntfCollection as TObject, AConnectionName, ABlindInsert);
end;

class function io.RefTo(const AWhere: IioWhere): IioWhere;
begin
  Result := Self.Load(AWhere);
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

  // Create the ContextXontainer Instance and Init it by loading
  //  all entities declarated in the application
  TioMapContainer.Build;

end.








