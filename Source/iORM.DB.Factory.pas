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



unit iORM.DB.Factory;

interface

uses
  iORM.Where.SqlItems.Interfaces,
  iORM.ObjectsForge.Interfaces,
  iORM.DB.Interfaces,
  System.Classes,
  System.Rtti, iORM.DB.ConnectionContainer, iORM.CommonTypes,
  iORM.Context.Interfaces, iORM.Context.Properties.Interfaces,
  iORM.DB.QueryEngine;

type

  TioDbFactory = class
  public
    class function WhereItemProperty(APropertyName:String): IioSqlItemWhere;
    class function WhereItemPropertyOID: IioSqlItemWhere;
    class function WhereItemTValue(AValue:TValue): IioSqlItemWhere;
    class function WhereItemPropertyEqualsTo(APropertyName:String; AValue:TValue): IioSqlItemWhere;
    class function WhereItemPropertyOIDEqualsTo(AValue:TValue): IioSqlItemWhere;
    class function CompareOperator: TioCompareOperatorRef;
    class function LogicRelation: TioLogicRelationRef;
    class function SqlGenerator: TioSqlGeneratorRef;
    class function SqlDataConverter: TioSqlDataConverterRef;
    class function Connection(AConnectionName:String=''): IioConnection;
    class function NewConnection(const AConnectionName:String): IioConnection;
    class function TransactionCollection: IioTransactionCollection;
    class function Query(AConnectionDefName:String; const AQueryIdentity:String=''): IioQuery;
    class function ConnectionContainer: TioConnectionContainerRef;
    class function ConnectionManager: TioConnectionManagerRef;
    class function QueryContainer: IioQueryContainer;
    class function QueryEngine: TioQueryEngineRef;
    class function SQLDestination(const ASQL:String): IioSQLDestination;
  end;


implementation

uses
  iORM.DB.SqLite.CompareOperators, System.IOUtils,
  iORM.DB.Connection, iORM.DB.SqLite.LogicRelations, iORM.DB.Query,
  iORM.DB.SqLite.SqlDataConverter, iORM.DB.SqLite.SqlGenerator,
  iORM.Where.SqlItems, System.SysUtils, iORM.DB.QueryContainer,
  iORM.DB.TransactionCollection, iORM.DB.Firebird.SqlDataConverter,
  iORM.Exceptions, iORM.DB.Firebird.SqlGenerator,
  iORM.DB.SQL.Destination, FireDAC.Stan.Intf, iORM.DB.MSSqlServer.SqlGenerator,
  iORM.REST.Connection;

{ TioDbBuilder }

class function TioDbFactory.CompareOperator: TioCompareOperatorRef;
begin
  Result := TioCompareOperatorSqLite;
end;

class function TioDbFactory.Connection(AConnectionName:String=''): IioConnection;
begin
  // If AConnectionName param is not specified (is empty) then
  //  use the default connection def
  if AConnectionName.IsEmpty then
    AConnectionName := Self.ConnectionManager.GetDefaultConnectionName;
  // If the connection already exists in the COnnectionContainer then return then else
  //  create a new connection, add it to the COnnectionContainer thne return the connection
  //  itself to the caller code
  if not Self.ConnectionContainer.ConnectionExist(AConnectionName) then
    Self.ConnectionContainer.AddConnection(Self.NewConnection(AConnectionName));
  Result := Self.ConnectionContainer.GetConnection(AConnectionName);
end;

class function TioDbFactory.ConnectionContainer: TioConnectionContainerRef;
begin
  Result := TioConnectionContainer;
end;

class function TioDbFactory.ConnectionManager: TioConnectionManagerRef;
begin
  Result := TioConnectionManager;
end;

class function TioDbFactory.LogicRelation: TioLogicRelationRef;
begin
  Result := TioLogicRelationSqLite;
end;

class function TioDbFactory.NewConnection(const AConnectionName:String): IioConnection;
var
  LConnectionInfo: TioConnectionInfo;
  function NewConnectionDB: IioConnectionDB;
  var
    LConnection: TioInternalSqlConnection;
    DBPath: String;
  begin
    // Create the internal connection
    LConnection := TioInternalSqlConnection.Create(nil);
    // Load and set the connection parameters (from the connection manager)
    LConnection.ConnectionDefName := AConnectionName;
    // Set the monitor mode for the connection
  {$IFDEF MSWINDOWS}
    case TioConnectionMonitor.mode of
      mmDisabled: LConnection.Params.MonitorBy := mbNone;
      mmRemote:   LConnection.Params.MonitorBy := mbRemote;
      mmFlatFile: LConnection.Params.MonitorBy := mbFlatFile;
    end;
  {$ENDIF}
    // Extract the file path anche create the directory if not exists
    //DBPath := ExtractFilePath(   Self.ConnectionManager.GetConnectionDefByName(AConnectionName).Params.Values['Database']   );
    //if not TDirectory.Exists(DBPath) then TDirectory.CreateDirectory(DBPath);
    // Open the connection
    LConnection.Open;
    // Create the ioConnection and his QueryContainer and return it
    Result := TioConnectionDB.Create(LConnection, Self.QueryContainer, TioConnectionManager.GetConnectionInfo(AConnectionName));
  end;
  function NewConnectionREST: IioConnectionREST;
  begin
    Result := TioConnectionREST.Create(LConnectionInfo);
  end;
begin
  // Get connection info
  LConnectionInfo := TioConnectionManager.GetConnectionInfo(AConnectionName);
  if LConnectionInfo.ConnectionType = TioConnectionType.cdtREST then
    Result := NewConnectionREST
  else
    Result := NewConnectionDB;
end;

class function TioDbFactory.QueryContainer: IioQueryContainer;
begin
  Result := TioQueryContainer.Create;
end;

class function TioDbFactory.QueryEngine: TioQueryEngineRef;
begin
  Result := TioQueryEngine;
end;

class function TioDbFactory.Query(AConnectionDefName:String; const AQueryIdentity:String): IioQuery;
var
  LConnection: IioConnection;
begin
  // If AConnectionName param is not specified (is empty) then
  //  use the default connection def
  if AConnectionDefName.IsEmpty then
    AConnectionDefName := Self.ConnectionManager.GetDefaultConnectionName;
  // Get the proper connection
  LConnection := Self.Connection(AConnectionDefName);
  // Operation allowed only for DB connections
  if not LConnection.IsDBConnection then
    raise EioException.Create(Self.ClassName + ': "Query" method: Operation not allowed by this type of connection.');
  // Else if the query is already present in the QueryContainer of the connection then
  //  get it and return
  if LConnection.AsDBConnection.QueryContainer.Exist(AQueryIdentity) then
    Exit(   LConnection.AsDBConnection.QueryContainer.GetQuery(AQueryIdentity)   );
  // Else create a new query and insert it in the QueryContainer of the connection
  //  for future use if AConnectionDefName is valid (used by DBCreator)
  Result := TioQuery.Create(LConnection, TioInternalSqlQuery.Create(nil));
//  if not AConnectionDefName.IsEmpty then
  if not AQueryIdentity.IsEmpty then
    LConnection.AsDBConnection.QueryContainer.AddQuery(AQueryIdentity, Result);
end;

class function TioDbFactory.SqlDataConverter: TioSqlDataConverterRef;
begin
  case TioConnectionManager.GetConnectionInfo.ConnectionType of
    cdtFirebird:  Result := TioSqlDataConverterFirebird;
    cdtSQLite:    Result := TioSqlDataConverterSqLite;
    cdtSQLServer: Result := TioSqlDataConverterFirebird;
  else
    raise EioException.Create(ClassName + ': Connection type not found (SqlDataConverter).');
  end;
end;

class function TioDbFactory.SQLDestination(
  const ASQL: String): IioSQLDestination;
begin
  Result := TioSQLDestination.Create(ASQL);
end;

class function TioDbFactory.SqlGenerator: TioSqlGeneratorRef;
begin
  case TioConnectionManager.GetConnectionInfo.ConnectionType of
    cdtFirebird: Result := TioSqlGeneratorFirebird;
    cdtSQLite:   Result := TioSqlGeneratorSqLite;
    cdtSQLServer:Result := TioSqlGeneratorMSSqlServer;
  else
    raise EioException.Create(ClassName + ': Connection type not found (SqlGenerator).');
  end;
end;

class function TioDbFactory.TransactionCollection: IioTransactionCollection;
begin
  Result := TioTransactionCollection.Create;
end;

class function TioDbFactory.WhereItemProperty(APropertyName:String): IioSqlItemWhere;
begin
  Result := TioSqlItemsWhereProperty.Create(APropertyName);
end;

class function TioDbFactory.WhereItemPropertyEqualsTo(APropertyName: String; AValue: TValue): IioSqlItemWhere;
begin
  Result := TioSqlItemsWherePropertyEqualsTo.Create(APropertyName, AValue);
end;

class function TioDbFactory.WhereItemPropertyOID: IioSqlItemWhere;
begin
  Result := TioSqlItemsWherePropertyOID.Create;
end;

class function TioDbFactory.WhereItemPropertyOIDEqualsTo(AValue: TValue): IioSqlItemWhere;
begin
  Result := TioSqlItemsWherePropertyOIDEqualsTo.Create(AValue);
end;

class function TioDbFactory.WhereItemTValue(AValue: TValue): IioSqlItemWhere;
begin
  Result := TioSqlItemsWhereTValue.Create(AValue);
end;


end.

