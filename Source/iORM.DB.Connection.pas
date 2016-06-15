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

  TioConnection = class(TInterfacedObject, IioConnection)
  strict private
    FConnection: TioInternalSqlConnection;
    FTransactionCounter: Integer;
    FFDGUIxWaitCursor: TFDGUIxWaitCursor;
    FQueryContainer: IioQueryContainer;
  public
    constructor Create(AConnection:TioInternalSqlConnection; AQueryContainer:IioQueryContainer);
    destructor Destroy; override;
    function GetConnection: TioInternalSqlConnection;
    function GetConnectionDefName: String;
    function QueryContainer: IioQueryContainer;
    function InTransaction: Boolean;
    procedure StartTransaction;
    procedure Commit;
    procedure Rollback;
  end;


implementation

uses
  iORM.DB.Factory;

{ TioConnectionSqLite }

procedure TioConnection.Commit;
begin
  Dec(FTransactionCounter);
  if FTransactionCounter > 0 then Exit;
  FConnection.Commit;
  TioDBFactory.ConnectionContainer.FreeConnection(Self);
end;

constructor TioConnection.Create(AConnection: TioInternalSqlConnection; AQueryContainer:IioQueryContainer);
begin
  inherited Create;
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

destructor TioConnection.Destroy;
begin
  FConnection.Free;
  FFDGUIxWaitCursor.Free;
  inherited;
end;

function TioConnection.GetConnection: TioInternalSqlConnection;
begin
  Result := FConnection;
end;

function TioConnection.GetConnectionDefName: String;
begin
  Result := Self.FConnection.ConnectionDefName;
end;

function TioConnection.InTransaction: Boolean;
begin
  Result := FConnection.InTransaction;
end;

function TioConnection.QueryContainer: IioQueryContainer;
begin
  Result := FQueryContainer;
end;

procedure TioConnection.Rollback;
begin
  FConnection.Rollback;
  FTransactionCounter := 0;
  TioDBFactory.ConnectionContainer.FreeConnection(Self);
end;

procedure TioConnection.StartTransaction;
begin
  if FTransactionCounter <= 0 then
  begin
    FConnection.StartTransaction;
    FTransactionCounter := 0;
  end;
  inc(FTransactionCounter);
end;

end.


