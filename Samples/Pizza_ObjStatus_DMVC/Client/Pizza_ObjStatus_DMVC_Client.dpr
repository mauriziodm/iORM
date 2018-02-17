program Pizza_ObjStatus_DMVC_Client;

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

  Application.Initialize;
  Application.CreateForm(TMainForml, MainForml);
  Application.Run;
end.
