unit FStart;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  System.Actions, FMX.ActnList, iORM.MVVM.Components.ViewContextProvider,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Forms,
  iORM.DB.Components.ConnectionDef, iORM.AbstractionLayer.Framework.FMX;

type
  TStartForm = class(TForm)
    TabsVCProvider: TioViewContextProvider;
    FormsVCProvider: TioViewContextProvider;
    Panel1: TPanel;
    RBTabs: TRadioButton;
    RBForms: TRadioButton;
    MainTabControl: TTabControl;
    ActionList1: TActionList;
    NextTabAction1: TNextTabAction;
    PreviousTabAction1: TPreviousTabAction;
    SQLiteConn: TioSQLiteConnectionDef;
    ioFMX1: TioFMX;
    procedure FormCreate(Sender: TObject);
    procedure RBTabsChange(Sender: TObject);
    procedure TabsVCProviderioOnRelease(const Sender: TObject; const AView,
      AViewContext: TComponent);
    procedure TabsVCProviderioOnRequest(const Sender: TObject;
      out ResultViewContext: TComponent);
    procedure FormsVCProviderioOnRelease(const Sender: TObject; const AView,
      AViewContext: TComponent);
    procedure FormsVCProviderioOnRequest(const Sender: TObject;
      out ResultViewContext: TComponent);
    procedure TabsVCProviderioOnAfterRequest(const Sender: TObject; const AView,
      AViewContext: TComponent);
    procedure SQLiteConnAfterRegister(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StartForm: TStartForm;

implementation

uses
  FMX.Styles, iORM, V.Interfaces, FViewContext, SampleData, FWait,
  VM.Interfaces, Vcl.Controls, Winapi.Windows;

{$R *.fmx}

procedure TStartForm.FormCreate(Sender: TObject);
var
  Style : TFMXObject;
begin
  // Register the ShowWait & CloseWait proc
  Application.CreateForm(TWaitForm, WaitForm);
  io.SetWaitProc(
    procedure
    begin
      WaitForm.Show;
    end,
    procedure
    begin
      WaitForm.Hide;
    end
    );
  // Set the stype
  Style := TStyleStreaming.LoadFromResource(hinstance, 'CopperStyle', RT_RCDATA);
  TStyleManager.SetStyle(Style);
  // Get the main view
  io.di.LocateView<IMainView>.Show;
end;

procedure TStartForm.FormsVCProviderioOnRelease(const Sender: TObject;
  const AView, AViewContext: TComponent);
begin
  AViewContext.Free;
end;

procedure TStartForm.FormsVCProviderioOnRequest(const Sender: TObject;
  out ResultViewContext: TComponent);
begin
  ResultViewContext := TViewContextForm.Create(Self);
end;

procedure TStartForm.RBTabsChange(Sender: TObject);
begin
  if RBForms.IsChecked then
    FormsVCProvider.SetAsDefault
  else
    TabsVCProvider.SetAsDefault;
end;

procedure TStartForm.SQLiteConnAfterRegister(Sender: TObject);
begin
  // Check for sample data creation
  if (Sender as TioCustomConnectionDef).DefaultConnection then
    TSampleData.CheckForSampleDataCreation;
end;

procedure TStartForm.TabsVCProviderioOnAfterRequest(const Sender: TObject;
  const AView, AViewContext: TComponent);
begin
  (AView as TFrame).Align := TAlignLayout.Client;
  NextTabAction1.Execute;
end;

procedure TStartForm.TabsVCProviderioOnRelease(const Sender: TObject;
  const AView, AViewContext: TComponent);
begin
  PreviousTabAction1.Execute;
  MainTabControl.Delete((AViewContext as TTabItem).Index);
end;

procedure TStartForm.TabsVCProviderioOnRequest(const Sender: TObject;
  out ResultViewContext: TComponent);
begin
  ResultViewContext := MainTabControl.Add;
end;

end.
