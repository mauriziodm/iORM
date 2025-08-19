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
unit iORM.Auth.Cache;

interface

uses
  iORM.Auth.Interfaces, System.Generics.Collections;

type

  // Ho deciso di avere due AuthCache diverse, una per le operazioni CRUD (IioAuthCacheUI in iORM.PersistenceStrategy.Interfaces)
  //  che viene usata nelle PersistenceStrategies per autorizzare o meno le operazioni,
  //  questa ha lo stesso ciclo di vita della transazione/PSRequest quindi
  //  ogni volta si azzera quindi non c'è nemmeno bisogno di proteggeerla per il multithreading, così c'è anche il vantaggio
  //  che se i permessi dell'utente dovessero cambiare mentre la transazione è in atto i permessi visti saranno consistenti
  //  per tutta la durata dell'operazione.
  //  L'altra IioAuthCacheUI invece viene usata nel frontend e nella UI (BindSources e StandardActions) quindi deve essere globale
  //  e deve essere thread-safe. La classe che la implementa mantiene anche una copia dell'ultimo Token usato in modo che
  //  quando nelle chiamate successive cambia la cache viene svuotata e fare in modo quindi che se, ad esempio,
  //  si fa un logout e ci si riautentica come altro utente i permessi preesistenti vengano eliminati, inoltre anche
  //  se i permessi dello stesso utente dovessero cambiare dopo l'autenticazione una volta scaduto e rinnovato il token
  //  verranno usati i nuovi permessi solo con un leggero ritardo  pari al max. alla dirata del token. Ho deciso di mantenere
  //  la AuthCacheUI nel SessionData in modo che anche con uniGUI funzioni correttamente visto che in questo caso già iORM
  //  mantiene SessionData separati per le diverse sessioni.
  //  NB:  L'Accesso all'AuthCacheUI è thread-safe perchè è una proprietà della classe TioSessionData alla quale si accedete
  //        attraverso la TioSessionDataStore che li portegge perchè un SessionData va acquisito con gli appositi metodi
  //        Acquire... e Release...
  TioAuthCacheCustom = class (TInterfacedObject, IioAuthCache)
  strict private
    FInternalContainer: TDictionary<String, TioAuthDecisionResult>;
    function ComposeKey(const AAuthDecisionRequest: IioAuthDecisionRequest): String; inline;
  protected
  public
    constructor Create;
    procedure Clear;
    destructor Destroy; override;
    function IsAuthorized(const AAuthDecisionRequest: IioAuthDecisionRequest; const Silent: Boolean): Boolean; virtual;
  end;

  TioAuthCacheCRUD = class (TioAuthCacheCustom)
  end;

  TioAuthCacheUI = class (TioAuthCacheCustom)
  strict private
    FPreviousToken: String;
  public
    function IsAuthorized(const AAuthDecisionRequest: IioAuthDecisionRequest; const Silent: Boolean): Boolean; override;
  end;

implementation

uses
  System.SysUtils, iORM.Abstraction, iORM.CommonTypes, iORM.Exceptions;

{ TioAuthCacheCustom }

procedure TioAuthCacheCustom.Clear;
begin
  FInternalContainer.Clear;
end;

function TioAuthCacheCustom.ComposeKey(const AAuthDecisionRequest: IioAuthDecisionRequest): String;
begin
  Result := AAuthDecisionRequest.TypeName + ':' + IntToStr(Ord(AAuthDecisionRequest.ActionType)) + ':' + AAuthDecisionRequest.AuthorizationContext;
end;

constructor TioAuthCacheCustom.Create;
begin
  FInternalContainer := TDictionary<String, TioAuthDecisionResult>.Create;
end;

destructor TioAuthCacheCustom.Destroy;
begin
  FInternalContainer.Free;
  inherited;
end;

function TioAuthCacheCustom.IsAuthorized(const AAuthDecisionRequest: IioAuthDecisionRequest; const Silent: Boolean): Boolean;
var
  LAuthDecisionResult: TioAuthDecisionResult;
  LKey: String;
begin
  // Synchro operactions are never subject to authorization
  if (AAuthDecisionRequest.Intent > itETM_Revert) or AAuthDecisionRequest.ForceAuthDecision then
    Exit(True);
  // Compose the key
  LKey := ComposeKey(AAuthDecisionRequest);
  // Authorization decision (cached)
  if not FInternalContainer.TryGetValue(LKey, LAuthDecisionResult) then
  begin
    LAuthDecisionResult := TioApplication._FAuthDecisionMethod_InternalUse(AAuthDecisionRequest);
    FInternalContainer.Add(LKey, LAuthDecisionResult);
  end;
  Result := LAuthDecisionResult.Authorized;
  //  NB: Se non autorizzati ma non c'è una eccezione da sollevare (ExceptionMsg è vuoto) oppure sono Silent allora
  //       esegue un abort per interrompere il flusso; ma se però siamo Silent oppure ActionType=atSelect
  //       l'interruzione del flusso creava problemi con le StdActions oppure, nel caso di una operazione
  //       LoadList/LoadObject, non volevo interrompere il flusso per fare in modo che se ho una entità
  //       con dei dettagli e non sono autorizzato  a vedere i dettagli (ma il master si) allora proseguiva
  //       e ottenevo la mia entità master ma senza i dettagli per i quali non sono autorizzato, per questo
  //       non  devo interrompere il flusso in questo caso
  //  NB: Ovviamente invece se non sono autorizzato e ExceptionMsg non è vuoto allora sollevo l'eccezione (a meno che non sono Silent)
  if not Result then
  begin
    if Silent or LAuthDecisionResult.ExceptionMsg.IsEmpty then
    begin
      if (AAuthDecisionRequest.ActionType > atSelect) and not Silent then
        Abort;
    end
    else
      raise EioAuthDecisionException.Create(LAuthDecisionResult.ExceptionMsg);
  end;
end;

{ TioAuthCacheUI }

function TioAuthCacheUI.IsAuthorized(const AAuthDecisionRequest: IioAuthDecisionRequest; const Silent: Boolean): Boolean;
begin
  // Clear cache if necessary
  if AAuthDecisionRequest.Token <> FPreviousToken then
    Clear;
  // inherit
  Result := inherited;
end;

end.
