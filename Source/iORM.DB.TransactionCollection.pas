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



unit iORM.DB.TransactionCollection;

interface

uses
  iORM.DB.Interfaces, iORM.Containers.Interfaces;

type

  TioTransactionCollection = class(TInterfacedObject, IioTransactionCollection)
  private
    FTransactionList: IioList<String>;
  protected
    function Exists(AConnectionName:String): Boolean;
  public
    constructor Create;
    procedure StartTransaction(AConnectionName:String='');
    procedure CommitAll;
    procedure RollbackAll;
  end;

implementation

uses
  iORM.Containers.Factory, iORM.DB.Factory;

{ TioTransactionCollection }

procedure TioTransactionCollection.CommitAll;
var
  AConnectionName: String;
begin
  // Commit all the connections
  for AConnectionName in FTransactionList do
    TioDBFactory.Connection(AConnectionName).Commit;
end;

constructor TioTransactionCollection.Create;
begin
  inherited;
  FTransactionList := TioContainersFactory.GetInterfacedList<String>;
end;

function TioTransactionCollection.Exists(AConnectionName: String): Boolean;
begin
  Result := FTransactionList.IndexOf(AConnectionName) <> -1;
end;

procedure TioTransactionCollection.RollbackAll;
var
  AConnectionName: String;
begin
  // Rollback all the connections
  for AConnectionName in FTransactionList do
    TioDBFactory.Connection(AConnectionName).Commit;
end;

procedure TioTransactionCollection.StartTransaction(AConnectionName: String);
begin
  // The connection is already present then exit
  if Self.Exists(AConnectionName) then Exit;
  // Start the transaction and add it to the TransactionList
  TioDBFactory.Connection(AConnectionName).StartTransaction;
  FTransactionList.Add(AConnectionName);
end;

end.
