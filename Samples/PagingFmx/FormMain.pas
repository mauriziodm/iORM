unit FormMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, System.Rtti, FMX.Grid.Style,
  Data.Bind.Components, Data.Bind.ObjectScope, FMX.ScrollBox, FMX.Grid, Data.Bind.GenData,
  Fmx.Bind.GenData, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Grid,
  System.Actions, FMX.ActnList, Fmx.Bind.Navigator, iORM.DB.ConnectionDef, iORM.Abstraction.FMX, iORM.LiveBindings.PrototypeBindSource.Custom,
  iORM.LiveBindings.PrototypeBindSource.Master, iORM.StdActions.Fmx;

type
  TMainForm = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Grid1: TGrid;
    BindingsList1: TBindingsList;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ioFMX1: TioFMX;
    SQLIteConn: TioSQLiteConnectionDef;
    LabelPageCount: TLabel;
    TimerPageCount: TTimer;
    ActionList1: TActionList;
    LiveBindingsBindNavigatePrior1: TFMXBindNavigatePrior;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ActionList2: TActionList;
    Action1: TAction;
    LiveBindingsBindNavigateNext1: TFMXBindNavigateNext;
    PBSArticles: TioPrototypeBindSourceMaster;
    LinkGridToDataSourcePBSArticles: TLinkGridToDataSource;
    ioBSNextPage1: TioBSNextPage;
    ioBSPrevPage1: TioBSPrevPage;
    procedure Button1Click(Sender: TObject);
    procedure TimerPageCountTimer(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses
  SampleData, iORM.LiveBindings.Interfaces;

{$R *.fmx}

procedure TMainForm.Button1Click(Sender: TObject);
begin
  TSampleData.CreateSampleData(Edit1.Text.ToInteger);
end;

procedure TMainForm.SpeedButton3Click(Sender: TObject);
begin
//  PBSArticles.Refresh(True);
end;

procedure TMainForm.SpeedButton4Click(Sender: TObject);
begin
//  PBSArticles.Refresh(False);
end;

procedure TMainForm.TimerPageCountTimer(Sender: TObject);
begin
//  LabelPageCount.Text := Format('Page %d of %d', [PBSArticles.ioPaging.CurrentPage, PBSArticles.ioPaging.PageCount]);
end;

end.
