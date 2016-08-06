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



unit iORM.DB.SQL.Destination;

interface

uses
  iORM.DB.Interfaces, System.Classes, iORM.CommonTypes,
  FireDAC.Comp.Client, Data.DB;

type

  TioSQLDestination = class(TInterfacedObject, IioSQLDestination)
  private
    FSQL: String;
    FConnectionDefName: String;
    FSelfClassName: String;
    FQualifiedFieldName: Boolean;
  public
    constructor Create(const ASQL:String); overload;
    // Destinations
    {TODO 5 -oOwner -cGeneral : Un altro overload di Trabslate che accetta un'interfaccia e che genera automaticamente una query che fa l'UNION ALL di tutte le classi che implementano l'interfaccia stessa}
    function Translate: String; overload;
    function ToMemTable: TFDMemTable; overload;
    procedure ToMemTable(const AMemTable:TFDMemTable); overload;
    function ToQuery: IioQuery; overload;
    procedure ToQuery(const AQuery:IioQuery); overload;
    procedure ToQuery(const AQuery:TFDQuery); overload;
    function Execute(const AIgnoreObjNotExists:Boolean=False): Integer; overload;
    function Execute(const AParams: array of Variant): Integer; overload;
    function Execute(const AParams: array of Variant; const ATypes: array of TFieldType): Integer; overload;
    // Informations
    function Connection(const AConnectionName:String): IioSQLDestination;
    function SelfClass(const ASelfClassName:String): IioSQLDestination; overload;
    function SelfClass(const ASelfClassRef: TioClassRef): IioSQLDestination; overload;
    function QualifiedFieldName(const AQualifiedFieldName:Boolean=True): IioSQLDestination;
  end;

implementation

uses
  iORM.SqlTranslator, iORM.DB.Factory, iORM.Exceptions;

{ TioSQLDestination }

function TioSQLDestination.Connection(
  const AConnectionName: String): IioSQLDestination;
begin
  Result := Self;
  FConnectionDefName := AConnectionName;
end;

constructor TioSQLDestination.Create(const ASQL: String);
begin
  inherited Create;
  FConnectionDefName := '';
  FSelfClassName := '';
  FQualifiedFieldName := False;
  FSQL := ASQL;
end;

function TioSQLDestination.Execute(const AParams: array of Variant): Integer;
begin
  Result := Self.Execute(AParams, []);
end;

function TioSQLDestination.Execute(const AParams: array of Variant;
  const ATypes: array of TFieldType): Integer;
var
  LConnection: IioConnection;
begin
  LConnection := TioDBFactory.Connection(FConnectionDefName);
  if LConnection.IsDBConnection then
    Result := LConnection.AsDBConnection.GetConnection.ExecSQL(Self.Translate, AParams, ATypes)
  else
    raise EioException.Create(Self.ClassName + ': "Execute" method: Operation not allowed by this connection type.');
end;

function TioSQLDestination.QualifiedFieldName(
  const AQualifiedFieldName: Boolean): IioSQLDestination;
begin
  Result := Self;
  Self.FQualifiedFieldName := AQualifiedFieldName;
end;

function TioSQLDestination.Execute(const AIgnoreObjNotExists:Boolean): Integer;
var
  LConnection: IioConnection;
begin
  LConnection := TioDBFactory.Connection(FConnectionDefName);
  if LConnection.IsDBConnection then
    Result := LConnection.AsDBConnection.GetConnection.ExecSQL(Self.Translate, AIgnoreObjNotExists)
  else
    raise EioException.Create(Self.ClassName + ': "Execute" method: Operation not allowed by this connection type.');
end;

function TioSQLDestination.SelfClass(
  const ASelfClassName: String): IioSQLDestination;
begin
  Result := Self;
  FSelfClassName := ASelfClassName;
end;

function TioSQLDestination.SelfClass(
  const ASelfClassRef: TioClassRef): IioSQLDestination;
begin
  Result := Self.SelfClass(ASelfClassRef.ClassName);
end;

function TioSQLDestination.Translate: String;
begin
  Result := TioSqlTranslator.Translate(FSQL, FSelfClassName, FQualifiedFieldName);
end;

function TioSQLDestination.ToMemTable: TFDMemTable;
begin
  Result := TFDMemTable.Create(nil);
  Self.ToMemTable(Result);
end;

procedure TioSQLDestination.ToMemTable(const AMemTable: TFDMemTable);
var
  LQry: IioQuery;
begin
  // Create and execute the query
  LQry := Self.ToQuery;
  LQry.GetQuery.FetchOptions.Unidirectional := False;
  LQry.Open;
  try
    LQry.GetQuery.FetchAll;
    // Copy data to the MemoryTable
    AMemTable.Data := LQry.GetQuery.Data;
    AMemTable.First;
  finally
    LQry.Close;
  end;
end;

procedure TioSQLDestination.ToQuery(const AQuery: IioQuery);
begin
  Self.ToQuery(AQuery.GetQuery);
end;

function TioSQLDestination.ToQuery: IioQuery;
begin
  Result := TioDBFactory.Query(FConnectionDefName);
  Self.ToQuery(Result);
end;

procedure TioSQLDestination.ToQuery(const AQuery: TFDQuery);
begin
  AQuery.SQL.Text := Self.Translate;
end;

end.
