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



unit iORM.DB.Connection;

interface
{$I ioGlobalDef.inc}   // iORM global definitions

uses
  iORM.DB.Interfaces,
  FireDAC.Stan.Def,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.FB,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  FireDAC.DApt,
  FireDAC.UI.Intf,
{$IFDEF CONSOLE}  // Non più necessaria???
  FireDAC.ConsoleUI.Wait,
{$ENDIF}
  FireDAC.Stan.Async,
  FireDAC.Comp.UI;


type

  // This is the base class for all connections
  TioConnectionBase = class(TInterfacedObject, IioConnection)
  strict private
    FConnectionInfo: TioConnectionInfo;
    FTransactionCounter: Integer;
  strict protected
    procedure DoStartTransaction; virtual; abstract;
    procedure DoCommitTransaction; virtual; abstract;
    procedure DoRollbackTransaction; virtual; abstract;
  public
    constructor Create(const AConnectionInfo:TioConnectionInfo);
    function IsDBConnection: Boolean;
    function IsRESTConnection: Boolean;
    function AsDBConnection: IioConnectionDB; virtual;
    function AsRESTConnection: IioConnectionREST; virtual;
    function GetConnectionInfo: TioConnectionInfo;
    function InTransaction: Boolean; virtual; abstract;
    procedure StartTransaction;
    procedure Commit;
    procedure Rollback;
  end;

  // This is the specialized class for DB connections
  TioConnectionDB = class(TioConnectionBase, IioConnectionDB)
  strict private
    FConnection: TioInternalSqlConnection;
    FFDGUIxWaitCursor: TFDGUIxWaitCursor;
    FQueryContainer: IioQueryContainer;
    FTransactionTimestamp: TDateTime;
  strict protected
    procedure DoStartTransaction; override;
    procedure DoCommitTransaction; override;
    procedure DoRollbackTransaction; override;
  public
    constructor Create(const AConnection:TioInternalSqlConnection; const AQueryContainer:IioQueryContainer; const AConnectionInfo:TioConnectionInfo);
    destructor Destroy; override;
    procedure TransactionTimestampReset;
    function TransactionTimestamp: TDateTime;
    function AsDBConnection: IioConnectionDB; override;
    function QueryContainer: IioQueryContainer;
    function GetConnection: TioInternalSqlConnection;
    function InTransaction: Boolean; override;
  end;

implementation

uses
  iORM.DB.Factory, iORM.Exceptions;

{ TioConnectionSqLite }

function TioConnectionBase.AsDBConnection: IioConnectionDB;
begin
  if not Self.IsDBConnection then
    raise EioException.Create(Self.ClassName + '.AsDBConnection: Operation not allowed by this connection type.');
end;

function TioConnectionBase.AsRESTConnection: IioConnectionREST;
begin
  if not Self.IsRESTConnection then
    raise EioException.Create(Self.ClassName + '.AsRESTConnection: Operation not allowed by this connection type.');
end;

procedure TioConnectionBase.Commit;
begin
  inherited;
  Dec(FTransactionCounter);
  if FTransactionCounter > 0 then Exit;
  DoCommitTransaction;
  // Free connection if needed (if not persistent)
  if not FConnectionInfo.Persistent then
    TioDBFactory.ConnectionContainer.FreeConnection(Self);
end;

constructor TioConnectionBase.Create(const AConnectionInfo:TioConnectionInfo);
begin
  inherited Create;
  FConnectionInfo := AConnectionInfo;
  FTransactionCounter := 0;
end;

function TioConnectionBase.GetConnectionInfo: TioConnectionInfo;
begin
  Result := FConnectionInfo;
end;

function TioConnectionBase.IsDBConnection: Boolean;
begin
  Result := (FConnectionInfo.ConnectionType <> TioConnectionType.cdtREST);
end;

function TioConnectionBase.IsRESTConnection: Boolean;
begin
  Result := (FConnectionInfo.ConnectionType = TioConnectionType.cdtREST);
end;

procedure TioConnectionBase.Rollback;
begin
  DoRollbackTransaction;
  FTransactionCounter := 0;
  // Free connection if needed (if not persistent)
  if not FConnectionInfo.Persistent then
    TioDBFactory.ConnectionContainer.FreeConnection(Self);
end;

procedure TioConnectionBase.StartTransaction;
begin
  inherited;
  if FTransactionCounter <= 0 then
  begin
    DoStartTransaction;
    FTransactionCounter := 0;
  end;
  inc(FTransactionCounter);
end;

{ TioConnectionDB }

function TioConnectionDB.AsDBConnection: IioConnectionDB;
begin
  inherited;
  Result := Self;
end;

constructor TioConnectionDB.Create(const AConnection: TioInternalSqlConnection;
  const AQueryContainer: IioQueryContainer;
  const AConnectionInfo: TioConnectionInfo);
begin
  inherited Create(AConnectionInfo);
  FFDGUIxWaitCursor := TFDGUIxWaitCursor.Create(nil);

{$IFDEF CONSOLE}
  FFDGUIxWaitCursor.Provider := 'Console';
{$ELSE}
  {$IFDEF ioVCL}
    FFDGUIxWaitCursor.Provider := 'Forms';
  {$ELSE}
    FFDGUIxWaitCursor.Provider := 'FMX';
  {$ENDIF}
{$ENDIF}

  FConnection := AConnection;
  FQueryContainer := AQueryContainer;
  TransactionTimestampReset;
end;

destructor TioConnectionDB.Destroy;
begin
  FConnection.Free;
  FFDGUIxWaitCursor.Free;
  inherited;
end;

procedure TioConnectionDB.DoCommitTransaction;
begin
  inherited;
  FConnection.Commit;
end;

procedure TioConnectionDB.DoRollbackTransaction;
begin
  inherited;
  FConnection.Rollback;
end;

procedure TioConnectionDB.DoStartTransaction;
begin
  inherited;
  FConnection.StartTransaction;
end;

function TioConnectionDB.GetConnection: TioInternalSqlConnection;
begin
  Result := FConnection;
end;

function TioConnectionDB.InTransaction: Boolean;
begin
  inherited;
  Result := FConnection.InTransaction;
end;

function TioConnectionDB.QueryContainer: IioQueryContainer;
begin
  Result := FQueryContainer;
end;

function TioConnectionDB.TransactionTimestamp: TDateTime;
var
  LQuery: IioQuery;
begin
  if FTransactionTimestamp = TRANSACTION_TIMESTAMP_NULL then
  begin
    LQuery := TioDBFactory.QueryEngine.GetQueryCurrentTimestamp(FConnection.ConnectionDefName);
    LQuery.Open;
    try
      FTransactionTimestamp := LQuery.Fields[0].AsDateTime;
    finally
      LQuery.Close;
    end;
  end;
  Result := FTransactionTimestamp;
end;

procedure TioConnectionDB.TransactionTimestampReset;
begin
  FTransactionTimestamp := TRANSACTION_TIMESTAMP_NULL;
end;

end.


