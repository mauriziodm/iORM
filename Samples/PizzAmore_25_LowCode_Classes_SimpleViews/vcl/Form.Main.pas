unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, iORM, iORM.Attributes, iORM.CommonTypes, iORM.DBBuilder.Interfaces, iORM.DB.ConnectionDef,
  iORM.Abstraction.VCL, iORM.MVVM.Interfaces, iORM.MVVM.ViewContextProvider, iORM.StdActions.CloseQueryRepeater, System.Actions, Vcl.ActnList,
  iORM.StdActions.Vcl, iORM.SynchroStrategy.Interfaces, iORM.SynchroStrategy.Custom, iORM.SynchroStrategy.EtmBased;

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
    procedure SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
      AWarnings: TStrings);
  private
  public
  end;

var
  MainForm: TMainForm;

implementation

uses
  Utils.SampleData;

{$R *.dfm}

procedure TMainForm.SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
  AWarnings: TStrings);
begin
  TSampleData.CheckForSampleDataCreation;
end;

end.
