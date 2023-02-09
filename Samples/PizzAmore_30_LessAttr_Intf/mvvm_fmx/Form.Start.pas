unit Form.Start;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects, FMX.TabControl, iORM, iORM.Attributes,
  iORM.CommonTypes, iORM.DBBuilder.Interfaces, iORM.MVVM.Interfaces, System.Actions, FMX.ActnList, iORM.StdActions.Fmx, iORM.MVVM.ViewModelBridge,
  iORM.MVVM.ViewContextProvider, iORM.DB.ConnectionDef, iORM.Abstraction.FMX, FMX.Layouts;

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
    ioFMX1: TioFMX;
    SQLiteConn: TioSQLiteConnectionDef;
    VCProvider: TioViewContextProvider;
    VMBridge: TioViewModelBridge;
    ActionList1: TActionList;
    acQuit: TioViewAction;
    acShowOrders: TioViewAction;
    acShowCustomers: TioViewAction;
    acShowPizzas: TioViewAction;
    LayoutMain: TLayout;
    Layout1: TLayout;
    Label2: TLabel;
    Label1: TLabel;
    ImageLogo: TImage;
    procedure SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
      AWarnings: TStrings);
    procedure VCProviderRequest(const Sender: TObject; out ResultViewContext: TComponent);
    procedure VCProviderRelease(const Sender: TObject; const AView, AViewContext: TComponent);
    procedure VCProviderAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StartForm: TStartForm;

implementation

uses
  Utils.SampleData, System.IOUtils, RegisterClasses;

{$R *.fmx}

procedure TStartForm.SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
  AWarnings: TStrings);
begin
  TSampleData.CheckForSampleDataCreation;
end;

procedure TStartForm.VCProviderAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
begin
  (AView as TFrame).Align := TAlignLayout.Client;
  TabControlStart.SetActiveTabWithTransitionAsync(AViewContext as TTabItem, TTabTransition.Slide, TTabTransitionDirection.Normal, nil);
end;

procedure TStartForm.VCProviderRelease(const Sender: TObject; const AView, AViewContext: TComponent);
var
  LTabItemToDestroy: TTabItem;
  LTabItemToReactivate: TTabItem;
begin
  LTabItemToDestroy := (AViewContext as TTabItem);
  LTabItemToReactivate := TabControlStart.Tabs[LTabItemToDestroy.Index-1];
  TabControlStart.SetActiveTabWithTransitionAsync(LTabItemToReactivate, TTabTransition.Slide, TTabTransitionDirection.Reversed,
    procedure
    begin
      LTabItemToDestroy.DisposeOf;
    end
  );
end;

procedure TStartForm.VCProviderRequest(const Sender: TObject; out ResultViewContext: TComponent);
begin
  ResultViewContext := TabControlStart.Add;
end;

initialization

  TRegisterClasses.RegisterClasses;

end.
