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



unit iORM.Strategy.REST;

interface

uses
  iORM.Strategy.Interfaces, iORM.Where.Interfaces;

type

  // Strategy class for database
  TioStrategyREST = class(TioStrategyIntf)
  public
    class procedure StartTransaction(const AConnectionName:String); override;
    class procedure CommitTransaction(const AConnectionName:String); override;
    class procedure RollbackTransaction(const AConnectionName:String); override;
    class procedure PersistObject(const AObj: TObject; const ARelationPropertyName:String; const ARelationOID:Integer; const ABlindInsert:Boolean; const AConnectionName:String); override;
    class procedure PersistCollection(const ACollection:TObject; const ARelationPropertyName:String; const ARelationOID:Integer; const ABlindInsert:Boolean; const AConnectionName:String); override;
    class procedure DeleteObject(const AObj: TObject; const AConnectionName:String); override;
    class procedure Delete(const AWhere: IioWhere); override;
    class procedure LoadList(const AWhere: IioWhere; const AList:TObject); override;
    class function LoadObject(const AWhere: IioWhere; const AObj:TObject): TObject; override;
  end;


implementation

{ TioStrategyREST }

class procedure TioStrategyREST.CommitTransaction(
  const AConnectionName: String);
begin
  inherited;

end;

class procedure TioStrategyREST.Delete(const AWhere: IioWhere);
begin
  inherited;

end;

class procedure TioStrategyREST.DeleteObject(const AObj: TObject;
  const AConnectionName: String);
begin
  inherited;

end;

class procedure TioStrategyREST.LoadList(const AWhere: IioWhere;
  const AList: TObject);
begin
  inherited;

end;

class function TioStrategyREST.LoadObject(const AWhere: IioWhere;
  const AObj: TObject): TObject;
begin

end;

class procedure TioStrategyREST.PersistCollection(const ACollection: TObject;
  const ARelationPropertyName: String; const ARelationOID: Integer;
  const ABlindInsert: Boolean; const AConnectionName: String);
begin
  inherited;

end;

class procedure TioStrategyREST.PersistObject(const AObj: TObject;
  const ARelationPropertyName: String; const ARelationOID: Integer;
  const ABlindInsert: Boolean; const AConnectionName: String);
begin
  inherited;

end;

class procedure TioStrategyREST.RollbackTransaction(
  const AConnectionName: String);
begin
  inherited;

end;

class procedure TioStrategyREST.StartTransaction(const AConnectionName: String);
begin
  inherited;

end;

end.
