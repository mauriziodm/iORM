unit Form.Start;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, iORM.AbstractionLayer.Framework.FMX,
  iORM.DB.Components.ConnectionDef, FMX.TabControl, iORM.DBBuilder.Interfaces;

type
  TStartForm = class(TForm)
    ioFMX1: TioFMX;
    SQLiteConn: TioSQLiteConnectionDef;
    TabControl1: TTabControl;
    TabItemGrid: TTabItem;
    TabItemListView: TTabItem;
    TabItemListBox: TTabItem;
    procedure FormShow(Sender: TObject);
    procedure SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult;
      const AScript, AWarnings: TStrings);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StartForm: TStartForm;

implementation

uses
  SampleData, Model, iORM, iORM.MVVM.Interfaces;

{$R *.fmx}

procedure TStartForm.FormShow(Sender: TObject);
var
  LViewModel: IioViewModel;
begin
  LViewModel := io.CreateViewModelFor<TArticle>;
  io.CreateViewFor<TArticle>('BindSourceGrid', TabItemGrid, LViewModel);
  io.CreateViewFor<TArticle>('BindSourceListView', TabItemListView, LViewModel);
  io.CreateViewFor<TArticle>('BindSourceListBox', TabItemListBox, LViewModel);
end;

procedure TStartForm.SQLiteConnAfterCreateOrAlterDB(const Sender: TioCustomConnectionDef; const ADBStatus: TioDBBuilderEngineResult;
  const AScript, AWarnings: TStrings);
begin
  TSampleData.CheckSampleData;
end;

end.
