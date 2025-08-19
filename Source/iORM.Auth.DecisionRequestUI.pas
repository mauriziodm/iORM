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
unit iORM.Auth.DecisionRequestUI;

interface

uses
  iORM.Auth.Interfaces, iORM.CommonTypes;

type

  // Questa è la classe che implementa IioAuthDecisionRequest che viene usata per le richieste
  //  di autorizzazione da parte della UI (BindSources e standard-actions). L'altra classe
  //  che implementa IioAuthDecisionRequest è la TioContext_PSRequest che in pratica è il Context stesso.
  TioAuthDecisionRequestUI = class(TInterfacedObject, IioAuthDecisionRequest)
  private
    FActionType:TioPersistenceActionType;
    FAuthContext: String;
    FIntent: TioPersistenceIntentType;
    FForceAuthDecision: Boolean;
    FTypeName: String;
    FToken: String;
    function GetActionType: TioPersistenceActionType;
    function GetAuthorizationContext: String;
    function GetForceAuthDecision: Boolean;
    function GetIntent: TioPersistenceIntentType;
    function GetToken: String;
    function GetTypeName: String;
    procedure SetActionType(const Value: TioPersistenceActionType);
    procedure SetAuthorizationContext(const Value: String);
    procedure SetTypeName(const Value: String);
  public
    constructor Create(const ATypeName: String; const AActionType: TioPersistenceActionType; const AIntent: TioPersistenceIntentType; const AAuthContext: String; const AForceAuthDecision: Boolean);
    function IsAuthorized(const Silent: Boolean): Boolean;
    // properties
    property ActionType: TioPersistenceActionType read GetActionType write SetActionType;
    property AuthorizationContext: String read GetAuthorizationContext write SetAuthorizationContext;
    property ForceAuthDecision: Boolean read GetForceAuthDecision;
    property Intent: TioPersistenceIntentType read GetIntent;
    property Token: String read GetToken;
    property TypeName: String read GetTypeName write SetTypeName;
  end;

implementation

uses
  iORM.Abstraction, iORM.Abstraction.SessionData.Interfaces;

{ TioAuthDecisionRequestUI }

constructor TioAuthDecisionRequestUI.Create(const ATypeName: String; const AActionType: TioPersistenceActionType; const AIntent: TioPersistenceIntentType; const AAuthContext: String; const AForceAuthDecision: Boolean);
begin
  FActionType := AActionType;
  FAuthContext := AAuthContext;
  FIntent := AIntent;
  FForceAuthDecision := AForceAuthDecision;
  FTypeName := ATypeName;
  FToken := TioApplication.ProvideAuthToken;
end;

function TioAuthDecisionRequestUI.GetActionType: TioPersistenceActionType;
begin
  Result := FActionType;
end;

function TioAuthDecisionRequestUI.GetAuthorizationContext: String;
begin
  Result := FAuthContext;
end;

function TioAuthDecisionRequestUI.GetIntent: TioPersistenceIntentType;
begin
  Result := FIntent;
end;

function TioAuthDecisionRequestUI.GetForceAuthDecision: Boolean;
begin
  Result := FForceAuthDecision;
end;

function TioAuthDecisionRequestUI.GetToken: String;
begin
  Result := FToken;
end;

function TioAuthDecisionRequestUI.GetTypeName: String;
begin
  Result := FTypeName;
end;

function TioAuthDecisionRequestUI.IsAuthorized(const Silent: Boolean): Boolean;
var
  LSessionData: IioSessionData;
begin
  // Acquire the MainSessionData (thread-safe)
  LSessionData := TioApplication.SessionDataStore.AcquireMainSessionData;
  try
    // Check authorization from SessionData.AuthCache
    Result := LSessionData.AuthCacheUI.IsAuthorized(Self, Silent);
  finally
    // Release the MainSessionData (thread-safe)
    TioApplication.SessionDataStore.Release;
  end;
end;

procedure TioAuthDecisionRequestUI.SetActionType(const Value: TioPersistenceActionType);
begin
  FActionType := Value;
end;

procedure TioAuthDecisionRequestUI.SetAuthorizationContext(const Value: String);
begin
  FAuthContext := Value;
end;

procedure TioAuthDecisionRequestUI.SetTypeName(const Value: String);
begin
  FTypeName := Value;
end;

end.
