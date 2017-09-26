unit FormStart;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  System.Actions, FMX.ActnList, iORM.MVVM.Components.ViewContextProvider,
  iORM.DB.Components.ConnectionDef, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TStartForm = class(TForm)
    SQLIteConn: TioSQLiteConnectionDef;
    VCProviderMaster: TioViewContextProvider;
    ActionList1: TActionList;
    TabControl: TTabControl;
    NextTabAction1: TNextTabAction;
    PreviousTabAction1: TPreviousTabAction;
    procedure VCProviderMasterioOnAfterRequest(const Sender: TObject;
      const AView, AViewContext: TComponent);
    procedure VCProviderMasterioOnRelease(const Sender: TObject; const AView,
      AViewContext: TComponent);
    procedure SQLIteConnAfterRegister(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure VCProviderMasterioOnRequest(const Sender: TObject;
      out ResultViewContext: TComponent);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StartForm: TStartForm;

implementation

uses
  U.SampleData, V.Interfaces, iORM, Model.Interfaces;

{$R *.fmx}

procedure TStartForm.FormCreate(Sender: TObject);
begin
  io.di.LocateView<IArticleListView>.Show;
end;

procedure TStartForm.SQLIteConnAfterRegister(Sender: TObject);
begin
  TSampleData.CheckForSampleData;
end;

procedure TStartForm.VCProviderMasterioOnAfterRequest(const Sender: TObject;
  const AView, AViewContext: TComponent);
begin
  NextTabAction1.Execute;
end;

procedure TStartForm.VCProviderMasterioOnRelease(const Sender: TObject;
  const AView, AViewContext: TComponent);
begin
  PreviousTabAction1.Execute;
  TabControl.Delete((AViewContext as TTabItem).Index);
end;

procedure TStartForm.VCProviderMasterioOnRequest(const Sender: TObject;
  out ResultViewContext: TComponent);
begin
  ResultViewContext := TabControl.Add;
end;

end.
