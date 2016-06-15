program Pizza_List;

uses
  System.StartUpCopy,
//  FMX.MobilePreview,
  FMX.Forms,
  Main in 'Main.pas' {MainForml},
  Model in 'Model.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.CreateForm(TMainForml, MainForml);
  Application.Run;
end.
