unit iORM.Async.Proc;

interface

uses
  System.SysUtils, System.Classes;

type

  TioAsyncProcExecuteMethod = reference to procedure;
  TioAsyncProcOnSuccessMethod = reference to procedure;
  TioAsyncProcOnExceptionMethod = reference to procedure(AException: Exception);
  TioAsyncProcFinallyMethod = reference to procedure;

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
            TioApplication.ShowMessage('TioAsyncFunc<T>: Exception caught on main thread: ' + E.Message);
          // Non rialziamo l'eccezione per non bloccare il thread pool,
          // l'abbiamo gestita qui.
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
