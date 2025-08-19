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
unit iORM.Auth.Interfaces;

interface

uses
  iORM.CommonTypes;

type

  // AuthCache value part of the cache internal dictionary
  TioAuthDecisionResult = record
    Authorized: Boolean;
    ExceptionMsg: String;
    class operator Initialize(out Dest: TioAuthDecisionResult);
  end;

  // forward declaration
  IioAuthDecisionRequest = interface;

  // access-token related methods
  // note: The anonymous method of type "TioTokenValidateMethod" can return true or false
  //        to authorize or not the operation to be performed. But be careful, if the operation
  //        is not authorized simply returning false will not raise any exception so the operation
  //        will not be performed but the user will probably not notice the lack of authorization;
  //        If you want to inform the user of the failed authorization, you need to raise an exception
  //        within the annoying method itself (TioTokenValidateMethod).
  TioAuthTokenProviderMethod = reference to Function: String;
  TioAuthDecisionMethod = reference to Function(AAuthDecisionRequest: IioAuthDecisionRequest): TioAuthDecisionResult;

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
  IioAuthCache = interface
    ['{20FCA9CF-C450-4E29-8EDA-EC8DF8B0B542}']
    procedure Clear;
    function IsAuthorized(const AAuthDecisionRequest: IioAuthDecisionRequest; const Silent: Boolean): Boolean;
  end;

  // Questa è l'interfaccia che verrà usata nell'anonymous method per validare l'access-token
  //  prima di ogni richiesta di esecuzione di una azione su un oggetto/classe.
  //  NB: Se e quando vorrò usarla anche per le standard-action non avro nessuno IioContext
  //       a disposizione quindi farò una classe apposita che implementa semplicemente questa classe
  //       e che popolerò appositamente per la validazione dell'access-token e stabilire quindi se
  //       quella action deve essere abilitata per quell'utente e per quell'oggetto oppure no.
  //  NB: Ho deciso di avere due AuthCache diverse, una per le operazioni CRUD (IioAuthCacheUI in iORM.PersistenceStrategy.Interfaces)
  //       che viene usata nelle PersistenceStrategies per autorizzare o meno le operazioni,
  //       questa ha lo stesso ciclo di vita della transazione/PSRequest quindi
  //       ogni volta si azzera quindi non c'è nemmeno bisogno di proteggeerla per il multithreading, così c'è anche il vantaggio
  //       che se i permessi dell'utente dovessero cambiare mentre la transazione è in atto i permessi visti saranno consistenti
  //       per tutta la durata dell'operazione.
  //       L'altra IioAuthCacheUI invece viene usata nel frontend e nella UI (BindSources e StandardActions) quindi deve essere globale
  //       e deve essere thread-safe. La classe che la implementa mantiene anche una copia dell'ultimo Token usato in modo che
  //       quando nelle chiamate successive cambia la cache viene svuotata e fare in modo quindi che se, ad esempio,
  //       si fa un logout e ci si riautentica come altro utente i permessi preesistenti vengano eliminati, inoltre anche
  //       se i permessi dello stesso utente dovessero cambiare dopo l'autenticazione una volta scaduto e rinnovato il token
  //       verranno usati i nuovi permessi solo con un leggero ritardo  pari al max. alla dirata del token. Ho deciso di mantenere
  //       la AuthCacheUI nel SessionData in modo che anche con uniGUI funzioni correttamente visto che in questo caso già iORM
  //       mantiene SessionData separati per le diverse sessioni.
  IioAuthDecisionRequest = interface
    ['{02E419C2-347C-412D-B7B3-F264EFB92B94}']
    function IsAuthorized(const Silent: Boolean): Boolean;
    // AuthContext
    procedure SetAuthContext(const Value: String);
    function GetAuthContext: String;
    property AuthContext: String read GetAuthContext write SetAuthContext;
    // AccessToken
    function GetToken: String;
    property Token: String read GetToken;
    // ActionType
    procedure SetActionType(const Value: TioPersistenceActionType);
    function GetActionType: TioPersistenceActionType;
    property ActionType: TioPersistenceActionType read GetActionType write SetActionType;
    // ForceAuthDecision
    function GetForceAuthDecision: Boolean;
    property ForceAuthDecision: Boolean read GetForceAuthDecision;
    // Intent
    function GetIntent: TioPersistenceIntentType;
    property Intent: TioPersistenceIntentType read GetIntent;
    // TypeName
    procedure SetTypeName(const Value: String);
    function GetTypeName: String;
    property TypeName: String read GetTypeName write SetTypeName;
  end;

implementation

{ TioAuthDecisionResult }

class operator TioAuthDecisionResult.Initialize(out Dest: TioAuthDecisionResult);
begin
  Dest.Authorized := False;
end;

end.
