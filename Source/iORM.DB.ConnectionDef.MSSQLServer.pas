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
unit iORM.DB.ConnectionDef.MSSQLServer;

interface

uses
  FireDAC.Phys.MSSQL,  // For compatibility with FireDAC without need to put then Phys driver in the project
  iORM.DB.ConnectionDef, System.SysUtils, iORM.DBBuilder.Interfaces;

type

  // Class for MSSQLServer connection
  TioSQLServerConnectionDef = class(TioCustomConnectionDef)
  public
    procedure RegisterConnectionDef; override;
    function DBBuilder: IioDBBuilderEngine; override;
    // Properties
    property ConnectionDef;
  published
    // Properties
    property AsDefault;
    property AutoCreateDB;
    property Database;
    property DatabaseStdFolder;
    property Encrypt;
    property OSAuthent;
    property Password;
    property Persistent;
    property Pooled;
    property Server;
    property UserName;
    property SynchroStrategy_Client;
    // Events
    property AfterCreateOrAlterDB;
    property AfterRegister;
    property BeforeCreateOrAlterDB;
    property BeforeRegister;
    property ExceptionOnCreateOrAlterDB;
  end;

implementation

uses
  iORM.DB.ConnectionContainer;

{ TioSQLServerConnectionDef }

function TioSQLServerConnectionDef.DBBuilder: IioDBBuilderEngine;
begin
  inherited;
  // Only to elevate the method visibility
end;

procedure TioSQLServerConnectionDef.RegisterConnectionDef;
begin
  inherited;
  ConnectionDef := TioConnectionManager.NewSQLServerConnectionDef(Server,
    GetFullPathDatabase, UserName, Password, AsDefault, SynchroStrategy_Client,
    Persistent, Pooled, Name);
  // Encript
  if not Encrypt.IsEmpty then
    ConnectionDef.Params.Values['Encrypt'] := Encrypt;
  // OSAuthent
  case OSAuthent of
    TioOSAuthent.oaNo:  ConnectionDef.Params.Values['OSAuthent'] := 'No';
    TioOSAuthent.oaYes: ConnectionDef.Params.Values['OSAuthent'] := 'Yes';
  end;
  // NB: Inherited must be the last line (set FIsRegistered)
  inherited;
end;

end.
