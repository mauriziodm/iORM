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
unit iORM.PersistenceStrategy.Http;

interface

uses
  iORM.PersistenceStrategy.Interfaces, iORM.Where.Interfaces, iORM.DB.Interfaces,
  FireDAC.Comp.DataSet, iORM.LiveBindings.BSPersistence, iORM.CommonTypes;

type

  // Strategy class for database
  TioPersistenceStrategyHttp = class(TioPersistenceStrategyIntf)
  private
    // class var FTransactionGUID: String; NB: Hint prevention "symbol declared but never used"
    // class function NewGUIDAsString: String; NB: Hint prevention "symbol declared but never used" (codice presente sotto)
    // class function GetTransactionGUID: String;
  protected
    // ---------- Begin intercepted methods (StrategyInterceptors) ----------
    class procedure _DoPersistObject(const AObj: TObject; const AIntent: TioPersistenceIntentType; const ARelationPropertyName: String; const ARelationOID: Integer;
      const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String; const ABlindLevel: Byte); override;
    class procedure _DoPersistList(const AList: TObject; const AIntent: TioPersistenceIntentType; const ARelationPropertyName: String; const ARelationOID: Integer;
      const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String; const ABlindLevel: Byte); override;
    class procedure _DoDeleteObject(const AObj: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte); override;
    class procedure _DoDeleteList(const AList: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte); override;
    class procedure _DoLoadList(const AWhere: IioWhere; const AList: TObject; const AIntent: TioPersistenceIntentType); override;
    class function _DoLoadObject(const AWhere: IioWhere; const AObj: TObject; const AIntent: TioPersistenceIntentType): TObject; override;
    // ---------- End intercepted methods (StrategyInterceptors) ----------
  public
    class procedure StartTransaction(const AConnectionName: String); override;
    class procedure CommitTransaction(const AConnectionName: String); override;
    class procedure RollbackTransaction(const AConnectionName: String); override;
    class function InTransaction(const AConnectionName: String): boolean; override;
    class procedure Delete(const AWhere: IioWhere); override;
    class function LoadObjectByClassOnly(const AWhere: IioWhere; const AObj: TObject; const AIntent: TioPersistenceIntentType): TObject; override;
    class procedure LoadDataSet(const AWhere: IioWhere; const ADestDataSet: TFDDataSet); override;
    class function Count(const AWhere: IioWhere): Integer; override;
    // SQLDestinations
    class procedure SQLDest_LoadDataSet(const ASQLDestination: IioSQLDestination; const ADestDataSet: TFDDataSet); override;
    class procedure SQLDest_Execute(const ASQLDestination: IioSQLDestination); override;
  end;

implementation

uses
  System.JSON, iORM, System.Classes, iORM.PersistenceStrategy.DB, iORM.DB.ConnectionContainer,
  iORM.DB.Factory, System.Generics.Collections, iORM.Utilities,
  iORM.DuckTyped.Interfaces, iORM.Http.Interfaces, iORM.Http.Factory,
  iORM.Exceptions, System.SysUtils, FireDAC.Stan.Intf, FireDAC.Stan.StorageJSON,
  iORM.Context.Container, DJSON;

{ TioStrategyHttp }

// class function TioStrategyREST.GetTransactionGUID: String;
// begin
// // Set the fixed part of the TransactionGUID if empty
// if FTransactionGUID.IsEmpty then
// FTransactionGUID := Self.NewGUIDAsString;
// // Generate a TransactionGUID (Fixed GUID + Current thread ID
// Result := System.Classes.TThread.CurrentThread.ThreadID.ToString + '-' + FTransactionGUID;
// end;

// class function TioStrategyREST.NewGUIDAsString: String;
// var
// LGUID: TGUID;
// begin
// CreateGUID(LGUID);
// Result := GUIDToString(LGUID);
// end;

class function TioPersistenceStrategyHttp.Count(const AWhere: IioWhere): Integer;
var
  LConnection: IioConnectionHttp;
begin
  inherited;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection('').AsHttpConnection;
  // Start transaction
  // NB: In this strategy (HTTP) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.ioRequestBody.Clear;
    LConnection.ioRequestBody.Where := AWhere;
    LConnection.Execute('Count');
    // Deserialize the JSONDataValue to the result object
    Result := LConnection.ioResponseBody.JSONDataValue.AsType<Integer>;
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioPersistenceStrategyHttp.Delete(const AWhere: IioWhere);
var
  LConnection: IioConnectionHttp;
begin
  inherited;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection('').AsHttpConnection;
  // Start transaction
  // Note: In this strategy (HTTP) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.ioRequestBody.Clear;
    LConnection.ioRequestBody.Where := AWhere;
    LConnection.Execute('Delete');
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioPersistenceStrategyHttp._DoDeleteList(const AList: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte);
var
  LConnection: IioConnectionHttp;
begin
  inherited;
  // Check
  if not Assigned(AList) then
    Exit;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection('').AsHttpConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.ioRequestBody.Clear;
    LConnection.ioRequestBody.JSONDataValueAsObject := AList;
    LConnection.Execute('PersistCollection');
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioPersistenceStrategyHttp._DoDeleteObject(const AObj: TObject; const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte);
var
  LConnectionDefName: String;
  LConnection: IioConnectionHttp;
begin
  inherited;
  // Check
  if not Assigned(AObj) then
    Exit;
  // Get the connection, set the request and execute it
  LConnectionDefName := TioMapContainer.GetConnectionDefName(AObj.ClassName);
  LConnection := TioDBFactory.Connection(LConnectionDefName).AsHttpConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.ioRequestBody.Clear;
    LConnection.ioRequestBody.JSONDataValueAsObject := AObj;
    LConnection.Execute('DeleteObject');
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioPersistenceStrategyHttp.LoadDataSet(const AWhere: IioWhere; const ADestDataSet: TFDDataSet);
var
  LConnection: IioConnectionHttp;
begin
  inherited;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection('').AsHttpConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.ioRequestBody.Clear;
    LConnection.ioRequestBody.Where := AWhere;
    LConnection.Execute('LoadDataSet');
    // Load the dataset
    ADestDataSet.LoadFromStream(LConnection.ioResponseBody.Stream, TFDStorageFormat.sfJSON);
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioPersistenceStrategyHttp._DoLoadList(const AWhere: IioWhere; const AList: TObject; const AIntent: TioPersistenceIntentType);
var
  LConnection: IioConnectionHttp;
begin
  inherited;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection('').AsHttpConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.ioRequestBody.Clear;
    LConnection.ioRequestBody.Where := AWhere;
    LConnection.Execute(HTTP_METHOD_NAME_LOADLIST);
    // Deserialize  the JSONDataValue to the result object
    // NB: Mauri 15/08/2023 (fix issue winth paging when using http connection):
    //      Ho eliminato il "ClearCollection" dalla chiamata a DJSON perchè altrimenti non funzionava bene
    //      il paging ti tipo progressive. In questo modo invece sembra funzionare bene. Spero che la cosa non causi problemi
    //      in altri contesti. Lascio anche a vecchia versione commentata, poi vedremo.
//    dj.FromJSON(LConnection.ResponseBody.JSONDataValue).OpType(ssHTTP).byFields.ClearCollection.TypeAnnotationsON.&To(AList); // OLD CODE
    dj.FromJSON(LConnection.ioResponseBody.JSONDataValue).OpType(ssHTTP).byFields.TypeAnnotationsON.&To(AList);
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
    raise;
  end;
end;

class function TioPersistenceStrategyHttp._DoLoadObject(const AWhere: IioWhere; const AObj: TObject; const AIntent: TioPersistenceIntentType): TObject;
var
  LConnection: IioConnectionHttp;
begin
  inherited;
  Result := AObj;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection('').AsHttpConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.ioRequestBody.Clear;
    LConnection.ioRequestBody.Where := AWhere;
    LConnection.Execute('LoadObject');
    // Deserialize  the JSONDataValue to the result object
    if Assigned(AObj) then
      dj.FromJSON(LConnection.ioResponseBody.JSONDataValue).OpType(ssHTTP).byFields.ClearCollection.TypeAnnotationsON.&To(Result)
    else
      Result := dj.FromJSON(LConnection.ioResponseBody.JSONDataValue).OpType(ssHTTP).byFields.ClearCollection.TypeAnnotationsON.ToObject;
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
    raise;
  end;
end;

class function TioPersistenceStrategyHttp.LoadObjectByClassOnly(const AWhere: IioWhere; const AObj: TObject; const AIntent: TioPersistenceIntentType): TObject;
begin
  // This method is only used internally by the Object Maker,
  // and then you do not need to implement it in RESTStrategy.
  raise EioException.Create(Self.ClassName + ': "LoadObjectByClassOnly", method not implemented in this strategy.');
end;

{ TODO : DA AGGIUNGERE GESTIONE DEI 3 PARAMETRI AGGIUNTI ALLA FINE PER IL SUD }
class procedure TioPersistenceStrategyHttp._DoPersistList(const AList: TObject; const AIntent: TioPersistenceIntentType; const ARelationPropertyName: String; const ARelationOID: Integer;
      const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String; const ABlindLevel: Byte);
var
  LConnection: IioConnectionHttp;
begin
  inherited;
  // Check
  if not Assigned(AList) then
    Exit;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection('').AsHttpConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.ioRequestBody.Clear;
    LConnection.ioRequestBody.RelationPropertyName := ARelationPropertyName;
    LConnection.ioRequestBody.RelationOID := ARelationOID;
    LConnection.ioRequestBody.BlindLevel := ABlindLevel;
    LConnection.ioRequestBody.JSONDataValueAsObject := AList;
    LConnection.Execute('PersistCollection');
    // Deserialize the JSONDataValue to update the object with the IDs (after Insert)
    if TioUtilities.BlindLevel_Do_AutoUpdateProps(ABlindLevel) then
      dj.FromJSON(LConnection.ioResponseBody.JSONDataValue).OpType(ssHTTP).byFields.ClearCollection.TypeAnnotationsON.&To(AList);
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
    raise;
  end;
end;

{ TODO : DA AGGIUNGERE GESTIONE DEI 3 PARAMETRI AGGIUNTI ALLA FINE PER IL SUD }
class procedure TioPersistenceStrategyHttp._DoPersistObject(const AObj: TObject; const AIntent: TioPersistenceIntentType; const ARelationPropertyName: String; const ARelationOID: Integer;
      const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String; const ABlindLevel: Byte);
var
  LConnectionDefName: String;
  LConnection: IioConnectionHttp;
begin
  inherited;
  // Check
  if not Assigned(AObj) then
    Exit;
  // Get the connection, set the request and execute it
  LConnectionDefName := TioMapContainer.GetConnectionDefName(AObj.ClassName);
  LConnection := TioDBFactory.Connection(LConnectionDefName).AsHttpConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.ioRequestBody.Clear;
    LConnection.ioRequestBody.RelationPropertyName := ARelationPropertyName;
    LConnection.ioRequestBody.RelationOID := ARelationOID;
    LConnection.ioRequestBody.BlindLevel := ABlindLevel;
    LConnection.ioRequestBody.JSONDataValueAsObject := AObj;
    LConnection.Execute('PersistObject');
    // Deserialize the JSONDataValue to update the object with the IDs (after Insert)
    if TioUtilities.BlindLevel_Do_AutoUpdateProps(ABlindLevel) then
      dj.FromJSON(LConnection.ioResponseBody.JSONDataValue).OpType(ssHTTP).byFields.ClearCollection.TypeAnnotationsON.&To(AObj);
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioPersistenceStrategyHttp.SQLDest_Execute(const ASQLDestination: IioSQLDestination);
var
  LConnection: IioConnectionHttp;
begin
  inherited;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(ASQLDestination.GetConnectionDefName).AsHttpConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.ioRequestBody.Clear;
    LConnection.ioRequestBody.SQLDestination := ASQLDestination;
    LConnection.Execute('SQLDestExecute');
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioPersistenceStrategyHttp.SQLDest_LoadDataSet(const ASQLDestination: IioSQLDestination; const ADestDataSet: TFDDataSet);
var
  LConnection: IioConnectionHttp;
begin
  inherited;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection('').AsHttpConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.ioRequestBody.Clear;
    LConnection.ioRequestBody.SQLDestination := ASQLDestination;
    LConnection.Execute('SQLDestLoadDataSet');
    // Load the dataset
    ADestDataSet.LoadFromStream(LConnection.ioResponseBody.Stream, TFDStorageFormat.sfJSON);
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioPersistenceStrategyHttp.StartTransaction(const AConnectionName: String);
begin
  inherited;
  TioDBFactory.Connection(AConnectionName).StartTransaction;
end;

class procedure TioPersistenceStrategyHttp.CommitTransaction(const AConnectionName: String);
begin
  inherited;
  TioDBFactory.Connection(AConnectionName).Commit;
end;

class procedure TioPersistenceStrategyHttp.RollbackTransaction(const AConnectionName: String);
begin
  inherited;
  TioDBFactory.Connection(AConnectionName).Rollback;
end;

class function TioPersistenceStrategyHttp.InTransaction(const AConnectionName: String): boolean;
begin
  inherited;
  Result := TioDBFactory.Connection(AConnectionName).InTransaction;
end;

end.
