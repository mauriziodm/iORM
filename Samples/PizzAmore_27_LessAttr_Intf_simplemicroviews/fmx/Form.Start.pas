unit Form.Start;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, FMX.Layouts, FMX.StdCtrls, FMX.Controls.Presentation, FMX.TabControl,
  System.Actions, FMX.ActnList, iORM.Abstraction.FMX, iORM, iORM.Attributes, iORM.CommonTypes, iORM.DBBuilder.Interfaces, iORM.DB.ConnectionDef,
  iORM.MVVM.Interfaces, iORM.MVVM.ViewContextProvider;

type
  TStartForm = class(TForm)
    TabControlStart: TTabControl;
    TabItemStart: TTabItem;
    RectangleTitle: TRectangle;
    LabelTitle: TLabel;
    ButtonQuit: TSpeedButton;
    ButtonGoToOrderList: TButton;
    ButtonGoToPizzaList: TButton;
    ButtonGoToCustomerList: TButton;
    LayoutMain: TLayout;
    Layout1: TLayout;
    Label2: TLabel;
    Label1: TLabel;
    ImageLogo: TImage;
    ActionList1: TActionList;
    NextTabAction1: TNextTabAction;
    PreviousTabAction1: TPreviousTabAction;
    acQuit: TAction;
    ioFMX1: TioFMX;
    acShowCustomers: TAction;
    acShowPizzas: TAction;
    acShowOrders: TAction;
    SQLiteConn: TioSQLiteConnectionDef;
    VCProvider: TioViewContextProvider;
    procedure acQuitExecute(Sender: TObject);
    procedure acShowCustomersExecute(Sender: TObject);
    procedure acShowPizzasExecute(Sender: TObject);
    procedure acShowOrdersExecute(Sender: TObject);
    procedure SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
      AWarnings: TStrings);
    procedure SQLiteConnBeforeCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
      AWarnings: TStrings; var AAbort: Boolean);
    procedure VCProviderRequest(const Sender: TObject; out ResultViewContext: TComponent);
    procedure VCProviderRelease(const Sender: TObject; const AView, AViewContext: TComponent);
    procedure VCProviderAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
    procedure VCProviderBeforeRelease(const Sender: TObject; const AView, AViewContext: TComponent);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StartForm: TStartForm;

implementation

uses
  Utils.SampleData, System.IOUtils, Model.Customer, Model.Pizza, Model.Order;

{$R *.fmx}

procedure TStartForm.acQuitExecute(Sender: TObject);
begin
  io.TerminateApplication;
end;

procedure TStartForm.acShowCustomersExecute(Sender: TObject);
begin
  io.Show<TCustomer>('LIST');
end;

procedure TStartForm.acShowOrdersExecute(Sender: TObject);
begin
  io.Show<TOrder>('LIST');
end;

procedure TStartForm.acShowPizzasExecute(Sender: TObject);
begin
  io.Show<TPizza>('LIST');
end;

procedure TStartForm.SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
  AWarnings: TStrings);
begin
  TSampleData.CheckForSampleDataCreation;
end;

procedure TStartForm.SQLiteConnBeforeCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
  AWarnings: TStrings; var AAbort: Boolean);
begin
  AScript.SaveToFile(TPath.Combine(TPath.GetDocumentsPath, 'iORM_Script.txt'));
end;

procedure TStartForm.VCProviderAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
begin
  (AView as TFrame).Align := TAlignLayout.Client;
  NextTabAction1.Execute;
end;

procedure TStartForm.VCProviderBeforeRelease(const Sender: TObject; const AView, AViewContext: TComponent);
begin
  PreviousTabAction1.Execute;
end;

procedure TStartForm.VCProviderRelease(const Sender: TObject; const AView, AViewContext: TComponent);
begin
  TabControlStart.Delete((AViewCOntext as TTabItem).Index);
end;

procedure TStartForm.VCProviderRequest(const Sender: TObject; out ResultViewContext: TComponent);
begin
  ResultViewContext := TabControlStart.Add;
end;

end.
