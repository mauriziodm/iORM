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
unit iORM.DBBuilder.SqlGenerator.MSSqlServer;

interface

uses
  iORM.DBBuilder.SqlGenerator.Base, iORM.DBBuilder.Interfaces, iORM.Attributes,
  iORM.CommonTypes;

const
  CONNECTION_NAME_MSSQL_MASTER = 'MSSQL_MASTER';

  INVALID_FIELDTYPE_CONVERSIONS = '[datetime->decimal][datetime->numeric][datetime->int][date->decimal][date->numeric][date->int]' +
    '[time->numeric][time->decimal][time->int][varchar->decimal][varchar->int][varchar->date][varchar->time][varchar->datetime]' +
    '[nvarchar->decimal][nvarchar->int][nvarchar->date][nvarchar->time][nvarchar->datetime] [char->decimal][char->int][char->date]+' +
    '[char->time][char->datetime][nchar->decimal][nchar->int][nchar->date][nchar->time][nchar->datetime]';

type

  TioDBBuilderSqlGenMSSqlServer = class(TioDBBuilderSqlGenBase, IioDBBuilderSqlGenerator)
  protected
    // ==========================================================
    // FIELD RELATED METHODS
    // ----------------------------------------------------------
    function BuildSQL_AlterField(const ATable: IioDBBuilderSchemaTable; const AField: IioDBBuilderSchemaField): string; override;

    // ==========================================================
    // KEY GENERATION CAPABILITY METHODS
    // ----------------------------------------------------------
    function GetDefaultKeyGenerationStrategy: TioKeyGenerationStrategy; override;
    function Supports_Identity: Boolean; override;
    function Supports_Sequence: Boolean; override;

    // ==========================================================
    // SQL GENERATOR UTILITIES
    // ----------------------------------------------------------
    function LoadDBMSInfo: IioDBBuilderSchemaRDBMSInfo; override;
  end;

implementation

uses
  System.SysUtils,
  iORM.DB.Interfaces,
  iORM.DB.QueryEngine,
  iORM.DBBuilder.Factory,
  iORM.Exceptions;

{ TioDBBuilderSqlGenMSSqlServer }

function TioDBBuilderSqlGenMSSqlServer.LoadDBMSInfo: IioDBBuilderSchemaRDBMSInfo;
var
  LQuery: IioQuery;
  LRaw, LVersion: String;
  LMajorVersion, LMinorVersion: Integer;
  LParts: TArray<string>;
begin
  // Query the database for raw version info
  LQuery := TioQueryEngine.GetRawQuery(
    ConnectionDefName,
    'SELECT @@VERSION AS VERSION',
    True
  );

  if not LQuery.Eof then
    LRaw := LQuery.Fields.FieldByName('VERSION').AsString.Trim
  else
    LRaw := '';

  // Query for clean product version (e.g., '15.0.4261.1')
  LQuery := TioQueryEngine.GetRawQuery(
    ConnectionDefName,
    'SELECT CAST(SERVERPROPERTY(''ProductVersion'') AS VARCHAR(50)) AS VERSION',
    True
  );

  if not LQuery.Eof then
    LVersion := LQuery.Fields.FieldByName('VERSION').AsString.Trim
  else
    LVersion := '';

  LMajorVersion := 0;
  LMinorVersion := 0;

  // Parse version: '15.0.4261.1' -> Major=15, Minor=0
  LParts := LVersion.Split(['.']);
  if Length(LParts) >= 2 then
  begin
    LMajorVersion := StrToIntDef(LParts[0], 0);
    LMinorVersion := StrToIntDef(LParts[1], 0);
  end;

  Result := TioDBBuilderFactory.NewSchemaRDBMSInfo(
    'SQL Server',
    LRaw,
    LVersion,
    LMajorVersion,
    LMinorVersion
  );
end;

function TioDBBuilderSqlGenMSSqlServer.BuildSQL_AlterField(const ATable: IioDBBuilderSchemaTable;
  const AField: IioDBBuilderSchemaField): string;
begin
  // TODO: MS SQL Server BuildSQL_AlterField implementation not yet complete
  raise EioDBBuilderException.Create(ClassName, 'BuildSQL_AlterField',
    'MS SQL Server ALTER FIELD is not yet implemented in DBBuilder');
end;

function TioDBBuilderSqlGenMSSqlServer.GetDefaultKeyGenerationStrategy: TioKeyGenerationStrategy;
begin
  // SQL Server default: use Identity
  Result := kgsIdentity;
end;

function TioDBBuilderSqlGenMSSqlServer.Supports_Identity: Boolean;
begin
  Result := True;
end;

function TioDBBuilderSqlGenMSSqlServer.Supports_Sequence: Boolean;
begin
  // SQL Server 2012+ supports sequences
  Result := True;
end;

end.
