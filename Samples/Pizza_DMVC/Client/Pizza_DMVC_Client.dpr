program Pizza_DMVC_Client;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {MainForml},
  iORM,
  System.IOUtils,
  Model in '..\Common\Model.pas';

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;

  // ============ IupOrm initialization ====================
  // Connection params
  io.Connections.NewRESTConnection('http://localhost:8080', False);
  // ============ IupOrm initialization ====================

  Application.Initialize;
  Application.CreateForm(TMainForml, MainForml);
  Application.Run;
end.
