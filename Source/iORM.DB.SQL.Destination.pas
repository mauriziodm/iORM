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
    FConnectionDefName: String;
    FIgnoreObjNotExists: Boolean;
    FOwns: Boolean;
    FQualifiedFieldName: Boolean;
    FSQL: TStrings;
    FSelfClassName: String;
    FTranslate: Boolean;
    // Destinations
    procedure Execute(const AIgnoreObjNotExists:Boolean=False);
    function ToMemTable: TFDMemTable; overload;
    procedure ToMemTable(const AMemTable:TFDMemTable); overload;
    // Informations
    function Connection(const AConnectionDefName: String): IioSQLDestination;
    function DoNotTranslate: IioSQLDestination;
    function SelfClass(const ASelfClassName:String): IioSQLDestination; overload;
    function SelfClass(const ASelfClassRef: TioClassRef): IioSQLDestination; overload;
    function QualifiedFieldName(const AQualifiedFieldName:Boolean=True): IioSQLDestination;
    // Getters
    function GetConnectionDefName: String;
    function GetIgnoreObjNotExists: Boolean;
    function GetSQL: String;
  public
    constructor Create(const ASQL: String); overload;
    constructor Create(const ASQL: TStrings; const AOwns: Boolean = False); overload;
    destructor Destroy; override;
  end;

implementation

uses
  iORM.SqlTranslator, iORM.DB.Factory, iORM.Exceptions, iORM.Strategy.Factory, iORM.Abstraction;

{ TioSQLDestination }

constructor TioSQLDestination.Create(const ASQL: String);
var
  LSQL: TStrings;
begin
  LSQL := TStringList.Create;
  LSQL.Text := ASQL;
  Create(LSQL, True);
end;

function TioSQLDestination.QualifiedFieldName(
  const AQualifiedFieldName: Boolean): IioSQLDestination;
begin
  Result := Self;
  Self.FQualifiedFieldName := AQualifiedFieldName;
end;

function TioSQLDestination.Connection(const AConnectionDefName: String): IioSQLDestination;
begin
  Result := Self;
  FConnectionDefName := AConnectionDefName;
end;

constructor TioSQLDestination.Create(const ASQL: TStrings; const AOwns: Boolean);
begin
  inherited Create;

  TioApplication.CheckIfAbstractionLayerComponentExists;

  FConnectionDefName := '';
  FSelfClassName := '';
  FQualifiedFieldName := False;
  FIgnoreObjNotExists := False;
  FTranslate := True;

  FSQL := ASQL;
  FOwns := AOwns;
end;

destructor TioSQLDestination.Destroy;
begin
  if FOwns then
    FSQL.Free;
  inherited;
end;

function TioSQLDestination.DoNotTranslate: IioSQLDestination;
begin
  Result := Self;
  FTranslate := False;
end;

procedure TioSQLDestination.Execute(const AIgnoreObjNotExists:Boolean);
begin
  FIgnoreObjNotExists := AIgnoreObjNotExists;
  TioStrategyFactory.GetStrategy(FConnectionDefName).SQLDest_Execute(Self);
end;

function TioSQLDestination.GetConnectionDefName: String;
begin
  Result := FConnectionDefName;
end;

function TioSQLDestination.GetIgnoreObjNotExists: Boolean;
begin
  Result := FIgnoreObjNotExists;
end;

function TioSQLDestination.GetSQL: String;
begin
  if FTranslate then
    Result := TioSqlTranslator.Translate(FSQL.Text, FSelfClassName, FQualifiedFieldName)
  else
    Result := FSQL.Text;
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

function TioSQLDestination.ToMemTable: TFDMemTable;
begin
  Result := TFDMemTable.Create(nil);
  Self.ToMemTable(Result);
end;

procedure TioSQLDestination.ToMemTable(const AMemTable: TFDMemTable);
begin
  TioStrategyFactory.GetStrategy(FConnectionDefName).SQLDest_LoadDataSet(Self, AMemTable);
end;

end.
