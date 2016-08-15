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
    class function LoadObjectByClassOnly(const AWhere: IioWhere; const AObj:TObject): TObject; override;
  end;


implementation

uses
  System.JSON, iORM, System.Classes, iORM.Strategy.DB, iORM.DB.Interfaces, iORM.DB.ConnectionContainer,
  iORM.DB.Factory, System.Generics.Collections, iORM.Rtti.Utilities,
  iORM.DuckTyped.Interfaces, iORM.REST.Interfaces, iORM.REST.Factory;

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
var
  LConnection: IioConnectionREST;
begin
  inherited;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(AWhere.GetConnectionName).AsRESTConnection;
  LConnection.RequestBody.Where := AWhere;
  LConnection.Execute('LoadList');
  // Deserialize  the JSONDataValue to the result object
  io.Mapper.FromJSON(LConnection.ResponseBody.JSONDataValue).byFields.TypeAnnotationsON.&To(AList);
end;

class function TioStrategyREST.LoadObject(const AWhere: IioWhere;
  const AObj: TObject): TObject;
var
  LConnection: IioConnectionREST;
begin
  inherited;
  // Get the connection, set the request and execute it
  LConnection := TioDBFactory.Connection(AWhere.GetConnectionName).AsRESTConnection;
  LConnection.RequestBody.Where := AWhere;
  LConnection.Execute('LoadObject');
  // Deserialize  the JSONDataValue to the result object
  if Assigned(AObj) then
    io.Mapper.FromJSON(LConnection.ResponseBody.JSONDataValue).byFields.TypeAnnotationsON.&To(AObj)
  else
    Result := io.Mapper.FromJSON(LConnection.ResponseBody.JSONDataValue).byFields.TypeAnnotationsON.ToObject;
end;

class function TioStrategyREST.LoadObjectByClassOnly(const AWhere: IioWhere;
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
