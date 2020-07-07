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



unit iORM.DB.SQL.Destination;

interface

uses
  iORM.DB.Interfaces, System.Classes, iORM.CommonTypes,
  FireDAC.Comp.Client, Data.DB;

type

  TioSQLDestination = class(TInterfacedObject, IioSQLDestination)
  private
    FSQL: String;
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
    function SelfClass(const ASelfClassName:String): IioSQLDestination; overload;
    function SelfClass(const ASelfClassRef: TioClassRef): IioSQLDestination; overload;
    function QualifiedFieldName(const AQualifiedFieldName:Boolean=True): IioSQLDestination;
    // Getters
    function GetIgnoreObjNotExists: Boolean;
  public
    constructor Create(const ASQL:String); overload;
  end;

implementation

uses
  iORM.SqlTranslator, iORM.DB.Factory, iORM.Exceptions, iORM.Strategy.Factory,
  iORM.AbstractionLayer.Framework;

{ TioSQLDestination }

constructor TioSQLDestination.Create(const ASQL: String);
begin
  inherited Create;

  TioApplication.CheckIfAbstractionLayerComponentExists;

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
  Result := TioStrategyFactory.GetStrategy('').SQLDest_Execute(Self);
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
  TioStrategyFactory.GetStrategy('').SQLDest_LoadDataSet(Self, AMemTable);
end;

end.
