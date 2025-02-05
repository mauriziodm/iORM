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
unit iORM.PersistenceStrategy.Factory;

interface

uses
  iORM.DB.Interfaces, iORM.PersistenceStrategy.Interfaces, iORM.CommonTypes;

type

  TioPersistenceStrategyFactory = class
  private
    class function _NewPSRequest(const FillSessionRelatedProperties: Boolean): IioPersistenceStrategyRequest; inline;
  public
    class function GetStrategy(const AConnectionName: String): TioPersistenceStrategyRef;
    class function ConnectionTypeToStrategy(const AConnectionType: TioConnectionType): TioPersistenceStrategyRef;
    // operation type specific persistence strategy request factories
    class function NewPSRequest_ByJsonString(const AJsonString: String): IioPersistenceStrategyRequest;
    class function NewPSRequest_Delete(const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte): IioPersistenceStrategyRequest;
    class function NewPSRequest_Load(const AIntent: TioPersistenceIntentType): IioPersistenceStrategyRequest;
    class function NewPSRequest_Persist(const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte; const ARelationPropertyName: String;
      const ARelationOID: Integer; const AMasterPropertyName, AMasterPropertyPath: String): IioPersistenceStrategyRequest;
  end;
implementation

uses
  iORM.PersistenceStrategy.DB, iORM.PersistenceStrategy.Http, iORM.DB.ConnectionContainer,
  iORM.PersistenceStrategy.Request;

{ TioStrategyFactory }

class function TioPersistenceStrategyFactory.ConnectionTypeToStrategy(const AConnectionType: TioConnectionType): TioPersistenceStrategyRef;
begin
  case AConnectionType of
    TioConnectionType.ctHTTP:
      Result := TioPersistenceStrategyHttp;
  else
    Result := TioPersistenceStrategyDB;
  end;
end;

class function TioPersistenceStrategyFactory.GetStrategy(const AConnectionName: String): TioPersistenceStrategyRef;
begin
  Result := TioConnectionManager.GetConnectionInfo(AConnectionName).PersistenceStrategy;
end;

class function TioPersistenceStrategyFactory._NewPSRequest(const FillSessionRelatedProperties: Boolean): IioPersistenceStrategyRequest;
begin
  Result := TioPersistenceStrategyRequest.Create(FillSessionRelatedProperties);
end;

class function TioPersistenceStrategyFactory.NewPSRequest_ByJsonString(const AJsonString: String): IioPersistenceStrategyRequest;
begin
  Result := TioPersistenceStrategyRequest.CreateByJSONString(AJsonString);
end;

class function TioPersistenceStrategyFactory.NewPSRequest_Delete(const AIntent: TioPersistenceIntentType;
  const ABlindLevel: Byte): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(True);
  Result.Intent := AIntent;
  Result.BlindLevel := ABlindLevel;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_Load(const AIntent: TioPersistenceIntentType): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(True);
  Result.Intent := AIntent;
end;

class function TioPersistenceStrategyFactory.NewPSRequest_Persist(const AIntent: TioPersistenceIntentType; const ABlindLevel: Byte;
  const ARelationPropertyName: String; const ARelationOID: Integer; const AMasterPropertyName, AMasterPropertyPath: String): IioPersistenceStrategyRequest;
begin
  Result := _NewPSRequest(True);
  Result.Intent := AIntent;
  Result.BlindLevel := ABlindLevel;
  Result.RelationPropertyName := ARelationPropertyName;
  Result.RelationOID := ARelationOID;
  Result.MasterPropertyName := AMasterPropertyName;
  Result.MasterPropertyPath := AMasterPropertyPath;
end;

end.
