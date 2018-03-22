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





unit iORM.Strategy.REST;

interface

uses
  iORM.Strategy.Interfaces, iORM.Where.Interfaces, iORM.DB.Interfaces,
  FireDAC.Comp.DataSet;

type

  // Strategy class for database
  TioStrategyREST = class(TioStrategyIntf)
  private
    class var FTransactionGUID: String;
    class function NewGUIDAsString: String;
    class function GetTransactionGUID: String;
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
    class function LoadObjectByClassOnly(const AWhere: IioWhere; const AObj:TObject): TObject; override;
    class procedure LoadDataSet(const AWhere: IioWhere; const ADestDataSet:TFDDataSet); override;
    // SQLDestinations
    class procedure SQLDest_LoadDataSet(const ASQLDestination:IioSQLDestination; const ADestDataset:TFDDataSet); override;
    class function SQLDest_Execute(const ASQLDestination:IioSQLDestination): Integer; override;
  end;


implementation

uses
  System.JSON, iORM, System.Classes, iORM.Strategy.DB, iORM.DB.ConnectionContainer,
  iORM.DB.Factory, System.Generics.Collections, iORM.Rtti.Utilities,
  iORM.DuckTyped.Interfaces, iORM.REST.Interfaces, iORM.REST.Factory,
  iORM.Exceptions, System.SysUtils, FireDAC.Stan.Intf, FireDAC.Stan.StorageJSON;

{ TioStrategyREST }

class procedure TioStrategyREST.CommitTransaction(
  const AConnectionName: String);
begin
  inherited;
  TioDBFactory.Connection(AConnectionName).Commit;
end;

class procedure TioStrategyREST.Delete(const AWhere: IioWhere);
var
  LConnection: IioConnectionREST;
begin
  inherited;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(AWhere.GetConnectionName).AsRESTConnection;
  // Start transaction
  //  NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  //       nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  //       perform any remote call to the server at this point.
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

class procedure TioStrategyREST.DeleteObject(const AObj: TObject;
  const AConnectionName: String);
var
  LConnection: IioConnectionREST;
begin
  inherited;
  // Check
  if not Assigned(AObj) then Exit;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(AConnectionName).AsRESTConnection;
  // Start transaction
  //  NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  //       nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  //       perform any remote call to the server at this point.
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

class function TioStrategyREST.GetTransactionGUID: String;
begin
  // Set the fixed part of the TransactionGUID if empty
  if FTransactionGUID.IsEmpty then
    FTransactionGUID := Self.NewGUIDAsString;
  // Generate a TransactionGUID (Fixed GUID + Current thread ID
  Result := System.Classes.TThread.CurrentThread.ThreadID.ToString + '-' + FTransactionGUID;
end;

class procedure TioStrategyREST.LoadDataSet(const AWhere: IioWhere;
  const ADestDataSet: TFDDataSet);
var
  LConnection: IioConnectionREST;
begin
  inherited;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(AWhere.GetConnectionName).AsRESTConnection;
  // Start transaction
  //  NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  //       nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  //       perform any remote call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.RequestBody.Clear;
    LConnection.RequestBody.Where := AWhere;
    LConnection.Execute('LoadDataSet');
    // Load the dataset
    ADestDataset.LoadFromStream(LConnection.ResponseBody.Stream, TFDStorageFormat.sfJSON);
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
  end;
end;

class procedure TioStrategyREST.LoadList(const AWhere: IioWhere;
  const AList: TObject);
var
  LConnection: IioConnectionREST;
begin
  inherited;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(AWhere.GetConnectionName).AsRESTConnection;
  // Start transaction
  //  NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  //       nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  //       perform any remote call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.RequestBody.Clear;
    LConnection.RequestBody.Where := AWhere;
    LConnection.Execute('LoadList');
    // Deserialize  the JSONDataValue to the result object
    io.Mapper.FromJSON(LConnection.ResponseBody.JSONDataValue).byFields.TypeAnnotationsON.&To(AList);
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
  end;
end;

class function TioStrategyREST.LoadObject(const AWhere: IioWhere;
  const AObj: TObject): TObject;
var
  LConnection: IioConnectionREST;
begin
  inherited;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(AWhere.GetConnectionName).AsRESTConnection;
  // Start transaction
  //  NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  //       nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  //       perform any remote call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.RequestBody.Clear;
    LConnection.RequestBody.Where := AWhere;
    LConnection.Execute('LoadObject');
    // Deserialize  the JSONDataValue to the result object
    if Assigned(AObj) then
      io.Mapper.FromJSON(LConnection.ResponseBody.JSONDataValue).byFields.TypeAnnotationsON.&To(AObj)
    else
      Result := io.Mapper.FromJSON(LConnection.ResponseBody.JSONDataValue).byFields.TypeAnnotationsON.ToObject;
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
  end;
end;

class function TioStrategyREST.LoadObjectByClassOnly(const AWhere: IioWhere;
  const AObj: TObject): TObject;
begin
  // This method is only used internally by the Object Maker,
  //  and then you do not need to implement it in RESTStrategy.
  raise EioException.Create(Self.ClassName + ': "LoadObjectByClassOnly", method not implemented in this strategy.');
end;

class function TioStrategyREST.NewGUIDAsString: String;
var
  LGUID: TGUID;
begin
  CreateGUID(LGUID);
  Result := GUIDToString(LGUID);
end;

class procedure TioStrategyREST.PersistCollection(const ACollection: TObject;
  const ARelationPropertyName: String; const ARelationOID: Integer;
  const ABlindInsert: Boolean; const AConnectionName: String);
var
  LConnection: IioConnectionREST;
begin
  inherited;
  // Check
  if not Assigned(ACollection) then Exit;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(AConnectionName).AsRESTConnection;
  // Start transaction
  //  NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  //       nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  //       perform any remote call to the server at this point.
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
      io.Mapper.FromJSON(LConnection.ResponseBody.JSONDataValue).byFields.TypeAnnotationsON.ClearListBefore.&To(ACollection);
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
  end;
end;

class procedure TioStrategyREST.PersistObject(const AObj: TObject;
  const ARelationPropertyName: String; const ARelationOID: Integer;
  const ABlindInsert: Boolean; const AConnectionName: String);
var
  LConnection: IioConnectionREST;
begin
  inherited;
  // Check
  if not Assigned(AObj) then Exit;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(AConnectionName).AsRESTConnection;
  // Start transaction
  //  NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  //       nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  //       perform any remote call to the server at this point.
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
      io.Mapper.FromJSON(LConnection.ResponseBody.JSONDataValue).byFields.TypeAnnotationsON.&To(AObj);
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
  end;
end;

class procedure TioStrategyREST.RollbackTransaction(
  const AConnectionName: String);
begin
  inherited;
  TioDBFactory.Connection(AConnectionName).Rollback;
end;

class function TioStrategyREST.SQLDest_Execute(
  const ASQLDestination: IioSQLDestination): Integer;
var
  LConnection: IioConnectionREST;
  LJSONValue: TJSONValue;
begin
  inherited;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(ASQLDestination.GetConnectionName).AsRESTConnection;
  // Start transaction
  //  NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  //       nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  //       perform any remote call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.RequestBody.Clear;
    LConnection.RequestBody.SQLDestination := ASQLDestination;
    LConnection.Execute('SQLDestExecute');
    // Get the number of records affected by the SQL command
    LJSONValue := LConnection.ResponseBody.JSONDataValue;
    if Assigned(LJSONValue) and (LJSONValue is TJSONNumber) then
      Result := TJSONNumber(LJSONValue).AsInt
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

class procedure TioStrategyREST.SQLDest_LoadDataSet(
  const ASQLDestination: IioSQLDestination; const ADestDataset: TFDDataSet);
var
  LConnection: IioConnectionREST;
begin
  inherited;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(ASQLDestination.GetConnectionName).AsRESTConnection;
  // Start transaction
  //  NB: In this strategy (REST) call the Connection.StartTransaction (not the Self.StartTransaction
  //       nor io.StartTransaction) because is only for the lifecicle of the connection itself and do not
  //       perform any remote call to the server at this point.
  LConnection.StartTransaction;
  try
    LConnection.RequestBody.Clear;
    LConnection.RequestBody.SQLDestination := ASQLDestination;
    LConnection.Execute('SQLDestLoadDataSet');
    // Load the dataset
    ADestDataset.LoadFromStream(LConnection.ResponseBody.Stream, TFDStorageFormat.sfJSON);
    // Commit
    LConnection.Commit;
  except
    // Rollback
    LConnection.Rollback;
    raise;
  end;
end;

class procedure TioStrategyREST.StartTransaction(const AConnectionName: String);
begin
  inherited;
  TioDBFactory.Connection(AConnectionName).StartTransaction;
end;

end.
