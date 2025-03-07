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
  FireDAC.Comp.DataSet, iORM.LiveBindings.BSPersistence, iORM.CommonTypes, iORM.Auth.Interfaces;

type

  // TODO: HTTP connection - le eccezioni (almeno alcune come l'eliminazione del cliente dell'ordine delle pizze che causa un fk error) non vengono fuori ma le ritorno solo come errore 505 o similare.

  // Strategy class for database
  TioPersistenceStrategyHttp = class(TioPersistenceStrategyIntf)
  private
    class procedure _DoDeleteObject(const APSRequest: IioPersistenceStrategyRequest); static;
  protected
    // ========== BEGIN OF METHODS TO BE OVERRIDED FROM CONCRETE PERSISTENCE STRATEGIES ==========
    // persistence
    // ---------- Begin intercepted methods (CRUD Interceptors) ----------
    class procedure _DoDeleteList(const APSRequest: IioPersistenceStrategyRequest); override
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
    class procedure _DoLoadObjVersion(const APSRequest: IioPersistenceStrategyRequest); override;
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
    // Auth
    class procedure _DoAuth_Access(const APSRequest: IioPersistenceStrategyRequest); override;
    class procedure _DoAuth_App(const APSRequest: IioPersistenceStrategyRequest); override;
    class procedure _DoAuth_NewAccessToken(const APSRequest: IioPersistenceStrategyRequest); override;
    class procedure _DoAuth_RefreshAccessToken(const APSRequest: IioPersistenceStrategyRequest); override;
    class procedure _DoAuth_User(const APSRequest: IioPersistenceStrategyRequest); override;
    // ========== END OF METHODS TO BE OVERRIDED FROM CONCRETE PERSISTENCE STRATEGIES ==========
  end;

implementation

uses
  System.JSON, iORM, System.Classes, iORM.PersistenceStrategy.DB, iORM.DB.ConnectionContainer,
  iORM.DB.Factory, System.Generics.Collections, iORM.Utilities,
  iORM.DuckTyped.Interfaces, iORM.Http.Interfaces, iORM.Http.Factory,
  iORM.Exceptions, System.SysUtils, FireDAC.Stan.Intf, FireDAC.Stan.StorageJSON,
  iORM.Context.Container, DJSON, iORM.Auth.Factory,
  iORM.SynchroStrategy.Custom;

{ TioStrategyHttp }

class procedure TioPersistenceStrategyHttp._DoLoadCount(const APSRequest: IioPersistenceStrategyRequest);
var
  LConnection: IioConnectionHttp;
begin
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(APSRequest.Connection).AsHttpConnection;
  // Start transaction
  // NB: In this strategy (HTTP) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.Execute(APSRequest);
    // Load the result
    APSRequest.ResultAsInteger := LConnection.ioResponseBody.JSONDataValue.AsType<Integer>;
    LConnection.Commit;
  except
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioPersistenceStrategyHttp._DoDelete(const APSRequest: IioPersistenceStrategyRequest);
var
  LConnection: IioConnectionHttp;
begin
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(APSRequest.Connection).AsHttpConnection;
  // Start transaction
  // Note: In this strategy (HTTP) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.Execute(APSRequest);
    LConnection.Commit;
  except
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioPersistenceStrategyHttp._DoSynchronization(const APSRequest: IioPersistenceStrategyRequest);
var
  LConnection: IioConnectionHttp;
  LPayload: TioCustomSynchroStrategy_Payload;
begin
  // Extract the payload from the PSRequest & initialize it
  LPayload := APSRequest.Obj1 as TioCustomSynchroStrategy_Payload;
  LPayload.Initialize;
  // Client-side operations
  LPayload.LoadFromClient;
  // Server-side operations (LPayload.PersistAndReloadFromServer)
  LConnection := TioDBFactory.Connection(LPayload.TargetConnectionDefName).AsHttpConnection;
  LConnection.Execute(APSRequest);
  dj.FromJSON(LConnection.ioResponseBody.JSONDataValue).OpType(ssHTTP).byFields.ClearCollection.TypeAnnotationsON.&To(LPayload);
  // Client-side operations
  LPayload.PersistToClient;
  // Finalization
  LPayload.Finalize;
end;

class procedure TioPersistenceStrategyHttp._DoDeleteList(const APSRequest: IioPersistenceStrategyRequest);
var
  LConnection: IioConnectionHttp;
begin
  // Check
  if not Assigned(APSRequest.Obj1) then
    Exit;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(APSRequest.Connection).AsHttpConnection;
  // Start transaction
  // NB: In this strategy (HTTP) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.Execute(APSRequest);
    LConnection.Commit;
  except
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioPersistenceStrategyHttp._DoDeleteObject(const APSRequest: IioPersistenceStrategyRequest);
var
  LConnection: IioConnectionHttp;
begin
  // Check
  if not Assigned(AObj) then
    Exit;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(APSRequest.Connection).AsHttpConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.Execute(APSRequest);
    LConnection.Commit;
  except
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioPersistenceStrategyHttp._DoLoadDataSet(const APSRequest: IioPersistenceStrategyRequest);
var
  LConnection: IioConnectionHttp;
begin
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(APSRequest.Connection).AsHttpConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.Execute(HTTP_METHOD_NAME_LOADDATASET);
    // Load the detination dataset
    (APSRequest.Obj1 as TFDDataSet).LoadFromStream(LConnection.ioResponseBody.Stream, TFDStorageFormat.sfJSON);
    LConnection.Commit;
  except
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioPersistenceStrategyHttp._DoLoadList(const APSRequest: IioPersistenceStrategyRequest);
var
  LConnection: IioConnectionHttp;
begin
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(APSRequest.Connection).AsHttpConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.Execute(APSRequest);
    // Deserialize  the JSONDataValue to the result object
    // NB: Mauri 15/08/2023 (fix issue with paging when using http connection):
    //      Ho eliminato il "ClearCollection" dalla chiamata a DJSON perchè altrimenti non funzionava bene
    //      il paging ti tipo progressive. In questo modo invece sembra funzionare bene. Spero che la cosa non causi problemi
    //      in altri contesti. Lascio anche a vecchia versione commentata, poi vedremo.
//    dj.FromJSON(LConnection.ResponseBody.JSONDataValue).OpType(ssHTTP).byFields.ClearCollection.TypeAnnotationsON.&To(AList); // OLD CODE
    dj.FromJSON(LConnection.ioResponseBody.JSONDataValue).OpType(ssHTTP).byFields.TypeAnnotationsON.&To(APSRequest.Obj1);
    LConnection.Commit;
  except
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioPersistenceStrategyHttp._DoLoadObject(const APSRequest: IioPersistenceStrategyRequest);
var
  LConnection: IioConnectionHttp;
begin
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(APSRequest.Connection).AsHttpConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.Execute(APSRequest);
    // Deserialize  the JSONDataValue to the result object
    if Assigned(APSRequest.Obj1) then
      dj.FromJSON(LConnection.ioResponseBody.JSONDataValue).OpType(ssHTTP).byFields.ClearCollection.TypeAnnotationsON.&To(APSRequest.Obj1)
    else
      APSRequest.Obj1 := dj.FromJSON(LConnection.ioResponseBody.JSONDataValue).OpType(ssHTTP).byFields.ClearCollection.TypeAnnotationsON.ToObject;
    LConnection.Commit;
  except
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioPersistenceStrategyHttp._DoLoadObjectByClassOnly(const APSRequest: IioPersistenceStrategyRequest);
begin
  // This method is only used internally by the Object Maker then you do not need to implement it into http persistence strategy.
  raise EioGenericException.Create(Self.ClassName + ': "LoadObjectByClassOnly", method not implemented in this strategy.');
end;

class procedure TioPersistenceStrategyHttp._DoLoadObjVersion(const APSRequest: IioPersistenceStrategyRequest);
begin
  // This method is only used internally by DBPersistenceStrategy then you do not need to implement it into http persistence strategy.
  raise EioGenericException.Create(Self.ClassName + ': "DoLoadObjVersion", method not implemented in this strategy.');
end;

class procedure TioPersistenceStrategyHttp._DoLoadMax(const APSRequest: IioPersistenceStrategyRequest);
var
  LConnection: IioConnectionHttp;
begin
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(APSRequest.Connection).AsHttpConnection;
  // Start transaction
  // NB: In this strategy (HTTP) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.Execute(APSRequest);
    // Deserialize the JSONDataValue to the result object
    APSRequest.ResultAsInteger := LConnection.ioResponseBody.JSONDataValue.AsType<Integer>;
    LConnection.Commit;
  except
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioPersistenceStrategyHttp._DoLoadMin(const APSRequest: IioPersistenceStrategyRequest);
var
  LConnection: IioConnectionHttp;
begin
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(APSRequest.Connection).AsHttpConnection;
  // Start transaction
  // NB: In this strategy (HTTP) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.Execute(APSRequest);
    // Deserialize the JSONDataValue to the result object
    APSRequest.ResultAsInteger := LConnection.ioResponseBody.JSONDataValue.AsType<Integer>;
    LConnection.Commit;
  except
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioPersistenceStrategyHttp._DoPersistList(const APSRequest: IioPersistenceStrategyRequest);
var
  LConnection: IioConnectionHttp;
begin
  // Check
  if not Assigned(APSRequest.Obj1) then
    Exit;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(APSRequest.Connection).AsHttpConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.Execute(APSRequest);
    // Deserialize the JSONDataValue to update the object with the IDs (after Insert)
    if TioUtilities.BlindLevel_Do_AutoUpdateProps(APSRequest.BlindLevel) then
      dj.FromJSON(LConnection.ioResponseBody.JSONDataValue).OpType(ssHTTP).byFields.ClearCollection.TypeAnnotationsON.&To(APSRequest.Obj1);
    LConnection.Commit;
  except
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioPersistenceStrategyHttp._DoPersistObject(const APSRequest: IioPersistenceStrategyRequest);
var
  LConnection: IioConnectionHttp;
begin
  // Check
  if not Assigned(APSRequest.Obj1) then
    Exit;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(APSRequest.Connection).AsHttpConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.Execute(APSRequest);
    // Deserialize the JSONDataValue to update the object with the IDs (after Insert)
    if TioUtilities.BlindLevel_Do_AutoUpdateProps(APSRequest.BlindLevel) then
      dj.FromJSON(LConnection.ioResponseBody.JSONDataValue).OpType(ssHTTP).byFields.ClearCollection.TypeAnnotationsON.&To(APSRequest.Obj1);
    LConnection.Commit;
  except
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioPersistenceStrategyHttp._DoSQLDest_Execute(const APSRequest: IioPersistenceStrategyRequest);
var
  LConnection: IioConnectionHttp;
begin
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(ASQLDestination.GetConnectionDefName).AsHttpConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.Execute(APSRequest);
    LConnection.Commit;
  except
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioPersistenceStrategyHttp._DoSQLDest_LoadDataSet(const APSRequest: IioPersistenceStrategyRequest);
var
  LConnection: IioConnectionHttp;
begin
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(APSRequest.Connection).AsHttpConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.Execute(APSRequest);
    // Load the dataset
    (APSRequest.Obj1 as TFDDataSet).LoadFromStream(LConnection.ioResponseBody.Stream, TFDStorageFormat.sfJSON);
    LConnection.Commit;
  except
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioPersistenceStrategyHttp._DoStartTransaction(const APSRequest: IioPersistenceStrategyRequest);
begin
  // Nothing
end;

class procedure TioPersistenceStrategyHttp._DoCommitTransaction(const APSRequest: IioPersistenceStrategyRequest);
begin
  // Nothing
end;

class procedure TioPersistenceStrategyHttp._DoRollbackTransaction(const APSRequest: IioPersistenceStrategyRequest);
begin
  // Nothing
end;

class procedure TioPersistenceStrategyHttp._DoAuth_Access(const APSRequest: IioPersistenceStrategyRequest);
var
  LConnection: IioConnectionHttp;
begin
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(APSRequest.Connection).AsHttpConnection;
  // Start transaction
  // NB: In this strategy (HTTP) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.Execute(APSRequest);
    // Extract the AuthResponse
    APSReq.Intf1 := TioAuthFactory.NewAuthResponseFromString( LConnection.ioResponseBody.AuthResult1 );
    LConnection.Commit;
  except
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioPersistenceStrategyHttp._DoAuth_User(const APSRequest: IioPersistenceStrategyRequest);
var
  LConnection: IioConnectionHttp;
begin
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(APSRequest.Connection).AsHttpConnection;
  // Start transaction
  // NB: In this strategy (HTTP) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.Execute(APSRequest);
    // Extract the AuthResponse
    APSRequest.Intf1 := TioAuthFactory.NewAuthResponseFromString( LConnection.ioResponseBody.AuthResult1 );
    LConnection.Commit;
  except
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioPersistenceStrategyHttp._DoAuth_App(const APSRequest: IioPersistenceStrategyRequest);
begin
  // To be implemented
end;

class procedure TioPersistenceStrategyHttp._DoAuth_NewAccessToken(const APSRequest: IioPersistenceStrategyRequest);
var
  LConnection: IioConnectionHttp;
begin
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(APSRequest.Connection).AsHttpConnection;
  // Start transaction
  // NB: In this strategy (HTTP) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.Execute(APSRequest);
    // Extract the AuthResponse
    APSRequest.Intf1 := TioAuthFactory.NewAuthResponseFromString( LConnection.ioResponseBody.AuthResult1 );
    LConnection.Commit;
  except
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioPersistenceStrategyHttp._DoAuth_RefreshAccessToken(const APSRequest: IioPersistenceStrategyRequest);
var
  LConnection: IioConnectionHttp;
begin
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(APSRequest.Connection).AsHttpConnection;
  // Start transaction
  // NB: In this strategy (HTTP) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any http call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.Execute(APSRequest);
    // Extract the AuthResponse
    APSRequest.Intf1 := TioAuthFactory.NewAuthResponseFromString( LConnection.ioResponseBody.AuthResult1 );
    LConnection.Commit;
  except
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioPersistenceStrategyHttp._DoInTransaction(const APSRequest: IioPersistenceStrategyRequest);
begin
  // for http the result value is alway False
  APSRequest.ResultAsBoolean := False;
end;

end.
