{
  ****************************************************************************
  *                                                                          *
  *           iORM - (interfaced ORM)                                        *
  *                                                                          *
  *           Copyright (C) 2015-2023 Maurizio Del Magno                     *
  *                                                                          *
  *           mauriziodm@levantesw.it                                        *
  *           mauriziodelmagno@gmail.com                                     *
  *           https://github.com/mauriziodm/iORM.git                         *
  *                                                                          *
  ****************************************************************************
  *                                                                          *
  * This file is part of iORM (Interfaced Object Relational Mapper).         *
  *                                                                          *
  * Licensed under the GNU Lesser General Public License, Version 3;         *
  *  you may not use this file except in compliance with the License.        *
  *                                                                          *
  * iORM is free software: you can redistribute it and/or modify             *
  * it under the terms of the GNU Lesser General Public License as published *
  * by the Free Software Foundation, either version 3 of the License, or     *
  * (at your option) any later version.                                      *
  *                                                                          *
  * iORM is distributed in the hope that it will be useful,                  *
  * but WITHOUT ANY WARRANTY; without even the implied warranty of           *
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            *
  * GNU Lesser General Public License for more details.                      *
  *                                                                          *
  * You should have received a copy of the GNU Lesser General Public License *
  * along with iORM.  If not, see <http://www.gnu.org/licenses/>.            *
  *                                                                          *
  ****************************************************************************
}
unit iORM.DBBuilder.Schema.RDBMSInfo;

interface

uses
  iORM.DBBuilder.Interfaces;

type

  TioDBBuilderSchemaRDBMSInfo = class(TInterfacedObject, IioDBBuilderSchemaRDBMSInfo)
  private
    FMajorVersion: Integer;
    FMinorVersion: Integer;
    FName: String;
    FRaw: String;
    FVersion: String;
    function GetMajorVersion: Integer;
    function GetMinorVersion: Integer;
    function GetName: String;
    function GetRaw: String;
    function GetVersion: String;
  public
    constructor Create(const AName, ARaw, AVersion: String; const AMajorVersion, AMinorVersion: Integer);
    function IsAtLeast(const AMajor, AMinor: Integer): Boolean;
    function ToString: String; override;
  end;

implementation

uses
  System.SysUtils;

{ TioDBBuilderSchemaRDBMSInfo }

constructor TioDBBuilderSchemaRDBMSInfo.Create(const AName, ARaw, AVersion: String; const AMajorVersion, AMinorVersion: Integer);
begin
  FName := AName;
  FRaw := ARaw;
  FVersion := AVersion;
  FMajorVersion := AMajorVersion;
  FMinorVersion := AMinorVersion;
end;

function TioDBBuilderSchemaRDBMSInfo.GetMajorVersion: Integer;
begin
  Result := FMajorVersion;
end;

function TioDBBuilderSchemaRDBMSInfo.GetMinorVersion: Integer;
begin
  Result := FMinorVersion;
end;

function TioDBBuilderSchemaRDBMSInfo.GetName: String;
begin
  Result := FName;
end;

function TioDBBuilderSchemaRDBMSInfo.GetRaw: String;
begin
  Result := FRaw;
end;

function TioDBBuilderSchemaRDBMSInfo.GetVersion: String;
begin
  Result := FVersion;
end;

function TioDBBuilderSchemaRDBMSInfo.IsAtLeast(const AMajor, AMinor: Integer): Boolean;
begin
  Result := (FMajorVersion > AMajor) or ((FMajorVersion = AMajor) and (FMinorVersion >= AMinor));
end;

function TioDBBuilderSchemaRDBMSInfo.ToString: String;
begin
  Result := Format('%s %s (Major: %d, Minor: %d)', [FName, FVersion, FMajorVersion, FMinorVersion]);
end;

end.
