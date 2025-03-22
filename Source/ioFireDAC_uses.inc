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
{
  ************************************************************************
  *                         A T T E N T I O N !!!                        *
  *                         A T T E N T I O N !!!                        *
  *                         A T T E N T I O N !!!                        *
  *                                                                      *
  * This is a list of units to include with the $I directive in the uses *
  *  section of those units where FireDAC services are required.         *
  *                                                                      *
  ************************************************************************
}
{$IFDEF MSWINDOWS}
  FireDAC.Moni.Base,
  FireDAC.Moni.RemoteClient,
  FireDAC.Moni.FlatFile,
{$ENDIF}
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Phys.FB,
  FireDAC.Stan.ExprFuncs,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  FireDAC.DApt,
  FireDAC.UI.Intf,
{$IFDEF CONSOLE}  // Non più necessaria???
  FireDAC.ConsoleUI.Wait,
{$ENDIF}
  FireDAC.Stan.Async,
  FireDAC.Comp.UI,
  FireDAC.Comp.Client,

