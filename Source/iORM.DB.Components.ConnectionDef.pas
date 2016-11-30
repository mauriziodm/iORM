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





unit iORM.DB.Components.ConnectionDef;

interface

uses
  System.Classes;

type

  TioDBStdFolder = (sfDocuments, sfSharedDocuments, sfHome, sfPublic, sfTemp);

  // Base class for all ConnectionDef components
  TioBaseConnectionDef = class(TComponent)
  strict private
    FPersistent: Boolean;
  published
    constructor Create(AOwner: TComponent); override;
    property Persistent: Boolean read FPersistent write FPersistent;
  end;

  // REST connection def
  TioRESTConnectionDef = class(TioBaseConnectionDef)
  strict private
    FBaseURL: String;
  published
    constructor Create(AOwner: TComponent); override;
    property BaseURL: String read FBaseURL write FBaseURL;
  end;

  // Base class for all database ConnectionDef components
  TioDBConnectionDef = class(TioBaseConnectionDef)
  strict private
    FDatabase: String;
    FDatabaseStdFolder: TioDBStdFolder;
  published
    constructor Create(AOwner: TComponent); override;
    property Database: String read FDatabase write FDatabase;
    property DatabaseStdFolder: TioDBStdFolder read FDatabaseStdFolder write FDatabaseStdFolder;
  end;

  // SQLite ConnectionDef component
  TioSQLiteConnectionDef = class(TioDBConnectionDef)
  end;

  // SQL Server ConnectionDef component
  TioFirebirdConnectionDef = class(TioDBConnectionDef)
  strict private
    FPassword: String;
    FUserName: String;
    FServer: String;
    FCharSet: String;
  published
    property Server:String read FServer write FServer;
    property UserName: String read FUserName write FUserName;
    property Password: String read FPassword write FPassword;
    property CharSet: String read FCharSet write FCharSet;
  end;

  // SQL Server ConnectionDef component
  TioSQLServerConnectionDef = class(TioDBConnectionDef)
  strict private
    FPassword: String;
    FUserName: String;
    FServer: String;
  published
    property Server:String read FServer write FServer;
    property UserName: String read FUserName write FUserName;
    property Password: String read FPassword write FPassword;
  end;

implementation

{ TioBaseConnectionDef }

constructor TioBaseConnectionDef.Create(AOwner: TComponent);
begin
  inherited;
  FPersistent := False;
end;

{ TioDBConnectionDef }

constructor TioDBConnectionDef.Create(AOwner: TComponent);
begin
  inherited;
  FDatabaseStdFolder := TioDBStdFolder.sfDocuments;
end;

{ TioRESTConnectionDef }

constructor TioRESTConnectionDef.Create(AOwner: TComponent);
begin
  inherited;
  Persistent := True;
end;

end.
