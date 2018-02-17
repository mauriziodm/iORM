program Pizza_ioPrototypeBS_ObjStatus;

uses
  System.StartUpCopy,
//  FMX.MobilePreview,
  FMX.Forms,
  Main in 'Main.pas' {MainForml},
  Model in 'Model.pas',
  iORM,
  System.IOUtils;

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.CreateForm(TMainForml, MainForml);
  Application.Run;
end.
