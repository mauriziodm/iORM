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
