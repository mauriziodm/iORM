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

{$IFDEF CONSOLE}
  FireDAC.ConsoleUI.Wait,
{$ELSE}
  {$IFDEF HAS_VCL}
    FireDAC.VCLUI.Wait,
    FireDAC.Phys.MSSQL,
  {$ELSE}
    FireDAC.FMXUI.Wait,
  {$ENDIF}
{$ENDIF}

  FireDAC.Comp.UI,
  FireDAC.Stan.Async;


type

  // This is the base class for all connections
  TioConnectionBase = class(TInterfacedObject, IioConnection)
  strict private
    FConnectionInfo: TioConnectionInfo;
  public
    constructor Create(const AConnectionInfo:TioConnectionInfo);
    function IsDBConnection: Boolean;
    function IsRESTConnection: Boolean;
    function AsDBConnection: IioConnectionDB; virtual;
    function AsRESTConnection: IioConnectionREST; virtual;
    function GetConnectionInfo: TioConnectionInfo;
    function InTransaction: Boolean; virtual; abstract;
    procedure StartTransaction; virtual; abstract;
    procedure Commit; virtual;
    procedure Rollback; virtual;
  end;

  // This is the specialized class for DB connections
  TioConnectionDB = class(TioConnectionBase, IioConnectionDB)
  strict private
    FConnection: TioInternalSqlConnection;
    FTransactionCounter: Integer;
    FFDGUIxWaitCursor: TFDGUIxWaitCursor;
    FQueryContainer: IioQueryContainer;
  public
    constructor Create(const AConnection:TioInternalSqlConnection; const AQueryContainer:IioQueryContainer; const AConnectionInfo:TioConnectionInfo);
    destructor Destroy; override;
    function AsDBConnection: IioConnectionDB; override;
    function QueryContainer: IioQueryContainer;
    function GetConnection: TioInternalSqlConnection;
    function InTransaction: Boolean; override;
    procedure StartTransaction; override;
    procedure Commit; override;
    procedure Rollback; override;
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
  // Free conncetion if not persistent
  if not FConnectionInfo.Persistent then
    TioDBFactory.ConnectionContainer.FreeConnection(Self);
end;

constructor TioConnectionBase.Create(const AConnectionInfo:TioConnectionInfo);
begin
  inherited Create;
  FConnectionInfo := AConnectionInfo;
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
  // Free conncetion if not persistent
  if not FConnectionInfo.Persistent then
    TioDBFactory.ConnectionContainer.FreeConnection(Self);
end;

{ TioConnectionDB }

function TioConnectionDB.AsDBConnection: IioConnectionDB;
begin
  inherited;
  Result := Self;
end;

procedure TioConnectionDB.Commit;
begin
  Dec(FTransactionCounter);
  if FTransactionCounter > 0 then Exit;
  FConnection.Commit;
  // Free connection if needed (if not persistent)
  inherited;
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
  {$IFDEF HAS_VCL}
    FFDGUIxWaitCursor.Provider := 'Forms';
  {$ELSE}
    FFDGUIxWaitCursor.Provider := 'FMX';
  {$ENDIF}
{$ENDIF}

  FTransactionCounter := 0;
  FConnection := AConnection;
  FQueryContainer := AQueryContainer;
end;

destructor TioConnectionDB.Destroy;
begin
  FConnection.Free;
  FFDGUIxWaitCursor.Free;
  inherited;
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

procedure TioConnectionDB.Rollback;
begin
  FConnection.Rollback;
  FTransactionCounter := 0;
  // Free connection if needed (if not persistent)
  inherited;
end;

procedure TioConnectionDB.StartTransaction;
begin
  inherited;
  if FTransactionCounter <= 0 then
  begin
    FConnection.StartTransaction;
    FTransactionCounter := 0;
  end;
  inc(FTransactionCounter);
end;

end.


