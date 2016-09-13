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
    FConnectionName: String;
    FSelfClassName: String;
    FQualifiedFieldName: Boolean;
    FIgnoreObjNotExists: Boolean;
    // Destinations
    {TODO 5 -oOwner -cGeneral : Un altro overload di Trabslate che accetta un'interfaccia e che genera automaticamente una query che fa l'UNION ALL di tutte le classi che implementano l'interfaccia stessa}
    function GetTranslatedSQL: String;
    function ToMemTable: TFDMemTable; overload;
    procedure ToMemTable(const AMemTable:TFDMemTable); overload;
    function Execute(const AIgnoreObjNotExists:Boolean=False): Integer;
    // Informations
    function Connection(const AConnectionName:String): IioSQLDestination;
    function SelfClass(const ASelfClassName:String): IioSQLDestination; overload;
    function SelfClass(const ASelfClassRef: TioClassRef): IioSQLDestination; overload;
    function QualifiedFieldName(const AQualifiedFieldName:Boolean=True): IioSQLDestination;
    // Getters
    function GetConnectionName: String;
    function GetIgnoreObjNotExists: Boolean;
  public
    constructor Create(const ASQL:String); overload;
  end;

implementation

uses
  iORM.SqlTranslator, iORM.DB.Factory, iORM.Exceptions, iORM.Strategy.Factory;

{ TioSQLDestination }

function TioSQLDestination.Connection(
  const AConnectionName: String): IioSQLDestination;
begin
  Result := Self;
  FConnectionName := AConnectionName;
end;

constructor TioSQLDestination.Create(const ASQL: String);
begin
  inherited Create;
  FConnectionName := '';
  FSelfClassName := '';
  FQualifiedFieldName := False;
  FIgnoreObjNotExists := False;
  FSQL := ASQL;
end;

function TioSQLDestination.QualifiedFieldName(
  const AQualifiedFieldName: Boolean): IioSQLDestination;
begin
  Result := Self;
  Self.FQualifiedFieldName := AQualifiedFieldName;
end;

function TioSQLDestination.Execute(const AIgnoreObjNotExists:Boolean): Integer;
begin
  FIgnoreObjNotExists := AIgnoreObjNotExists;
  TioStrategyFactory.GetStrategy(FConnectionName).SQLDest_Execute(Self);
end;

function TioSQLDestination.GetConnectionName: String;
begin
  Result := FConnectionName;
end;

function TioSQLDestination.GetIgnoreObjNotExists: Boolean;
begin
  Result := FIgnoreObjNotExists;
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

function TioSQLDestination.GetTranslatedSQL: String;
begin
  Result := TioSqlTranslator.Translate(FSQL, FSelfClassName, FQualifiedFieldName);
end;

function TioSQLDestination.ToMemTable: TFDMemTable;
begin
  Result := TFDMemTable.Create(nil);
  Self.ToMemTable(Result);
end;

procedure TioSQLDestination.ToMemTable(const AMemTable: TFDMemTable);
begin
  TioStrategyFactory.GetStrategy(FConnectionName).SQLDest_LoadDataSet(Self, AMemTable);
end;

end.
