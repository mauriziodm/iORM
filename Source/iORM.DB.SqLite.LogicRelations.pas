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



unit iORM.DB.SqLite.LogicRelations;

interface

uses
  iORM.DB.Interfaces,
  iORM.Interfaces;

type
  TioLogicRelationSqLite = class(TioLogicRelation)
    class function _And: IioSqlItem; override;
    class function _Or: IioSqlItem; override;
    class function _Not: IioSqlItem; override;
    class function _OpenPar: IioSqlItem; override;
    class function _ClosePar: IioSqlItem; override;
  end;

implementation

uses
  iORM.SqlItems;

{ TioLrFactory }

class function TioLogicRelationSqLite._And: IioSqlItem;
begin
  Result := TioSqlItem.Create(' AND ');
end;

class function TioLogicRelationSqLite._ClosePar: IioSqlItem;
begin
  Result := TioSqlItem.Create(')');
end;

class function TioLogicRelationSqLite._Not: IioSqlItem;
begin
  Result := TioSqlItem.Create(' NOT ');
end;

class function TioLogicRelationSqLite._OpenPar: IioSqlItem;
begin
  Result := TioSqlItem.Create('(');
end;

class function TioLogicRelationSqLite._Or: IioSqlItem;
begin
  Result := TioSqlItem.Create(' OR ');
end;

end.
