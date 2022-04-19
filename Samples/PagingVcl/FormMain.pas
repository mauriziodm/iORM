unit FormMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids,
  System.Classes, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom, iORM.DB.DataSet.Master, iORM.DB.ConnectionDef, iORM.Abstraction.VCL, Vcl.ExtCtrls,
  iORM.StdActions.Vcl, System.Actions, Vcl.ActnList;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    LabelPageCount: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBGrid1: TDBGrid;
    ioVCL1: TioVCL;
    SQLIteConn: TioSQLiteConnectionDef;
    DSArticles: TioDataSetMaster;
    SourceArticles: TDataSource;
    Timer1: TTimer;
    ActionList1: TActionList;
    ioBSNextPage1: TioBSNextPage;
    ioBSPrevPage1: TioBSPrevPage;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  SampleData;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  TSampleData.CreateSampleData(StrToInt(Edit1.Text));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  DSArticles.Active :=  not DSArticles.Active;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//  DSArticles.Open;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  DSArticles.Refresh(True);
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
begin
  DSArticles.Refresh(False);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  LabelPageCount.Caption := 'Page ' + DSArticles.Paging.CurrentPage.ToString + '/' + DSArticles.Paging.PageCount.ToString;
end;

end.
