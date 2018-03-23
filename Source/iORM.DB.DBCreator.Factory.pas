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



unit iORM.DB.DBCreator.Factory;

interface

uses
  iORM.DB.DBCreator.Interfaces, System.Rtti, iORM.DB.Interfaces,
  iORM.Context.Properties.Interfaces, iORM.Context.Table.Interfaces,
  iORM.Context.Map.Interfaces;

type

  TioDBCreatorFactory = class
  public
    class function GetField(AFieldName:String; AIsKeyField:Boolean; AProperty:IioContextProperty; ASqlGenerator:IioDBCreatorSqlGenerator; AIsClassFromField:Boolean): IioDBCreatorField;
    class function GetTable(const ATableName: String; const AIsClassFromField:Boolean; const ASqlGenerator:IioDBCreatorSqlGenerator; const AMap:IioMap): IioDBCreatorTable;
    class function GetDBCreator: IioDBCreator;  overload;
    class function GetDBCreator(ASqlGenerator:IioDBCreatorSqlGenerator) : IioDBCreator; overload;
    class function GetSqlGenerator: IioDBCreatorSqlGenerator;
  end;

implementation

uses
  iORM.DB.DBCreator, iORM.DB.DBCreator.SqLite.SqlGenerator,
  iORM.DB.DBCreator.LogFile.SqlGenerator, //!!!!
  iORM.DB.Factory;

{ TioDBCreatorFactory }

class function TioDBCreatorFactory.GetDBCreator: IioDBCreator;
begin
  Result := TioDBCreator.Create(Self.GetSqlGenerator);
end;

class function TioDBCreatorFactory.GetDBCreator(
  ASqlGenerator: IioDBCreatorSqlGenerator): IioDBCreator;
begin
  Result := TioDBCreator.Create(ASqlGenerator);
end;

class function TioDBCreatorFactory.GetField(AFieldName: String; AIsKeyField: Boolean;
  AProperty:IioContextProperty; ASqlGenerator:IioDBCreatorSqlGenerator; AIsClassFromField:Boolean): IioDBCreatorField;
begin
  Result := TioDBCreatorField.Create(AFieldName, AIsKeyField, AProperty, ASqlGenerator, AIsClassFromField);
end;

class function TioDBCreatorFactory.GetSqlGenerator: IioDBCreatorSqlGenerator;
begin
  // NB: Query for DB Creation only for the default ConnectionDef
  Result := TioDBCreatorSqLiteSqlGenerator.Create(TioDbFactory.Query(''));
//  Result := TioDBCreatorLogFileSqlGenerator.Create(TioDbFactory.Query('')); //!!!!
end;

class function TioDBCreatorFactory.GetTable(
  const ATableName: String; const AIsClassFromField:Boolean; const ASqlGenerator:IioDBCreatorSqlGenerator;
  const AMap:IioMap): IioDBCreatorTable;
begin
  Result := TioDBCreatorTable.Create(ATableName, AIsClassFromField, ASqlGenerator, AMap);
end;

end.
