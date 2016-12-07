unit iORM.LiveBindings.CommonBSAPersistence;

interface

uses
  iORM.LiveBindings.Interfaces;

type

  TioCommonBSAPersistenceThreadExecute = reference to function: TObject;
  TioCommonBSAPersistenceThreadOnTerminate = reference to procedure(AResultValue: TObject);

  TioCommonBSAPersistence = class
  strict private
    class procedure SyncExecute(AExecuteFunc:TioCommonBSAPersistenceThreadExecute;
      AOnTerminateProc:TioCommonBSAPersistenceThreadOnTerminate); static;
    class procedure AsyncExecute(AExecuteFunc:TioCommonBSAPersistenceThreadExecute;
      AOnTerminateProc:TioCommonBSAPersistenceThreadOnTerminate); static;
  public
    class procedure Delete(const AActiveBindSourceAdapter:IioActiveBindSourceAdapter); static;
    class procedure LoadList(const AActiveBindSourceAdapter:IioActiveBindSourceAdapter); static;
    class procedure LoadObject(const AActiveBindSourceAdapter:IioActiveBindSourceAdapter); static;
    class procedure Persist(const AActiveBindSourceAdapter:IioActiveBindSourceAdapter); static;
  end;

implementation

uses
  System.Classes, System.SysUtils, iORM.Exceptions, iORM.Where.Interfaces,
  iORM, iORM.CommonTypes;

type

  TioCommonBSAPersistenceThread = class(TThread)
  strict private
    FExceptionText: String;
    FExecuteFunc: TioCommonBSAPersistenceThreadExecute;
    FOnTerminateProc: TioCommonBSAPersistenceThreadOnTerminate;
    FResultValue: TObject;
  strict protected
    procedure Execute; override;
    procedure OnTerminateEventHandler(Sender: TObject);
  public
    constructor Create(AExecuteFunc:TioCommonBSAPersistenceThreadExecute;
      AOnTerminateProc:TioCommonBSAPersistenceThreadOnTerminate); overload;
    function ResultValue: TObject;
  end;

{ TioCommonBSAPersistence }

class procedure TioCommonBSAPersistence.AsyncExecute(
  AExecuteFunc: TioCommonBSAPersistenceThreadExecute;
  AOnTerminateProc: TioCommonBSAPersistenceThreadOnTerminate);
begin
  // Create and execute the thread
  TioCommonBSAPersistenceThread.Create(AExecuteFunc, AOnTerminateProc).Start;
end;

class procedure TioCommonBSAPersistence.Delete(
  const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
begin

end;

class procedure TioCommonBSAPersistence.LoadList(
  const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
var
  LTypeName, LTypeAlias: String;
  LWhere: IioWhere;
  LTargetClass: TioClassRef;
  LExecute: TioCommonBSAPersistenceThreadExecute;
  LOnTerminate: TioCommonBSAPersistenceThreadOnTerminate;
begin
  // Copy values into local variables
  LTypeName := AActiveBindSourceAdapter.TypeName;
  LTypeAlias := AActiveBindSourceAdapter.TypeAlias;
  LTargetClass := AActiveBindSourceAdapter.GetDataObject.ClassType;
  LWhere := AActiveBindSourceAdapter.ioWhere;
  // Set Execute anonimous methods
  LExecute := function: TObject
  begin
    Result := io.Load(LTypeName, LTypeAlias)._Where(LWhere).ToList(LTargetClass);
  end;
  // Set the OnTerminate anonimous method
  LOnTerminate := procedure(AResultValue: TObject)
  begin
    AActiveBindSourceAdapter.SetDataObject(AResultValue);
  end;
  // Execute synchronous or asynchronous
  if AActiveBindSourceAdapter.ioAsync then
    AsyncExecute(LExecute, LOnTerminate)
  else
    SyncExecute(LExecute, LOnTerminate);
end;

class procedure TioCommonBSAPersistence.LoadObject(
  const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
begin

end;

class procedure TioCommonBSAPersistence.Persist(
  const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
begin

end;

class procedure TioCommonBSAPersistence.SyncExecute(
  AExecuteFunc: TioCommonBSAPersistenceThreadExecute;
  AOnTerminateProc: TioCommonBSAPersistenceThreadOnTerminate);
var
  LResultValue: TObject;
begin
  // Execute core code
  LResultValue := AExecuteFunc;
  // Execute OnTerminate code
  if Assigned(AOnTerminateProc) then
    AOnTerminateProc(LResultValue);
end;

{ TioCommonBSAPersistenceThread }

constructor TioCommonBSAPersistenceThread.Create(AExecuteFunc:TioCommonBSAPersistenceThreadExecute;
  AOnTerminateProc:TioCommonBSAPersistenceThreadOnTerminate);
begin
  inherited Create(True);
  FExecuteFunc := AExecuteFunc;
  FOnTerminateProc := AOnTerminateProc;
  FExceptionText := String.Empty;
  FResultValue := nil;
  Self.OnTerminate := OnTerminateEventHandler;
  Self.FreeOnTerminate := True;
end;

procedure TioCommonBSAPersistenceThread.Execute;
begin
  inherited;
  try
    FResultValue := FExecuteFunc;
  except
    on E:Exception do FExceptionText := E.Message;
  end;
end;

procedure TioCommonBSAPersistenceThread.OnTerminateEventHandler(
  Sender: TObject);
begin
  if FExceptionText.IsEmpty and Assigned(FOnTerminateProc)then
    FOnTerminateProc(FResultValue)
  else
    raise EioException.Create('(' + Self.ClassName + ') - ' + FExceptionText);
end;

function TioCommonBSAPersistenceThread.ResultValue: TObject;
begin
  Result := FResultValue;
end;

end.
