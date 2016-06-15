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
    class function GetDBCreator: IioDBCreator;
    class function GetSqlGenerator: IioDBCreatorSqlGenerator;
  end;

implementation

uses
  iORM.DB.DBCreator, iORM.DB.DBCreator.SqLite.SqlGenerator,
  iORM.DB.Factory;

{ TioDBCreatorFactory }

class function TioDBCreatorFactory.GetDBCreator: IioDBCreator;
begin
  Result := TioDBCreator.Create(Self.GetSqlGenerator);
end;

class function TioDBCreatorFactory.GetField(AFieldName: String; AIsKeyField: Boolean;
  AProperty:IioContextProperty; ASqlGenerator:IioDBCreatorSqlGenerator; AIsClassFromField:Boolean): IioDBCreatorField;
begin
  Result := TioDBCreatorField.Create(AFieldName, AIsKeyField, AProperty, ASqlGenerator, AIsClassFromField);
end;

class function TioDBCreatorFactory.GetSqlGenerator: IioDBCreatorSqlGenerator;
begin
  // NB: Query for BD Creation only for the default ConnectionDef
  Result := TioDBCreatorSqLiteSqlGenerator.Create(TioDbFactory.Query(''));
end;

class function TioDBCreatorFactory.GetTable(
  const ATableName: String; const AIsClassFromField:Boolean; const ASqlGenerator:IioDBCreatorSqlGenerator;
  const AMap:IioMap): IioDBCreatorTable;
begin
  Result := TioDBCreatorTable.Create(ATableName, AIsClassFromField, ASqlGenerator, AMap);
end;

end.
