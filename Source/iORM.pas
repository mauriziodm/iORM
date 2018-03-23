{***************************************************************************}
{                                                                           }
{           iORM - (interfaced ORM)                                         }
{                                                                           }
{           Copyright (C) 2015-2016 Maurizio Del Magno                      }
{                                                                           }
{           mauriziodm@levantesw.it                                         }
{           mauriziodelmagno@gmail.com                                      }
{           https://github.com/mauriziodm/iORM.git                          }
{                                                                           }
{                                                                           }
{***************************************************************************}
{                                                                           }
{  This file is part of iORM (Interfaced Object Relational Mapper).         }
{                                                                           }
{  Licensed under the GNU Lesser General Public License, Version 3;         }
{  you may not use this file except in compliance with the License.         }
{                                                                           }
{  iORM is free software: you can redistribute it and/or modify             }
{  it under the terms of the GNU Lesser General Public License as published }
{  by the Free Software Foundation, either version 3 of the License, or     }
{  (at your option) any later version.                                      }
{                                                                           }
{  iORM is distributed in the hope that it will be useful,                  }
{  but WITHOUT ANY WARRANTY; without even the implied warranty of           }
{  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            }
{  GNU Lesser General Public License for more details.                      }
{                                                                           }
{  You should have received a copy of the GNU Lesser General Public License }
{  along with iORM.  If not, see <http://www.gnu.org/licenses/>.            }
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
  System.TypInfo, System.Classes, Data.Bind.ObjectScope, ObjMapper,
  System.SysUtils;

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
    class procedure AutoCreateDatabase(const AConnectionName:String=''; const RaiseExceptionIfNotAvailable:Boolean=True); overload;
    class procedure AutoCreateDatabase(const RaiseExceptionIfNotAvailable:Boolean); overload;   // Default connection only
    class function Connections: TioConnectionManagerRef;
    class function Where: IioWhere; overload;
    class function Where<T>: IioWhere<T>; overload;
    class function Where(const ATextCondition:String): IioWhere; overload;
    class function Where<T>(const ATextCondition:String): IioWhere<T>; overload;
    class function SQL(const ASQL:String): IioSQLDestination; overload;
    class function SQL(const ASQLDestination:IioSQLDestination): IioSQLDestination; overload;
    class function Mapper:omRef;
    class procedure SetWaitProc(const AShowWaitProc:TProc=nil; const AHideWaitProc:TProc=nil);
    class procedure ShowWait;
    class procedure HideWait;
    class procedure TerminateApplication;
    class procedure HandleException(Sender: TObject);
  end;

implementation

uses
{$IFDEF ioVCL}
  Vcl.Forms,
{$ELSE}
  FMX.Forms,
{$ENDIF}
  iORM.DuckTyped.Interfaces,
  iORM.DuckTyped.Factory,
  iORM.DuckTyped.StreamObject,
  iORM.Attributes,
  iORM.Exceptions,
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

class procedure io.SetWaitProc(const AShowWaitProc: TProc;
  const AHideWaitProc: TProc);
begin
  TioConnectionManager.SetShowHideWaitProc(AShowWaitProc, AHideWaitProc);
end;

class procedure io.ShowWait;
begin
  TioConnectionManager.ShowWaitProc;
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

class procedure io.AutoCreateDatabase(const AConnectionName:String; const RaiseExceptionIfNotAvailable:Boolean);
begin
  // The AutoCreateDatabase feature is available only for SQLite database
//&&&&  if TioConnectionManager.GetConnectionInfo(AConnectionName).ConnectionType = cdtSQLite then
  if TioConnectionManager.GetConnectionInfo(AConnectionName).DbPeculiarity.AutoCreateDatabase then
    TioDBCreatorFactory.GetDBCreator.AutoCreateDatabase
  else if RaiseExceptionIfNotAvailable then
    raise EioException.Create(ClassName + ':  "AutoCreateDatabase" feature is available for SQLite RDBMS only.');
end;

class procedure io.AutoCreateDatabase(
  const RaiseExceptionIfNotAvailable: Boolean);
begin
  AutoCreateDatabase('', RaiseExceptionIfNotAvailable);
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

class procedure io.HandleException(Sender: TObject);
begin
  Application.HandleException(Sender);
end;

class procedure io.HideWait;
begin
  TioConnectionManager.HideWaitProc;
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

class procedure io.TerminateApplication;
begin
  Application.Terminate;
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















