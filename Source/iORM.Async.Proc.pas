unit iORM.Async.Proc;

interface

uses
  System.SysUtils, System.Classes;

type

  TioAsyncProcExecute = reference to procedure;
  TioAsyncProcOnSuccess = reference to procedure;
  TioAsyncProcOnException = reference to procedure(AException: Exception);

  TioProc = class
  public
    class procedure Invoke(const Async: Boolean; const AOnExecute: TioAsyncProcExecute; const AOnSuccess: TioAsyncProcOnSuccess; const AOnException: TioAsyncProcOnException; const AShowWait: Boolean = False); inline;
  end;

  TioSyncProc = class
  public
    class procedure Invoke(const AOnExecute: TioAsyncProcExecute; const AOnSuccess: TioAsyncProcOnSuccess; const AOnException: TioAsyncProcOnException; const AShowWait: Boolean = False);
  end;

  TioAsyncProc = class(TThread)
  strict private
    FException: TObject;
    FOnExceptionMethod: TioAsyncProcOnException;
    FOnExecuteMethod: TioAsyncProcExecute;
    FOnSuccessMethod: TioAsyncProcOnSuccess;
    FShowWait: Boolean;
  strict protected
    procedure Execute; override;
    procedure OnTerminateEventHandler(Sender: TObject);
    procedure ReraiseOnMainThread;
  public
    constructor Create(const AOnExecute: TioAsyncProcExecute; const AOnSuccess: TioAsyncProcOnSuccess; const AOnException: TioAsyncProcOnException; const AShowWait: Boolean = False);
  end;

implementation

uses
  iORM.Abstraction;

{ TioAsyncProc }

constructor TioAsyncProc.Create(const AOnExecute: TioAsyncProcExecute; const AOnSuccess: TioAsyncProcOnSuccess; const AOnException: TioAsyncProcOnException;
  const AShowWait: Boolean);
begin
  inherited Create(True);
  FException := nil;
  FOnExecuteMethod := AOnExecute;
  FOnSuccessMethod := AOnSuccess;
  FOnExceptionMethod := AOnException;
  FShowWait := AShowWait;
  OnTerminate := OnTerminateEventHandler;
  FreeOnTerminate := True;
  if AShowWait then
    TioApplication.ShowWait;
end;

procedure TioAsyncProc.Execute;
begin
  inherited;
  try
    FOnExecuteMethod;
  except
    on E: Exception do
      begin
        FException := AcquireExceptionObject;
        Synchronize(ReraiseOnMainThread);
      end;
  end;
end;

procedure TioAsyncProc.OnTerminateEventHandler(Sender: TObject);
begin
  try
    // If everything went well, it executes the terminate anonymous method
    if Assigned(FOnSuccessMethod) and not Assigned(FException) then
      FOnSuccessMethod;
  finally
    if FShowWait then
      TioApplication.HideWait;
  end;
end;

procedure TioAsyncProc.ReraiseOnMainThread;
begin
  // Questa procedura viene eseguita sul thread principale
  if FShowWait then
    TioApplication.HideWait;
  try
    if Assigned(FException) then
      raise Exception(FException) at ExceptAddr; // Rilancia l'eccezione acquisita
  except
    on EMain: Exception do
    begin
      if Assigned(FOnExceptionMethod) then
        FOnExceptionMethod(EMain)
      else
        TioApplication.ShowMessage('TioAsyncProc<T>: Exception caught on main thread: ' + EMain.Message);
    end;
  end;
end;

{ TioSyncProc }

class procedure TioSyncProc.Invoke(const AOnExecute: TioAsyncProcExecute; const AOnSuccess: TioAsyncProcOnSuccess; const AOnException: TioAsyncProcOnException; const AShowWait: Boolean = False);
begin
  if AShowWait then
    TioApplication.ShowWait;
  try try
    AOnExecute;
    if Assigned(AOnSuccess) then
      AOnSuccess;
  finally
    if AShowWait then
      TioApplication.HideWait;
  end;
  except
    on E: Exception do
    begin
      if Assigned(AOnException) then
        AOnException(E)
      else
        raise;
    end;
  end;
end;

{ TioProc }

class procedure TioProc.Invoke(const Async: Boolean; const AOnExecute: TioAsyncProcExecute; const AOnSuccess: TioAsyncProcOnSuccess;
  const AOnException: TioAsyncProcOnException; const AShowWait: Boolean);
begin
  if Async then
    TioAsyncProc.Create(AOnExecute, AOnSuccess, AOnException, AShowWait).Start
  else
    TioSyncProc.Invoke(AOnExecute, AOnSuccess, AOnException, AShowWait);
end;

end.
