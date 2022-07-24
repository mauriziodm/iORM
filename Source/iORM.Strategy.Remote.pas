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

unit iORM.Strategy.Remote;

interface

uses
  iORM.Strategy.Interfaces, iORM.Where.Interfaces, iORM.DB.Interfaces,
  FireDAC.Comp.DataSet, iORM.LiveBindings.BSPersistence;

type

  // Strategy class for database
  TioStrategyRemote = class(TioStrategyIntf)
  private
    // class var FTransactionGUID: String; NB: Hint prevention "symbol declared but never used"
    // class function NewGUIDAsString: String; NB: Hint prevention "symbol declared but never used" (codice presente sotto)
    // class function GetTransactionGUID: String;
  public
    class procedure StartTransaction(const AConnectionName: String); override;
    class procedure CommitTransaction(const AConnectionName: String); override;
    class procedure RollbackTransaction(const AConnectionName: String); override;
    class function InTransaction(const AConnectionName: String): boolean; override;
    class procedure PersistObject(const AObj: TObject; const ARelationPropertyName: String; const ARelationOID: Integer; const ABlindInsert: boolean;
      const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String); override;
    class procedure PersistCollection(const ACollection: TObject; const ARelationPropertyName: String; const ARelationOID: Integer; const ABlindInsert: boolean;
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
  System.JSON, iORM, System.Classes, iORM.Strategy.DB, iORM.DB.ConnectionContainer,
  iORM.DB.Factory, System.Generics.Collections, iORM.Utilities,
  iORM.DuckTyped.Interfaces, iORM.Remote.Interfaces, iORM.Remote.Factory,
  iORM.Exceptions, System.SysUtils, FireDAC.Stan.Intf, FireDAC.Stan.StorageJSON,
  iORM.Context.Container, DJSON;

{ TioStrategyRemote }

class procedure TioStrategyRemote.CommitTransaction(const AConnectionName: String);
begin
  inherited;
  TioDBFactory.Connection(AConnectionName).Commit;
end;

class function TioStrategyRemote.Count(const AWhere: IioWhere): Integer;
var
  LConnection: IioConnectionRemote;
begin
  inherited;
  Result := 0;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection('').AsRemoteConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any remote call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.RequestBody.Clear;
    LConnection.RequestBody.Where := AWhere;
    LConnection.Execute('Count');
    // Deserialize the JSONDataValue to the result object
    // M.M. 12/06/21
    Result := LConnection.ResponseBody.JSONDataValue.AsType<Integer>;
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
  end;
end;

class procedure TioStrategyRemote.Delete(const AWhere: IioWhere);
var
  LConnection: IioConnectionRemote;
begin
  inherited;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection('').AsRemoteConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any remote call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.RequestBody.Clear;
    LConnection.RequestBody.Where := AWhere;
    LConnection.Execute('Delete');
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
  end;
end;

class procedure TioStrategyRemote.DeleteCollection(const ACollection: TObject);
var
  LConnection: IioConnectionRemote;
begin
  inherited;
  // Check
  if not Assigned(ACollection) then
    Exit;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection('').AsRemoteConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any remote call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.RequestBody.Clear;
    LConnection.RequestBody.DataObject := ACollection;
    LConnection.Execute('PersistCollection');
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
  end;
end;

class procedure TioStrategyRemote.DeleteObject(const AObj: TObject);
var
  LConnectionDefName: String;
  LConnection: IioConnectionRemote;
begin
  inherited;
  // Check
  if not Assigned(AObj) then
    Exit;
  // Get the connection, set the request and execute it
  LConnectionDefName := TioMapContainer.GetConnectionDefName(AObj.ClassName);
  LConnection := TioDBFactory.Connection(LConnectionDefName).AsRemoteConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any remote call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.RequestBody.Clear;
    LConnection.RequestBody.DataObject := AObj;
    LConnection.Execute('DeleteObject');
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
  end;
end;

class function TioStrategyRemote.InTransaction(const AConnectionName: String): boolean;
begin
  inherited;
  Result := TioDBFactory.Connection(AConnectionName).InTransaction;
end;

// class function TioStrategyREST.GetTransactionGUID: String;
// begin
// // Set the fixed part of the TransactionGUID if empty
// if FTransactionGUID.IsEmpty then
// FTransactionGUID := Self.NewGUIDAsString;
// // Generate a TransactionGUID (Fixed GUID + Current thread ID
// Result := System.Classes.TThread.CurrentThread.ThreadID.ToString + '-' + FTransactionGUID;
// end;

class procedure TioStrategyRemote.LoadDataSet(const AWhere: IioWhere; const ADestDataSet: TFDDataSet);
var
  LConnection: IioConnectionRemote;
begin
  inherited;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection('').AsRemoteConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any remote call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.RequestBody.Clear;
    LConnection.RequestBody.Where := AWhere;
    LConnection.Execute('LoadDataSet');
    // Load the dataset
    ADestDataSet.LoadFromStream(LConnection.ResponseBody.Stream, TFDStorageFormat.sfJSON);
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
  end;
end;

class procedure TioStrategyRemote.LoadList(const AWhere: IioWhere; const AList: TObject);
var
  LConnection: IioConnectionRemote;
begin
  inherited;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection('').AsRemoteConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any remote call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.RequestBody.Clear;
    LConnection.RequestBody.Where := AWhere;
    LConnection.Execute('LoadList');
    // Deserialize  the JSONDataValue to the result object
    dj.FromJSON(LConnection.ResponseBody.JSONDataValue).byFields.ClearCollection.TypeAnnotationsON.&To(AList);
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
  end;
end;

class function TioStrategyRemote.LoadObject(const AWhere: IioWhere; const AObj: TObject): TObject;
var
  LConnection: IioConnectionRemote;
begin
  inherited;
  Result := nil;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection('').AsRemoteConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any remote call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.RequestBody.Clear;
    LConnection.RequestBody.Where := AWhere;
    LConnection.Execute('LoadObject');
    // Deserialize  the JSONDataValue to the result object
    if Assigned(AObj) then
      dj.FromJSON(LConnection.ResponseBody.JSONDataValue).byFields.ClearCollection.TypeAnnotationsON.&To(AObj)
    else
      Result := dj.FromJSON(LConnection.ResponseBody.JSONDataValue).byFields.ClearCollection.TypeAnnotationsON.ToObject;
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
  end;
end;

class function TioStrategyRemote.LoadObjectByClassOnly(const AWhere: IioWhere; const AObj: TObject): TObject;
begin
  // This method is only used internally by the Object Maker,
  // and then you do not need to implement it in RESTStrategy.
  raise EioException.Create(Self.ClassName + ': "LoadObjectByClassOnly", method not implemented in this strategy.');
end;

// class function TioStrategyREST.NewGUIDAsString: String;
// var
// LGUID: TGUID;
// begin
// CreateGUID(LGUID);
// Result := GUIDToString(LGUID);
// end;

{ TODO : DA AGGIUNGERE GESTIONE DEI 3 PARAMETRI AGGIUNTI ALLA FINE PER IL SUD }
class procedure TioStrategyRemote.PersistCollection(const ACollection: TObject; const ARelationPropertyName: String; const ARelationOID: Integer; const ABlindInsert: boolean;
      const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String);
var
  LConnection: IioConnectionRemote;
begin
  inherited;
  // Check
  if not Assigned(ACollection) then
    Exit;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection('').AsRemoteConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any remote call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.RequestBody.Clear;
    LConnection.RequestBody.RelationPropertyName := ARelationPropertyName;
    LConnection.RequestBody.RelationOID := ARelationOID;
    LConnection.RequestBody.BlindInsert := ABlindInsert;
    LConnection.RequestBody.DataObject := ACollection;
    LConnection.Execute('PersistCollection');
    // Deserialize the JSONDataValue to update the object with the IDs (after Insert)
    if not ABlindInsert then
      dj.FromJSON(LConnection.ResponseBody.JSONDataValue).byFields.ClearCollection.TypeAnnotationsON.&To(ACollection);
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
  end;
end;

{ TODO : DA AGGIUNGERE GESTIONE DEI 3 PARAMETRI AGGIUNTI ALLA FINE PER IL SUD }
class procedure TioStrategyRemote.PersistObject(const AObj: TObject; const ARelationPropertyName: String; const ARelationOID: Integer;
  const ABlindInsert: boolean; const AMasterBSPersistence: TioBSPersistence; const AMasterPropertyName, AMasterPropertyPath: String);
var
  LConnectionDefName: String;
  LConnection: IioConnectionRemote;
begin
  inherited;
  // Check
  if not Assigned(AObj) then
    Exit;
  // Get the connection, set the request and execute it
  LConnectionDefName := TioMapContainer.GetConnectionDefName(AObj.ClassName);
  LConnection := TioDBFactory.Connection(LConnectionDefName).AsRemoteConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any remote call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.RequestBody.Clear;
    LConnection.RequestBody.RelationPropertyName := ARelationPropertyName;
    LConnection.RequestBody.RelationOID := ARelationOID;
    LConnection.RequestBody.BlindInsert := ABlindInsert;
    LConnection.RequestBody.DataObject := AObj;
    LConnection.Execute('PersistObject');
    // Deserialize the JSONDataValue to update the object with the IDs (after Insert)
    if not ABlindInsert then
      dj.FromJSON(LConnection.ResponseBody.JSONDataValue).byFields.ClearCollection.TypeAnnotationsON.&To(AObj);
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
  end;
end;

class procedure TioStrategyRemote.RollbackTransaction(const AConnectionName: String);
begin
  inherited;
  TioDBFactory.Connection(AConnectionName).Rollback;
end;

class procedure TioStrategyRemote.SQLDest_Execute(const ASQLDestination: IioSQLDestination);
var
  LConnection: IioConnectionRemote;
  LJSONValue: TJSONValue;
begin
  inherited;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(ASQLDestination.GetConnectionDefName).AsRemoteConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any remote call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.RequestBody.Clear;
    LConnection.RequestBody.SQLDestination := ASQLDestination;
    LConnection.Execute('SQLDestExecute');
    // Get the number of records affected by the SQL command
    LJSONValue := LConnection.ResponseBody.JSONDataValue;
    if Assigned(LJSONValue) and (LJSONValue is TJSONNumber) then
      // Result := TJSONNumber(LJSONValue).AsInt
    else
      raise EioException.Create(Self.ClassName + ': wrong JSONValue (SQLDest_Execute).');
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioStrategyRemote.SQLDest_LoadDataSet(const ASQLDestination: IioSQLDestination; const ADestDataSet: TFDDataSet);
var
  LConnection: IioConnectionRemote;
begin
  inherited;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection('').AsRemoteConnection;
  // Start transaction
  // NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  // nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  // perform any remote call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.RequestBody.Clear;
    LConnection.RequestBody.SQLDestination := ASQLDestination;
    LConnection.Execute('SQLDestLoadDataSet');
    // Load the dataset
    ADestDataSet.LoadFromStream(LConnection.ResponseBody.Stream, TFDStorageFormat.sfJSON);
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioStrategyRemote.StartTransaction(const AConnectionName: String);
begin
  inherited;
  TioDBFactory.Connection(AConnectionName).StartTransaction;
end;

end.
