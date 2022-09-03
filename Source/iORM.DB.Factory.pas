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
    class function WhereItemProperty(APropertyName: String): IioSqlItemWhere;
    class function WhereItemPropertyOID: IioSqlItemWhere;
    class function WhereItemTValue(AValue: TValue): IioSqlItemWhere;
    class function WhereItemPropertyEqualsTo(APropertyName: String; AValue: TValue): IioSqlItemWhere;
    class function WhereItemPropertyOIDEqualsTo(AValue: TValue): IioSqlItemWhere;
    class function CompareOperator: TioCompareOperatorRef;
    class function LogicRelation: TioLogicRelationRef;
    class function SqlGenerator(const AConnectionName: String): TioSqlGeneratorRef;
    class function SqlDataConverter(const AConnectionName: String): TioSqlDataConverterRef;
    class function Connection(AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME): IioConnection;
    class function NewConnection(const AConnectionName: String): IioConnection;
    class function TransactionCollection: IioTransactionCollection;
    class function Query(const AConnectionDefName: String; const AQueryIdentity: String = ''): IioQuery;
    class function Script(const AConnectionDefName: String; const AScript: TStrings): IioScript;
    class function ConnectionContainer: TioConnectionContainerRef;
    class function ConnectionManager: TioConnectionManagerRef;
    class function QueryContainer: IioQueryContainer;
    class function QueryEngine: TioQueryEngineRef;
    class function SQLDestination(const ASQL: String): IioSQLDestination; overload;
    class function SQLDestination(const ASQL: TStrings; const AOwns: Boolean = False): IioSQLDestination; overload;
  end;

implementation

uses
  System.IOUtils, iORM.DB.Connection,
  iORM.DB.SqLite.SqlDataConverter, iORM.DB.SqLite.SqlGenerator,
  iORM.Where.SqlItems, System.SysUtils, iORM.DB.QueryContainer,
  iORM.DB.TransactionCollection, iORM.DB.Firebird.SqlDataConverter,
  iORM.Exceptions, iORM.DB.Firebird.SqlGenerator,
  iORM.DB.SQL.Destination, FireDAC.Stan.Intf, iORM.DB.MSSqlServer.SqlGenerator,
  iORM.Remote.Connection, iORM.DB.MSSqlServer.SqlDataConverter, iORM.DB.Script,
  iORM.DB.Query.FireDAC;

{ TioDbBuilder }

class function TioDbFactory.CompareOperator: TioCompareOperatorRef;
begin
  Result := TioCompareOperator;
end;

class function TioDbFactory.Connection(AConnectionName: String = IO_CONNECTIONDEF_DEFAULTNAME): IioConnection;
begin
  // If AConnectionName param is not specified (is empty) then
  // use the default connection def
  AConnectionName := Self.ConnectionManager.GetCurrentConnectionNameIfEmpty(AConnectionName);
  // If the connection already exists in the COnnectionContainer then return then else
  // create a new connection, add it to the COnnectionContainer thne return the connection
  // itself to the caller code
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
  Result := TioLogicRelation;
end;

class function TioDbFactory.NewConnection(const AConnectionName: String): IioConnection;
var
  LConnectionInfo: TioConnectionInfo;
  function NewConnectionDB: IioConnectionDB;
  var
    LConnection: TioInternalSqlConnection;
    // DBPath: String;
  begin
    // Create the internal connection
    LConnection := TioInternalSqlConnection.Create(nil);
    // Load and set the connection parameters (from the connection manager)
    LConnection.ConnectionDefName := AConnectionName;
    // Disable Firedac MACRO
    LConnection.ResourceOptions.MacroCreate := False;
    LConnection.ResourceOptions.MacroExpand := False;
    // LConnection.ResourceOptions.PreprocessCmdText := False;
    // Set the monitor mode for the connection
{$IFDEF MSWINDOWS}
    case TioConnectionMonitor.mode of
      mmDisabled:
        LConnection.Params.MonitorBy := mbNone;
      mmRemote:
        LConnection.Params.MonitorBy := mbRemote;
      mmFlatFile:
        LConnection.Params.MonitorBy := mbFlatFile;
    end;
{$ENDIF}
    // Extract the file path and create the directory if not exists
    // DBPath := ExtractFilePath(   Self.ConnectionManager.GetConnectionDefByName(AConnectionName).Params.Values['Database']   );
    // if not TDirectory.Exists(DBPath) then TDirectory.CreateDirectory(DBPath);
    // Open the connection
    LConnection.Open;
    // Create the ioConnection and his QueryContainer and return it
    Result := TioConnectionDB.Create(LConnection, Self.QueryContainer, TioConnectionManager.GetConnectionInfo(AConnectionName));
  end;
  function NewConnectionRemote: IioConnectionRemote;
  begin
    Result := TioConnectionRemote.Create(LConnectionInfo);
  end;

begin
  // Get connection info
  LConnectionInfo := TioConnectionManager.GetConnectionInfo(AConnectionName);
  if LConnectionInfo.ConnectionType = TioConnectionType.cdtRemote then
    Result := NewConnectionRemote
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

class function TioDbFactory.Query(const AConnectionDefName: String; const AQueryIdentity: String): IioQuery;
var
  LConnection: IioConnection;
begin
  // Get the proper connection
  LConnection := Connection(AConnectionDefName);
  // Operation allowed only for DB connections
  if not LConnection.IsDBConnection then
    raise EioException.Create(ClassName, 'Query', 'Operation not allowed by this type of connection.');
  // If the query is already present in the QueryContainer of the connection then get it and return...
  //   ...else create a new query and insert it in the QueryContainer of the connection
  if not LConnection.AsDBConnection.QueryContainer.TryGetQuery(AQueryIdentity, Result) then
  begin
    Result := TioFDQuery.Create(LConnection);
    LConnection.AsDBConnection.QueryContainer.AddQuery(AQueryIdentity, Result);
  end;

end;

class function TioDbFactory.Script(const AConnectionDefName: String; const AScript: TStrings): IioScript;
var
  LConnection: IioConnection;
begin
  // Get the proper connection
  LConnection := Self.Connection(AConnectionDefName);
  // Operation allowed only for DB connections
  if not LConnection.IsDBConnection then
    raise EioException.Create(Self.ClassName, 'Script' + 'Operation not allowed by this type of connection');
  // Create the script component instance
  Result := TioScript.Create(LConnection, AScript);
end;

class function TioDbFactory.SqlDataConverter(const AConnectionName: String): TioSqlDataConverterRef;
begin
  case TioConnectionManager.GetConnectionInfo(AConnectionName).ConnectionType of
    cdtFirebird:
      Result := TioSqlDataConverterFirebird;
    cdtSQLite:
      Result := TioSqlDataConverterSqLite;
    cdtSQLServer:
      Result := TioSqlDataConverterMSSqlServer;
  else
    raise EioException.Create(ClassName + ': Connection type not found (SqlDataConverter).');
  end;
end;

class function TioDbFactory.SQLDestination(const ASQL: TStrings; const AOwns: Boolean): IioSQLDestination;
begin
  Result := TioSQLDestination.Create(ASQL, AOwns);
end;

class function TioDbFactory.SQLDestination(const ASQL: String): IioSQLDestination;
begin
  Result := TioSQLDestination.Create(ASQL);
end;

class function TioDbFactory.SqlGenerator(const AConnectionName: String): TioSqlGeneratorRef;
begin
  case TioConnectionManager.GetConnectionInfo(AConnectionName).ConnectionType of
    cdtFirebird:
      Result := TioSqlGeneratorFirebird;
    cdtSQLite:
      Result := TioSqlGeneratorSqLite;
    cdtSQLServer:
      Result := TioSqlGeneratorMSSqlServer;
  else
    raise EioException.Create(ClassName + ': Connection type not found (SqlGenerator).');
  end;
end;

class function TioDbFactory.TransactionCollection: IioTransactionCollection;
begin
  Result := TioTransactionCollection.Create;
end;

class function TioDbFactory.WhereItemProperty(APropertyName: String): IioSqlItemWhere;
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
  Result := TioSqlItemsWherePropertyIDEqualsTo.Create(AValue);
end;

class function TioDbFactory.WhereItemTValue(AValue: TValue): IioSqlItemWhere;
begin
  Result := TioSqlItemsWhereTValue.Create(AValue);
end;

end.
