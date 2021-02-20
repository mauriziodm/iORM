unit FormMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, iORM.DB.Components.ConnectionDef,
  iORM.AbstractionLayer.Framework.FMX, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, System.Rtti, FMX.Grid.Style,
  Data.Bind.Components, Data.Bind.ObjectScope, iORM.LiveBindings.PrototypeBindSource, FMX.ScrollBox, FMX.Grid, Data.Bind.GenData,
  Fmx.Bind.GenData, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Grid,
  System.Actions, FMX.ActnList, Fmx.Bind.Navigator;

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
    PBSArticles: TioPrototypeBindSource;
    LinkGridToDataSourcePBSArticles: TLinkGridToDataSource;
    LabelPageCount: TLabel;
    TimerPageCount: TTimer;
    ActionList1: TActionList;
    LiveBindingsBindNavigatePrior1: TFMXBindNavigatePrior;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
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

procedure TMainForm.SpeedButton1Click(Sender: TObject);
begin
  PBSArticles.ioPaging.NextPage;
end;

procedure TMainForm.SpeedButton2Click(Sender: TObject);
begin
  PBSArticles.ioPaging.PrevPage;
end;

procedure TMainForm.SpeedButton3Click(Sender: TObject);
begin
  PBSArticles.Refresh(True);
end;

procedure TMainForm.SpeedButton4Click(Sender: TObject);
begin
  PBSArticles.Refresh(False);
end;

procedure TMainForm.TimerPageCountTimer(Sender: TObject);
begin
  LabelPageCount.Text := Format('Page %d of %d', [PBSArticles.ioPaging.CurrentPage, PBSArticles.ioPaging.PageCount]);
end;

end.
