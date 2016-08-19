program PhoneContacts_DMVC_Server;

 {$APPTYPE CONSOLE}

uses
  System.SysUtils,
  Winapi.Windows,
  Winapi.ShellAPI,
  Web.WebReq,
  Web.WebBroker,
  IdHTTPWebBrokerBridge,
  WebModule in 'WebModule.pas' {MyWebModule: TWebModule},
  iORM.REST.DMVC.Controller in '..\..\..\Source\iORM.REST.DMVC.Controller.pas',
  AnotherModel in '..\Commons\AnotherModel.pas',
  Interfaces in '..\Commons\Interfaces.pas',
  Model in '..\Commons\Model.pas',
  RegisterClassesUnit in '..\Commons\RegisterClassesUnit.pas',
  iORM,
  System.IOUtils,
  iORM.CommonTypes,
  SampleData in 'SampleData.pas';

{$R *.res}
{$STRONGLINKTYPES ON}

procedure RunServer(APort: Integer);
var
  LInputRecord: TInputRecord;
  LEvent: DWord;
  LHandle: THandle;
  LServer: TIdHTTPWebBrokerBridge;
begin
  Writeln('** DMVCFramework Server **');
  Writeln(Format('Starting HTTP Server on port %d', [APort]));
  LServer := TIdHTTPWebBrokerBridge.Create(nil);
  try
    LServer.DefaultPort := APort;
    LServer.Active := True;
//    ShellExecute(0, 'open', pChar('http://localhost:' + inttostr(APort)), nil, nil, SW_SHOWMAXIMIZED);
    Writeln('Press ESC to stop the server');
    LHandle := GetStdHandle(STD_INPUT_HANDLE);
    while True do
    begin
      Win32Check(ReadConsoleInput(LHandle, LInputRecord, 1, LEvent));
      if (LInputRecord.EventType = KEY_EVENT) and
        LInputRecord.Event.KeyEvent.bKeyDown and
        (LInputRecord.Event.KeyEvent.wVirtualKeyCode = VK_ESCAPE) then
        break;
    end;
  finally
    LServer.Free;
  end;
end;

begin
  ReportMemoryLeaksOnShutdown := True;


  // ============ IupOrm initialization ====================
  // Connection params
  io.Connections.NewFirebirdConnectionDef('localhost', TPath.GetFullPath('..\..\..\..\SamplesData\ContactsIntf.FDB'), 'SYSDBA', 'masterkey', '').Apply;
  // MSQL monitor
  io.Connections.Monitor.Mode := mmRemote;
  // Register classes in the dependency incjection container
  TDIClassRegister.RegisterClasses;
  // Check for sample data creation
  TSampleData.CheckForSampleDataCreation;
  // ============ IupOrm initialization ====================


  try
    if WebRequestHandler <> nil then
      WebRequestHandler.WebModuleClass := WebModuleClass;
    WebRequestHandlerProc.MaxConnections := 1024;
    RunServer(8080);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
