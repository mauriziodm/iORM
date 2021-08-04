unit FormStart;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  System.Actions, FMX.ActnList, iORM.MVVM.Components.ViewContextProvider,
  iORM.DB.Components.ConnectionDef, FMX.Controls.Presentation, FMX.StdCtrls, iORM.AbstractionLayer.Framework.FMX,
  iORM.DBBuilder.Interfaces, FireDAC.Phys.SQLiteWrapper.Stat;

type
  TStartForm = class(TForm)
    ActionList1: TActionList;
    TabControl: TTabControl;
    NextTabAction1: TNextTabAction;
    PreviousTabAction1: TPreviousTabAction;
    ioViewContextProvider1: TioViewContextProvider;
    ioFMX1: TioFMX;
    ioSQLiteConnectionDef1: TioSQLiteConnectionDef;
    procedure VCProviderMasterioOnAfterRequest(const Sender: TObject;
      const AView, AViewContext: TComponent);
    procedure VCProviderMasterioOnRelease(const Sender: TObject; const AView,
      AViewContext: TComponent);
    procedure FormCreate(Sender: TObject);
    procedure VCProviderMasterioOnRequest(const Sender: TObject;
      out ResultViewContext: TComponent);
    procedure ioSQLiteConnectionDef1AfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
      AWarnings: TStrings);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StartForm: TStartForm;

implementation

uses
  U.SampleData, iORM, Model.Interfaces;

{$R *.fmx}

procedure TStartForm.FormCreate(Sender: TObject);
begin
  io.Show<IBase>;
end;

procedure TStartForm.ioSQLiteConnectionDef1AfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult; const AScript,
  AWarnings: TStrings);
begin
  TSampleData.CheckForSampleData;
end;

procedure TStartForm.VCProviderMasterioOnAfterRequest(const Sender: TObject;
  const AView, AViewContext: TComponent);
begin
// ----- OLD CODE -----
//  NextTabAction1.Execute;
// ----- OLD CODE -----

//  TabControl.SetActiveTabWithTransitionAsync(TabControl.Tabs[TabControl.TabCount-1], TTabTransition.Slide, TtabTransitionDirection.Normal, nil);
end;

procedure TStartForm.VCProviderMasterioOnRelease(const Sender: TObject;
  const AView, AViewContext: TComponent);
begin
// ----- OLD CODE -----
//  PreviousTabAction1.Execute;
//  TabControl.Delete((AViewContext as TTabItem).Index);
// ----- OLD CODE -----

  TabControl.SetActiveTabWithTransitionAsync(TabControl.Tabs[TabControl.TabCount-2], TTabTransition.Slide, TtabTransitionDirection.Reversed,
  procedure
  begin
    TabControl.Delete((AViewContext as TTabItem).Index);
  end);
end;

procedure TStartForm.VCProviderMasterioOnRequest(const Sender: TObject;
  out ResultViewContext: TComponent);
begin
  ResultViewContext := TabControl.Add;
  TabControl.SetActiveTabWithTransitionAsync(TabControl.Tabs[TabControl.TabCount-1], TTabTransition.Slide, TtabTransitionDirection.Normal, nil);
end;

end.
