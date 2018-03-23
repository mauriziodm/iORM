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





unit iORM.DB.Components.ConnectionDef.DesignTime;

interface

  procedure Register;

implementation

uses
  System.Classes, iORM.DB.Components.ConnectionDef,
  iORM.REST.Peculiarity.REST.PeculiarityMapper,
  iORM.DB.Peculiarity.SqLite.PeculiarityMapper,
  iORM.DB.Peculiarity.Firebird.PeculiarityMapper,
  iORM.DB.Peculiarity.Interbase.PeculiarityMapper,
  iORM.DB.Peculiarity.MsSqlServer.PeculiarityMapper,
  iORM.DB.Peculiarity.Oracle.PeculiarityMapper,
  iORM.DB.Peculiarity.Postgres.PeculiarityMapper;


  procedure Register;
  begin
    RegisterComponents('iORM', [TioSQLMonitor]);
    RegisterComponents('iORM', [TioRESTConnectionDef]);
    RegisterComponents('iORM', [TioSQLiteConnectionDef]);
    RegisterComponents('iORM', [TioFirebirdConnectionDef]);
    RegisterComponents('iORM', [TioInterbaseConnectionDef]);
    RegisterComponents('iORM', [TioSQLServerConnectionDef]);
    RegisterComponents('iORM', [TioOracleConnectionDef]);
    RegisterComponents('iORM', [TioPostgresConnectionDef]);
//    RegisterComponents('iORM', [TioMySQLConnectionDef]);
  end;

end.
