program PhoneContacts_SQLite_DBBuilder;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {BuilderForm},
  RegisterClasses in '..\PhoneContacts_MSSQL_DBBuilder\Commons\RegisterClasses.pas',
  BusinessObjects.Authentication.Interfaces in '..\PhoneContacts_MSSQL_DBBuilder\Commons\BusinessObjects.Authentication.Interfaces.pas',
  BusinessObjects.Authentication in '..\PhoneContacts_MSSQL_DBBuilder\Commons\BusinessObjects.Authentication.pas',
  BusinessObjects.Base.Interfaces in '..\PhoneContacts_MSSQL_DBBuilder\Commons\BusinessObjects.Base.Interfaces.pas',
  BusinessObjects.Base in '..\PhoneContacts_MSSQL_DBBuilder\Commons\BusinessObjects.Base.pas',
  BusinessObjects.Interfaces in '..\PhoneContacts_MSSQL_DBBuilder\Commons\BusinessObjects.Interfaces.pas',
  BusinessObjects in '..\PhoneContacts_MSSQL_DBBuilder\Commons\BusinessObjects.pas',
  BusinessObjects.ProdItems in '..\PhoneContacts_MSSQL_DBBuilder\Commons\BusinessObjects.ProdItems.pas';

{$STRONGLINKTYPES ON}

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TBuilderForm, BuilderForm);
  Application.Run;
end.
