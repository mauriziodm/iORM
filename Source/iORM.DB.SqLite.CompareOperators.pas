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



unit iORM.DB.SqLite.CompareOperators;

interface

uses
  iORM.DB.Interfaces,
  iORM.Interfaces;

type
  TioCompareOperatorSqLite = class(TioCompareOperator)
    class function _Equal: IioSqlItem; override;
    class function _Greater: IioSqlItem; override;
    class function _Lower: IioSqlItem; override;
    class function _GreaterOrEqual: IioSqlItem; override;
    class function _LowerOrEqual: IioSqlItem; override;
    class function _NotEqual: IioSqlItem; override;
    class function _Like: IioSqlItem; override;
    class function _IsNull: IioSqlItem; override;
    class function _IsNotNull: IioSqlItem; override;
  end;

implementation

uses
  iORM.SqlItems;


class function TioCompareOperatorSqLite._Equal: IioSqlItem;
begin
  Result := TioSqlItem.Create(' = ');
end;

class function TioCompareOperatorSqLite._GreaterOrEqual: IioSqlItem;
begin
  Result := TioSqlItem.Create(' >= ');
end;

class function TioCompareOperatorSqLite._Greater: IioSqlItem;
begin
  Result := TioSqlItem.Create(' > ');
end;

class function TioCompareOperatorSqLite._IsNotNull: IioSqlItem;
begin
  Result := TioSqlItem.Create(' IS NOT NULL ');
end;

class function TioCompareOperatorSqLite._IsNull: IioSqlItem;
begin
  Result := TioSqlItem.Create(' IS NULL ');
end;

class function TioCompareOperatorSqLite._Like: IioSqlItem;
begin
  Result := TioSqlItem.Create(' LIKE ');
end;

class function TioCompareOperatorSqLite._LowerOrEqual: IioSqlItem;
begin
  Result := TioSqlItem.Create(' <= ');
end;

class function TioCompareOperatorSqLite._Lower: IioSqlItem;
begin
  Result := TioSqlItem.Create(' < ');
end;

class function TioCompareOperatorSqLite._NotEqual: IioSqlItem;
begin
  Result := TioSqlItem.Create(' <> ');
end;

end.
