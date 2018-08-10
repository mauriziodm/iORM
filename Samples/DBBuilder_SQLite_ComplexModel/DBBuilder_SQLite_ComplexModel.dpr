program DBBuilder_SQLite_ComplexModel;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {BuilderForm},
  uInterfaces in 'Commons\model\uInterfaces.pas',
  uModel in 'Commons\model\uModel.pas',
  uRegisterClasses in 'Commons\registerclasses\uRegisterClasses.pas';

{$STRONGLINKTYPES ON}

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TBuilderForm, BuilderForm);
  Application.Run;
end.
