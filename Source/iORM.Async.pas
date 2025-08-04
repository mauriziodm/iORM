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
unit iORM.Async;

interface

uses
  System.Classes, System.SysUtils;

type

  // Async func methods
  TioAsyncFuncExecuteMethod<T> = reference to function: T;
  TioAsyncFuncOnSuccessMethod<T> = reference to procedure(AResultValue: T);
  TioAsyncFuncOnExceptionMethod = reference to procedure(AException: Exception);
  TioAsyncFuncFinallyMethod = reference to procedure;
  // Async proc methods
  TioAsyncProcExecuteMethod = reference to procedure;
  TioAsyncProcOnSuccessMethod = reference to procedure;
  TioAsyncProcOnExceptionMethod = reference to procedure(AException: Exception);
  TioAsyncProcFinallyMethod = reference to procedure;

  // iORM Sync/Async Function
  TioFunc<T> = class
  public
    class procedure Invoke(
      const Async: Boolean;
      const AExecuteMethod: TioAsyncFuncExecuteMethod<T>;
      const AOnSuccessMethod: TioAsyncFuncOnSuccessMethod<T>;
      const AOnExceptionMethod: TioAsyncFuncOnExceptionMethod;
      const AFinallyMethod: TioAsyncFuncFinallyMethod;
      const AShowWait: Boolean = False); inline;
  end;

  TioSyncFunc<T> = class
  public
    class procedure Invoke(
      const AExecuteMethod: TioAsyncFuncExecuteMethod<T>;
      const AOnSuccessMethod: TioAsyncFuncOnSuccessMethod<T>;
      const AOnExceptionMethod: TioAsyncFuncOnExceptionMethod;
      const AFinallyMethod: TioAsyncFuncFinallyMethod;
      const AShowWait: Boolean = False);
  end;

  TioAsyncFunc<T> = class
  public
    class procedure Invoke(
      const AExecuteMethod: TioAsyncFuncExecuteMethod<T>;
      const AOnSuccessMethod: TioAsyncFuncOnSuccessMethod<T>;
      const AOnExceptionMethod: TioAsyncFuncOnExceptionMethod;
      const AFinallyMethod: TioAsyncFuncFinallyMethod;
      const AShowWait: Boolean = False);
  end;

  // iORM Sync/Async Function
  TioProc = class
  public
    class procedure Invoke(
      const Async: Boolean;
      const AExecuteMethod: TioAsyncProcExecuteMethod;
      const AOnSuccessMethod: TioAsyncProcOnSuccessMethod;
      const AOnExceptionMethod: TioAsyncProcOnExceptionMethod;
      const AFinallyMethod: TioAsyncProcFinallyMethod;
      const AShowWait: Boolean = False); inline;
  end;

  TioSyncProc = class
  public
    class procedure Invoke(
      const AExecuteMethod: TioAsyncProcExecuteMethod;
      const AOnSuccessMethod: TioAsyncProcOnSuccessMethod;
      const AOnExceptionMethod: TioAsyncProcOnExceptionMethod;
      const AFinallyMethod: TioAsyncProcFinallyMethod;
      const AShowWait: Boolean = False);
  end;

  TioAsyncProc = class
  public
    class procedure Invoke(
      const AExecuteMethod: TioAsyncProcExecuteMethod;
      const AOnSuccessMethod: TioAsyncProcOnSuccessMethod;
      const AOnExceptionMethod: TioAsyncProcOnExceptionMethod;
      const AFinallyMethod: TioAsyncProcFinallyMethod;
      const AShowWait: Boolean = False);
  end;

implementation

uses
  iORM.Abstraction, System.Threading;

{ TioSyncFunc<T> }

class procedure TioSyncFunc<T>.Invoke(
      const AExecuteMethod: TioAsyncFuncExecuteMethod<T>;
      const AOnSuccessMethod: TioAsyncFuncOnSuccessMethod<T>;
      const AOnExceptionMethod: TioAsyncFuncOnExceptionMethod;
      const AFinallyMethod: TioAsyncFuncFinallyMethod;
      const AShowWait: Boolean = False);
var
  LResultValue: T;
  LTaskSuccessful: Boolean;
begin
  // Flag per tracciare il successo del task
  LTaskSuccessful := False;
  // Se richiesto visualizza l'attesa
  if AShowWait then
    TioApplication.ShowWait;
  try try
    // esegue il task principale
    LResultValue := AExecuteMethod;
    // Se arriviamo qui, il task è riuscito
    LTaskSuccessful := True;
  except
    on E: Exception do
    begin
      // Se richiesto nasconde l'attesa (thread principale)
      if AShowWait then
        TioApplication.HideWait;
      // Esegue AOnError oppure risolleva l'eccezione
      if Assigned(AOnExceptionMethod) then
        AOnExceptionMethod(E)
      else
        raise;
    end;
  end;
  finally
    try
      // Chiama AOnSuccess solo se il task è terminato con successo
      if LTaskSuccessful and Assigned(AOnSuccessMethod) then
        AOnSuccessMethod(LResultValue);
    finally
      // Se richiesto nasconde l'attesa (thread principale)
      if AShowWait then
        TioApplication.HideWait;
      // Chiama AOnFinally sempre, indipendentemente dall'esito
      if Assigned(AFinallyMethod) then
        AFinallyMethod;
    end;
  end;
end;

{ TioFunc<T> }

class procedure TioFunc<T>.Invoke(
      const Async: Boolean;
      const AExecuteMethod: TioAsyncFuncExecuteMethod<T>;
      const AOnSuccessMethod: TioAsyncFuncOnSuccessMethod<T>;
      const AOnExceptionMethod: TioAsyncFuncOnExceptionMethod;
      const AFinallyMethod: TioAsyncFuncFinallyMethod;
      const AShowWait: Boolean = False);
begin
  if Async then
    TioAsyncFunc<T>.Invoke(AExecuteMethod, AOnSuccessMethod, AOnExceptionMethod, AFinallyMethod, AShowWait)
  else
    TioSyncFunc<T>.Invoke(AExecuteMethod, AOnSuccessMethod, AOnExceptionMethod, AFinallyMethod, AShowWait);
end;

{ TioNewAsyncFunc<T> }

class procedure TioAsyncFunc<T>.Invoke(
      const AExecuteMethod: TioAsyncFuncExecuteMethod<T>;
      const AOnSuccessMethod: TioAsyncFuncOnSuccessMethod<T>;
      const AOnExceptionMethod: TioAsyncFuncOnExceptionMethod;
      const AFinallyMethod: TioAsyncFuncFinallyMethod;
      const AShowWait: Boolean = False
    );
begin
  // Se richiesto visualizza l'attesa (thread principale)
  if AShowWait then
    TioApplication.ShowWait;
  // Avvia il task
  TTask.Run(
    // Il metodo anonimo principale: il task da eseguire nel thread secondario
    procedure
    var
      LResultValue: T;
      LTaskSuccessful: Boolean;
    begin
      // Flag per tracciare il successo del task
      LTaskSuccessful := False;
      try try
        // esegue il task principale
        LResultValue := AExecuteMethod;
        // Se arriviamo qui, il task è riuscito
        LTaskSuccessful := True;
      except
        on E: Exception do
        begin
          // Gestione dell'eccezione: chiama AOnError nel main thread
          if Assigned(AOnExceptionMethod) then
          begin
            TThread.Synchronize(nil,
              procedure
              begin
                // Se richiesto nasconde l'attesa (thread principale)
                if AShowWait then
                  TioApplication.HideWait;
                // Esegue AOnError nel main thread
                AOnExceptionMethod(E);
              end);
          end
          else
          // Non rialziamo l'eccezione per non bloccare il thread pool,
          // l'abbiamo gestita qui.
          if not (E is EAbort) then
            TioApplication.ShowMessage('TioAsyncFunc<T>: Exception caught on main thread: ' + E.ClassName);
        end;
      end;
      finally
        // Questo blocco viene eseguito SEMPRE, sia in caso di successo che di errore,
        // all'interno del thread del task.

        // Per i callback finali (successo e finally), li accodiamo nel main thread.
        TThread.Synchronize(nil,
          procedure
          begin
            try
              // Chiama AOnSuccess solo se il task è terminato con successo
              if LTaskSuccessful and Assigned(AOnSuccessMethod) then
                AOnSuccessMethod(LResultValue);
            finally
              // Se richiesto nasconde l'attesa (thread principale)
              if AShowWait then
                TioApplication.HideWait;
              // Chiama AOnFinally sempre, indipendentemente dall'esito (thread principale)
              if Assigned(AFinallyMethod) then
                AFinallyMethod;
            end;
          end
        );
      end;
    end
  );
end;

{ TioProc }

class procedure TioProc.Invoke(
      const Async: Boolean;
      const AExecuteMethod: TioAsyncProcExecuteMethod;
      const AOnSuccessMethod: TioAsyncProcOnSuccessMethod;
      const AOnExceptionMethod: TioAsyncProcOnExceptionMethod;
      const AFinallyMethod: TioAsyncProcFinallyMethod;
      const AShowWait: Boolean = False);
begin
  if Async then
    TioAsyncProc.Invoke(AExecuteMethod, AOnSuccessMethod, AOnExceptionMethod, AFinallyMethod, AShowWait)
  else
    TioSyncProc.Invoke(AExecuteMethod, AOnSuccessMethod, AOnExceptionMethod, AFinallyMethod, AShowWait);
end;

{ TioSyncProc }

class procedure TioSyncProc.Invoke(
      const AExecuteMethod: TioAsyncProcExecuteMethod;
      const AOnSuccessMethod: TioAsyncProcOnSuccessMethod;
      const AOnExceptionMethod: TioAsyncProcOnExceptionMethod;
      const AFinallyMethod: TioAsyncProcFinallyMethod;
      const AShowWait: Boolean = False);
var
  LTaskSuccessful: Boolean;
begin
  // Flag per tracciare il successo del task
  LTaskSuccessful := False;
  // Se richiesto visualizza l'attesa
  if AShowWait then
    TioApplication.ShowWait;
  try try
    // esegue il task principale
    AExecuteMethod;
    // Se arriviamo qui, il task è riuscito
    LTaskSuccessful := True;
  except
    on E: Exception do
    begin
      // Se richiesto nasconde l'attesa (thread principale)
      if AShowWait then
        TioApplication.HideWait;
      // Esegue AOnError oppure risolleva l'eccezione
      if Assigned(AOnExceptionMethod) then
        AOnExceptionMethod(E)
      else
        raise;
    end;
  end;
  finally
    try
      // Chiama AOnSuccess solo se il task è terminato con successo
      if LTaskSuccessful and Assigned(AOnSuccessMethod) then
        AOnSuccessMethod;
    finally
      // Se richiesto nasconde l'attesa (thread principale)
      if AShowWait then
        TioApplication.HideWait;
      // Chiama AOnFinally sempre, indipendentemente dall'esito
      if Assigned(AFinallyMethod) then
        AFinallyMethod;
    end;
  end;
end;

{ TioAsyncProc }

class procedure TioAsyncProc.Invoke(
      const AExecuteMethod: TioAsyncProcExecuteMethod;
      const AOnSuccessMethod: TioAsyncProcOnSuccessMethod;
      const AOnExceptionMethod: TioAsyncProcOnExceptionMethod;
      const AFinallyMethod: TioAsyncProcFinallyMethod;
      const AShowWait: Boolean);
begin
  // Se richiesto visualizza l'attesa (thread principale)
  if AShowWait then
    TioApplication.ShowWait;
  // Avvia il task
  TTask.Run(
    // Il metodo anonimo principale: il task da eseguire nel thread secondario
    procedure
    var
      LTaskSuccessful: Boolean;
    begin
      // Flag per tracciare il successo del task
      LTaskSuccessful := False;
      try try
        // esegue il task principale
        AExecuteMethod;
        // Se arriviamo qui, il task è riuscito
        LTaskSuccessful := True;
      except
        on E: Exception do
        begin
          // Gestione dell'eccezione: chiama AOnError nel main thread
          if Assigned(AOnExceptionMethod) then
          begin
            TThread.Synchronize(nil,
              procedure
              begin
                // Se richiesto nasconde l'attesa (thread principale)
                if AShowWait then
                  TioApplication.HideWait;
                // Esegue AOnError nel main thread
                AOnExceptionMethod(E);
              end);
          end
          else
          // Non rialziamo l'eccezione per non bloccare il thread pool,
          // l'abbiamo gestita qui.
          if not (E is EAbort) then
          begin
            TThread.Synchronize(nil,
              procedure
              begin
                TioApplication.ShowMessage('TioAsyncFunc<T>: Exception caught on main thread: ' + E.Message);
              end);
          end;
        end;
      end;
      finally
        // Questo blocco viene eseguito SEMPRE, sia in caso di successo che di errore,
        // all'interno del thread del task.

        // Per i callback finali (successo e finally), li accodiamo nel main thread.
        TThread.Synchronize(nil,
          procedure
          begin
            try
              // Chiama AOnSuccess solo se il task è terminato con successo
              if LTaskSuccessful and Assigned(AOnSuccessMethod) then
                AOnSuccessMethod;
            finally
              // Se richiesto nasconde l'attesa (thread principale)
              if AShowWait then
                TioApplication.HideWait;
              // Chiama AOnFinally sempre, indipendentemente dall'esito (thread principale)
              if Assigned(AFinallyMethod) then
                AFinallyMethod;
            end;
          end
        );
      end;
    end
  );
end;

end.
