unit Form.Start;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls, iORM.Abstraction.VCL, iORM, iORM.Attributes, iORM.CommonTypes,
  iORM.DBBuilder.Interfaces, iORM.DB.ConnectionDef, iORM.MVVM.Interfaces, iORM.MVVM.ViewContextProvider, iORM.MVVM.ViewModelBridge, System.Actions,
  Vcl.ActnList, iORM.StdActions.Vcl, Vcl.ExtActns;

type
  TStartForm = class(TForm)
    MainPageControl: TPageControl;
    PanelTop: TPanel;
    TabSheetMain: TTabSheet;
    PanelLogo: TPanel;
    LabelTitlePizz: TLabel;
    LabelTitleAmore: TLabel;
    ImagePizza: TImage;
    PanelMenu: TPanel;
    ButtonOrders: TButton;
    ButtonCustomers: TButton;
    ButtonPizzas: TButton;
    ioVCL1: TioVCL;
    SQLiteConn: TioSQLiteConnectionDef;
    VCProviderForm: TioViewContextProvider;
    VMBridge: TioViewModelBridge;
    ButtonQuit: TButton;
    ActionList1: TActionList;
    acQuit: TioViewAction;
    acShowOrders: TioViewAction;
    acShowCustomers: TioViewAction;
    acShowPizzas: TioViewAction;
    VCProviderTab: TioViewContextProvider;
    TabPreviousTab1: TPreviousTab;
    TabNextTab1: TNextTab;
    RadioButtonVCForm: TRadioButton;
    RadioButtonVCTab: TRadioButton;
    Label1: TLabel;
    procedure VCProviderFormRequest(const Sender: TObject; out ResultViewContext: TComponent);
    procedure VCProviderFormRelease(const Sender: TObject; const AView, AViewContext: TComponent);
    procedure VCProviderTabRequest(const Sender: TObject; out ResultViewContext: TComponent);
    procedure VCProviderTabRelease(const Sender: TObject; const AView, AViewContext: TComponent);
    procedure VCProviderFormAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
    procedure SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
      AWarnings: TStrings);
    procedure VCProviderTabAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
    procedure RadioButtonVCFormClick(Sender: TObject);
  private
  public
  end;

var
  StartForm: TStartForm;

implementation

uses
  Form.ViewContext, Utils.SampleData, System.IOUtils, RegisterClasses;

{$R *.dfm}

procedure TStartForm.RadioButtonVCFormClick(Sender: TObject);
begin
  if RadioButtonVCTab.Checked then
    VCProviderTab.SetAsDefault
  else
    VCProviderForm.SetAsDefault;
end;

procedure TStartForm.SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
  AWarnings: TStrings);
begin
  TSampleData.CheckForSampleDataCreation;
end;

procedure TStartForm.VCProviderFormAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
begin
  (AView as TFrame).Align := alClient;
end;

procedure TStartForm.VCProviderFormRelease(const Sender: TObject; const AView, AViewContext: TComponent);
begin
  AViewContext.Free;
end;

procedure TStartForm.VCProviderFormRequest(const Sender: TObject; out ResultViewContext: TComponent);
begin
  ResultViewContext := TViewContextForm.Create(Self);
end;

procedure TStartForm.VCProviderTabAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
begin
  (AView as TFrame).Align := alClient;
  TabNextTab1.Execute;
end;

procedure TStartForm.VCProviderTabRelease(const Sender: TObject; const AView, AViewContext: TComponent);
begin
  TabPreviousTab1.Execute;
  AViewContext.Free;
end;

procedure TStartForm.VCProviderTabRequest(const Sender: TObject; out ResultViewContext: TComponent);
var
  LTabSheet: TTabSheet;
begin
  LTabSheet := TTabSheet.Create(MainPageControl);
  LTabSheet.TabVisible := False;
  LTabSheet.PageControl := MainPageControl;
  ResultViewContext := LTabSheet;
end;

initialization

  TRegisterClasses.RegisterClasses;

end.
