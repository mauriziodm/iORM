program PhoneContacts_MSSQL_DBBuilder;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {BuilderForm},
  BusinessObjects.Authentication.Interfaces in 'Commons\BusinessObjects.Authentication.Interfaces.pas',
  BusinessObjects.Authentication in 'Commons\BusinessObjects.Authentication.pas',
  BusinessObjects.Base.Interfaces in 'Commons\BusinessObjects.Base.Interfaces.pas',
  BusinessObjects.Base in 'Commons\BusinessObjects.Base.pas',
  BusinessObject.Model in 'Commons\BusinessObject.Model.pas',
  BusinessObject.Model.Interfaces in 'Commons\BusinessObject.Model.Interfaces.pas',
  RegisterClasses in 'Commons\RegisterClasses.pas';

{$STRONGLINKTYPES ON}

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TBuilderForm, BuilderForm);
  Application.Run;
end.
