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
    class procedure Load(const AActiveBindSourceAdapter:IioActiveBindSourceAdapter); static;
    class procedure Persist(const AActiveBindSourceAdapter:IioActiveBindSourceAdapter); static;
  end;

implementation

uses
  System.Classes, System.SysUtils, iORM.Exceptions, iORM.Where.Interfaces,
  iORM, iORM.CommonTypes, iORM.LiveBindings.Factory,
  iORM.Context.Properties.Interfaces, iORM.Context.Factory;

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
  io.ShowWait;
  // Create and execute the thread
  TioCommonBSAPersistenceThread.Create(AExecuteFunc, AOnTerminateProc).Start;
end;

class procedure TioCommonBSAPersistence.Delete(
  const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
var
  LExecute: TioCommonBSAPersistenceThreadExecute;
  LOnTerminate: TioCommonBSAPersistenceThreadOnTerminate;
begin
  // Set Execute anonimous methods
  LExecute := function: TObject
  begin
    io.Delete(AActiveBindSourceAdapter.Current);
  end;
  // Set the OnTerminate anonimous method
  LOnTerminate := procedure(AResultValue: TObject)
  begin
    // Send a notification to other ActiveBindSourceAdapters & BindSource
    //  NB: Moved into "CommonBSAPersistence" (Delete, LOnTerminate)
    //       if FAutoPersist is True then the notify is performed by
    //       the "CommonBSAPersistence" else by this method
    AActiveBindSourceAdapter.Notify(
      AActiveBindSourceAdapter as TObject,
      TioLiveBindingsFactory.Notification(AActiveBindSourceAdapter as TObject, AActiveBindSourceAdapter.Current, ntAfterDelete)
      );
  end;
  // Execute synchronous or asynchronous
  if AActiveBindSourceAdapter.ioAsync then
    AsyncExecute(LExecute, LOnTerminate)
  else
    SyncExecute(LExecute, LOnTerminate);
end;

class procedure TioCommonBSAPersistence.Load(
  const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
var
  LTypeName, LTypeAlias: String;
  LWhere: IioWhere;
  LTargetClass: TioClassRef;
  LOwnsObjects: Boolean;
  LExecute: TioCommonBSAPersistenceThreadExecute;
  LOnTerminate: TioCommonBSAPersistenceThreadOnTerminate;
begin
  // Copy values into local variables
  LTypeName := AActiveBindSourceAdapter.TypeName;
  LTypeAlias := AActiveBindSourceAdapter.TypeAlias;
  LTargetClass := AActiveBindSourceAdapter.DataObject.ClassType;
  LWhere := AActiveBindSourceAdapter.ioWhere;
  LOwnsObjects := AActiveBindSourceAdapter.ioOwnsObjects;
  // Set Execute anonimous methods
  case AActiveBindSourceAdapter.ioViewDataType of
    TioViewDataType.dtSingle:
      LExecute := function: TObject
      begin
        Result := io.Load(LTypeName, LTypeAlias)._Where(LWhere).ToObject;
      end;
    TioViewDataType.dtList:
      LExecute := function: TObject
      begin
        Result := io.Load(LTypeName, LTypeAlias)._Where(LWhere).ToList(LTargetClass);
      end;
  else
    raise EioException.Create('TioCommonBSAPersistence.Load: wrong ViewDataType.');
  end;
  // Set the OnTerminate anonimous method
  LOnTerminate := procedure(AResultValue: TObject)
  begin
    AActiveBindSourceAdapter.SetDataObject(AResultValue, LOwnsObjects);
  end;
  // Execute synchronous or asynchronous
  if AActiveBindSourceAdapter.ioAsync then
    AsyncExecute(LExecute, LOnTerminate)
  else
    SyncExecute(LExecute, LOnTerminate);
end;

class procedure TioCommonBSAPersistence.Persist(
  const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
var
  LMasterProperty: IioContextProperty;
  LRelationChildPropertyName: String;
  LMasterOID: Integer;
  LExecute: TioCommonBSAPersistenceThreadExecute;
  LOnTerminate: TioCommonBSAPersistenceThreadOnTerminate;
begin
  // Init
  LMasterProperty := nil;
  LRelationChildPropertyName := '';
  LMasterOID := 0;
  // If it is a detail adapter...
  if AActiveBindSourceAdapter.IsDetail then
  begin
    // Get the MasterProperty of the current object
    LMasterProperty := TioContextFactory.GetPropertyByClassRefAndName(
      AActiveBindSourceAdapter.GetMasterBindSourceAdapter.Current.ClassType,
      AActiveBindSourceAdapter.GetMasterPropertyName
      );
    // Get a local reference of some values
    LRelationChildPropertyName := LMasterProperty.GetRelationChildPropertyName;
    LMasterOID := AActiveBindSourceAdapter.GetMasterBindSourceAdapter.GetCurrentOID;
  end;
  // Set Execute anonimous methods
  LExecute := function: TObject
  begin
    io.Persist(AActiveBindSourceAdapter.Current,
      LRelationChildPropertyName,
      LMasterOID,
      False, // BlindInsert
      ''     // Connection name
      );
  end;
  // Set the OnTerminate anonimous method
  LOnTerminate := procedure(AResultValue: TObject)
  begin
    // Send a notification to other ActiveBindSourceAdapters & BindSource
    //  NB: Moved into "CommonBSAPersistence" (Delete, LOnTerminate)
    //       if FAutoPersist is True then the notify is performed by
    //       the "CommonBSAPersistence" else by this method
    AActiveBindSourceAdapter.Notify(
      AActiveBindSourceAdapter as TObject,
      TioLiveBindingsFactory.Notification(AActiveBindSourceAdapter as TObject, AActiveBindSourceAdapter.Current, ntAfterPost)
      );
  end;
  // Execute synchronous or asynchronous
  if AActiveBindSourceAdapter.ioAsync then
    AsyncExecute(LExecute, LOnTerminate)
  else
    SyncExecute(LExecute, LOnTerminate);
end;

class procedure TioCommonBSAPersistence.SyncExecute(
  AExecuteFunc: TioCommonBSAPersistenceThreadExecute;
  AOnTerminateProc: TioCommonBSAPersistenceThreadOnTerminate);
var
  LResultValue: TObject;
begin
  io.ShowWait;
  try
    // Execute core code
    LResultValue := AExecuteFunc;
    // Execute OnTerminate code
    if Assigned(AOnTerminateProc) then
      AOnTerminateProc(LResultValue);
  finally
    io.HideWait;
  end;
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
  try
    if FExceptionText.IsEmpty and Assigned(FOnTerminateProc)then
      FOnTerminateProc(FResultValue)
    else
    begin
      io.HideWait;
      raise EioException.Create('(' + Self.ClassName + ') - ' + FExceptionText);
    end;
  finally
    io.HideWait;
  end;
end;

function TioCommonBSAPersistenceThread.ResultValue: TObject;
begin
  Result := FResultValue;
end;

end.
