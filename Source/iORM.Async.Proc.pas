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
    FException: Exception;
    FOnExceptionMethod: TioAsyncProcOnException;
    FOnExecuteMethod: TioAsyncProcExecute;
    FOnSuccessMethod: TioAsyncProcOnSuccess;
    FShowWait: Boolean;
  strict protected
    procedure Execute; override;
    procedure OnTerminateEventHandler(Sender: TObject);
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
      FException := AcquireExceptionObject as Exception;
  end;
end;

procedure TioAsyncProc.OnTerminateEventHandler(Sender: TObject);
begin
  try
    // If an exception was raised during the execution of the thread then re-raise the acquire exception into the main thread
    //  (otherwise I had problems) and then raise a new exception with the same message so that it comes out to the user too.
    // note: The new exception is raised decoupled with a Timer because I had problems otherwise.
    if Assigned(FException) then
    begin
      if FShowWait then
        TioApplication.HideWait;
      if Assigned(FOnExceptionMethod) then
        FOnExceptionMethod(FException)
      else
        raise FException;
    end
    else
      // If everything went well, it executes the terminate anonymous method
      if Assigned(FOnSuccessMethod) then
        FOnSuccessMethod;
  finally
    if FShowWait then
      TioApplication.HideWait;
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
