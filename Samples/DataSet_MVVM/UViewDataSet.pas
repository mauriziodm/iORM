unit UViewDataSet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, iORM.Attributes,
  iORM.MVVM.Components.ViewModelBridge, Data.DB,
  iORM.DB.Components.DataSet.Base, iORM.DB.Components.DataSet.ModelDataSet,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls;

type

  [diRegister]
  TDataSetView = class(TForm)
    ioViewModelBridge1: TioViewModelBridge;
    ModelMasterDataSet: TioModelDataSet;
    DBGrid1: TDBGrid;
    MasterDataSource: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    ModelDetailDataSet: TioModelDataSet;
    DetailDataSource: TDataSource;
    ScrollBox1: TScrollBox;
    DBImage1: TDBImage;
    ModelMasterDataSetID: TIntegerField;
    ModelMasterDataSetPropDateTime: TDateTimeField;
    ModelMasterDataSetPropBitMap: TGraphicField;
    ModelMasterDataSetDescrizione: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TDataSetView.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TDataSetView.FormCreate(Sender: TObject);
begin
  ModelMasterDataSet.Open;
  ModelDetailDataSet.Open;
end;

end.
