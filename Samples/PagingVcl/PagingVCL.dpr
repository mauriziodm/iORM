program PagingVCL;

uses
  Vcl.Forms,
  FormMain in 'FormMain.pas' {Form1},
  Model in 'Model.pas',
  SampleData in 'SampleData.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
