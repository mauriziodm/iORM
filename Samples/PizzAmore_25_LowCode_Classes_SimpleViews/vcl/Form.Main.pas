unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, iORM, iORM.Attributes, iORM.CommonTypes, iORM.DBBuilder.Interfaces, iORM.DB.ConnectionDef,
  iORM.Abstraction.VCL, iORM.MVVM.Interfaces, iORM.MVVM.ViewContextProvider, iORM.StdActions.CloseQueryRepeater, System.Actions, Vcl.ActnList,
  iORM.StdActions.Vcl, iORM.SynchroStrategy.Interfaces, iORM.SynchroStrategy.Custom, iORM.SynchroStrategy.EtmBased, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TMainForm = class(TForm)
    ButtonOrders: TButton;
    ButtonCustomers: TButton;
    ButtonPizzas: TButton;
    ImagePizza: TImage;
    LabelTitlePizz: TLabel;
    LabelTitleAmore: TLabel;
    Shape1: TShape;
    ioVCL1: TioVCL;
    SQLiteConn: TioSQLiteConnectionDef;
    ActionList1: TActionList;
    acQuit: TioBSCloseQuery;
    ButtonQuit: TButton;
    acShowCustomers: TioBSShowOrSelect;
    acShowPizzas: TioBSShowOrSelect;
    acShowOrders: TioBSShowOrSelect;
    HttpConn: TioHttpConnectionDef;
    ButtonIngredients: TButton;
    acShowIngredients: TioBSShowOrSelect;
    ButtonSynchroLogs: TButton;
    acShowSynchroLogs: TioBSShowOrSelect;
    FirebirdConn: TioFirebirdConnectionDef;
    procedure SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
      AWarnings: TStrings);
    procedure SQLiteConnBeforeCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript, AWarnings: TStrings;
      var AAbort: Boolean);
    procedure FirebirdConnBeforeCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript, AWarnings: TStrings;
      var AAbort: Boolean);
    procedure FirebirdConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript, AWarnings: TStrings);
  private
  public
  end;

var
  MainForm: TMainForm;

implementation

uses
  Utils.SampleData;

{$R *.dfm}

procedure TMainForm.FirebirdConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript, AWarnings: TStrings);
begin
  TSampleData.CheckForSampleDataCreation;
end;

procedure TMainForm.FirebirdConnBeforeCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript, AWarnings: TStrings;
  var AAbort: Boolean);
var
  LFileName: string;
begin
  LFileName := ExtractFileName(ParamStr(0));
  Insert('_Fb', LFileName, Pos('.', LFileName));

  AScript.SaveToFile(ChangeFileExt(LFileName, '.sql'));
end;

procedure TMainForm.SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
  AWarnings: TStrings);
begin
  TSampleData.CheckForSampleDataCreation;
end;

procedure TMainForm.SQLiteConnBeforeCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript, AWarnings: TStrings;
  var AAbort: Boolean);
var
  LFileName: string;
begin
  LFileName := ExtractFileName(ParamStr(0));
  Insert('_SqLite', LFileName, Pos('.', LFileName));

  AScript.SaveToFile(ChangeFileExt(LFileName, '.sql'));
end;

end.
