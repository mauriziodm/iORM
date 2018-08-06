program PhoneContacts_MSSQL_DBBuilder;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {BuilderForm},
  RegisterClasses in 'Commons\RegisterClasses.pas',
  BusinessObjects.Authentication.Interfaces in 'Commons\BusinessObjects.Authentication.Interfaces.pas',
  BusinessObjects.Authentication in 'Commons\BusinessObjects.Authentication.pas',
  BusinessObjects.Base.Interfaces in 'Commons\BusinessObjects.Base.Interfaces.pas',
  BusinessObjects.Base in 'Commons\BusinessObjects.Base.pas',
  BusinessObjects.Interfaces in 'Commons\BusinessObjects.Interfaces.pas',
  BusinessObjects in 'Commons\BusinessObjects.pas',
  BusinessObjects.ProdItems in 'Commons\BusinessObjects.ProdItems.pas';

{$STRONGLINKTYPES ON}

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TBuilderForm, BuilderForm);
  Application.Run;
end.
