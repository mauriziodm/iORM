{******************************************************************************}
{                                                                              }
{       WiRL: RESTful Library for Delphi                                       }
{                                                                              }
{       Copyright (c) 2015-2019 WiRL Team                                      }
{                                                                              }
{       https://github.com/delphi-blocks/WiRL                                  }
{                                                                              }
{******************************************************************************}
program PizzAmore_25_LowCode_Classes_Server_WiRL;



uses
  Forms,
  Server.Form.Main in 'Server.Form.Main.pas' {MainForm},
  Where.Pizza in '..\common_model\Where.Pizza.pas',
  Where.Order in '..\common_model\Where.Order.pas',
  Utils.SampleData in '..\common_model\Utils.SampleData.pas',
  Model.Pizza in '..\common_model\Model.Pizza.pas',
  Model.Pizza.IngredientRow in '..\common_model\Model.Pizza.IngredientRow.pas',
  Model.OrderRow in '..\common_model\Model.OrderRow.pas',
  Model.Order in '..\common_model\Model.Order.pas',
  Model.Ingredient in '..\common_model\Model.Ingredient.pas',
  Model.Customer in '..\common_model\Model.Customer.pas',
  ETM.Repository in '..\common_model\ETM.Repository.pas',
  iORM.Http.Server.WiRL.Resource in 'C:\delphi\tools\iORM\Source\http_server_units\iORM.Http.Server.WiRL.Resource.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.