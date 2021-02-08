unit FormMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, iORM.DB.Components.ConnectionDef,
  iORM.AbstractionLayer.Framework.FMX, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, System.Rtti, FMX.Grid.Style,
  Data.Bind.Components, Data.Bind.ObjectScope, iORM.LiveBindings.PrototypeBindSource, FMX.ScrollBox, FMX.Grid, Data.Bind.GenData,
  Fmx.Bind.GenData, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Grid;

type
  TMainForm = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Grid1: TGrid;
    BindingsList1: TBindingsList;
    Button2: TButton;
    Button5: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ioFMX1: TioFMX;
    SQLIteConn: TioSQLiteConnectionDef;
    PBSArticles: TioPrototypeBindSource;
    LinkGridToDataSourcePBSArticles: TLinkGridToDataSource;
    LabelPageCount: TLabel;
    TimerPageCount: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure TimerPageCountTimer(Sender: TObject);
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

procedure TMainForm.Button2Click(Sender: TObject);
begin
  PBSArticles.Refresh(True);
end;

procedure TMainForm.Button5Click(Sender: TObject);
begin
  PBSArticles.Refresh(False);
end;

procedure TMainForm.SpeedButton1Click(Sender: TObject);
begin
  PBSArticles.ioPaging.NextPage;
end;

procedure TMainForm.SpeedButton2Click(Sender: TObject);
begin
  PBSArticles.ioPaging.PrevPage;
end;

procedure TMainForm.TimerPageCountTimer(Sender: TObject);
begin
  LabelPageCount.Text := Format('Page %d of %d', [PBSArticles.ioPaging.CurrentPage, PBSArticles.ioPaging.PageCount]);
end;

end.
