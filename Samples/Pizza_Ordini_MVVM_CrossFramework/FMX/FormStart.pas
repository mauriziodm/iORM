unit FormStart;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  iORM.DB.Components.ConnectionDef, iORM.MVVM.Components.ViewContextProvider,
  System.Actions, FMX.ActnList, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TStartForm = class(TForm)
    TabControl1: TTabControl;
    MainVCProvider: TioViewContextProvider;
    ioSQLiteConnectionDef1: TioSQLiteConnectionDef;
    ActionList1: TActionList;
    NextTabAction1: TNextTabAction;
    PreviousTabAction1: TPreviousTabAction;
    procedure MainVCProviderioOnRequest(const Sender: TObject;
      const AView: TComponent; out ResultViewContext: TComponent);
    procedure MainVCProviderioOnRelease(const Sender: TObject; const AView,
      AViewContext: TComponent);
    procedure MainVCProviderioOnAfterRequest(const Sender: TObject; const AView,
      AViewContext: TComponent);
    procedure ioSQLiteConnectionDef1AfterRegister(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StartForm: TStartForm;

implementation

uses
  UnitCreateSampleData, iORM;

{$R *.fmx}

procedure TStartForm.FormCreate(Sender: TObject);
begin
  io.di.LocateView('TOrderListView').Show;
end;

procedure TStartForm.ioSQLiteConnectionDef1AfterRegister(Sender: TObject);
begin
  TCreateSampleData.CreateSampleData;
end;

procedure TStartForm.MainVCProviderioOnAfterRequest(const Sender: TObject;
  const AView, AViewContext: TComponent);
begin
  NextTabAction1.Execute;
end;

procedure TStartForm.MainVCProviderioOnRelease(const Sender: TObject;
  const AView, AViewContext: TComponent);
begin
  PreviousTabAction1.Execute;
  TabControl1.Delete((AViewContext as TTabItem).Index);
end;

procedure TStartForm.MainVCProviderioOnRequest(const Sender: TObject;
  const AView: TComponent; out ResultViewContext: TComponent);
begin
  ResultViewContext := TabControl1.Add;
end;

end.
