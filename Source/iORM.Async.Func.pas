unit iORM.Async.Func;

interface

uses
  System.Classes, System.SysUtils;

type

  TioAsyncFuncExecute<T> = reference to function: T;
  TioAsyncFuncOnSuccess<T> = reference to procedure(AResultValue: T);
  TioAsyncFuncOnException = reference to procedure(AException: Exception);

  TioFunc<T> = class
  public
    class procedure Invoke(const Async: Boolean; const AOnExecute: TioAsyncFuncExecute<T>; const AOnSuccess: TioAsyncFuncOnSuccess<T>; const AOnException: TioAsyncFuncOnException; const AShowWait: Boolean = False); inline;
  end;

  TioSyncFunc<T> = class
  public
    class procedure Invoke(const AOnExecute: TioAsyncFuncExecute<T>; const AOnSuccess: TioAsyncFuncOnSuccess<T>; const AOnException: TioAsyncFuncOnException; const AShowWait: Boolean = False); inline;
  end;

  TioAsyncFunc<T> = class(TThread)
  strict private
    FException: TObject;
    FOnExceptionMethod: TioAsyncFuncOnException;
    FOnExecuteMethod: TioAsyncFuncExecute<T>;
    FOnSuccessMethod: TioAsyncFuncOnSuccess<T>;
    FResultValue: T;
    FShowWait: Boolean;
  strict protected
    procedure Execute; override;
    procedure OnTerminateEventHandler(Sender: TObject);
    procedure ReraiseOnMainThread;
  public
    constructor Create(const AOnExecute: TioAsyncFuncExecute<T>; const AOnSuccess: TioAsyncFuncOnSuccess<T>; const AOnException: TioAsyncFuncOnException; const AShowWait: Boolean = False);
  end;

implementation

uses
  iORM.Abstraction;

{ TioAsyncExecutor<T> }

constructor TioAsyncFunc<T>.Create(const AOnExecute: TioAsyncFuncExecute<T>; const AOnSuccess: TioAsyncFuncOnSuccess<T>; const AOnException: TioAsyncFuncOnException; const AShowWait: Boolean = False);
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

procedure TioAsyncFunc<T>.Execute;
begin
  inherited;
  try
    FResultValue := FOnExecuteMethod;
  except
    on E: Exception do
      begin
        FException := AcquireExceptionObject;
        Synchronize(ReraiseOnMainThread);
      end;
  end;
end;

procedure TioAsyncFunc<T>.OnTerminateEventHandler(Sender: TObject);
begin
  try
    // If everything went well, it executes the terminate anonymous method
    if Assigned(FOnSuccessMethod) and not Assigned(FException) then
      FOnSuccessMethod(FResultValue);
  finally
    if FShowWait then
      TioApplication.HideWait;
  end;
end;

procedure TioAsyncFunc<T>.ReraiseOnMainThread;
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
        TioApplication.ShowMessage('TioAsyncFunc<T>: Exception caught on main thread: ' + EMain.Message);
    end;
  end;
end;

{ TioSyncFunc<T> }

class procedure TioSyncFunc<T>.Invoke(const AOnExecute: TioAsyncFuncExecute<T>; const AOnSuccess: TioAsyncFuncOnSuccess<T>;
  const AOnException: TioAsyncFuncOnException; const AShowWait: Boolean);
var
  LResultValue: T;
begin
  if AShowWait then
    TioApplication.ShowWait;
  try try
    LResultValue := AOnExecute;
    if Assigned(AOnSuccess) then
      AOnSuccess(LResultValue);
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

{ TioFunc<T> }

class procedure TioFunc<T>.Invoke(const Async: Boolean; const AOnExecute: TioAsyncFuncExecute<T>; const AOnSuccess: TioAsyncFuncOnSuccess<T>;
  const AOnException: TioAsyncFuncOnException; const AShowWait: Boolean);
begin
  if Async then
    TioAsyncFunc<T>.Create(AOnExecute, AOnSuccess, AOnException, AShowWait).Start
  else
    TioSyncFunc<T>.Invoke(AOnExecute, AOnSuccess, AOnException, AShowWait);
end;

end.
