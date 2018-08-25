program DBBuilder_ComplexModel;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {BuilderForm},
  uInterfaces in 'Commons\model\uInterfaces.pas',
  uModel in 'Commons\model\uModel.pas',
  uRegisterClasses in 'Commons\registerclasses\uRegisterClasses.pas',
  iORM.DB.DBBuilder.Custom.SqlGenerator in '..\..\Source\iORM.DB.DBBuilder.Custom.SqlGenerator.pas';

{$STRONGLINKTYPES ON}

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TBuilderForm, BuilderForm);
  Application.Run;
end.
