unit View.Dataset.Grid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  iORM.Attributes, Model, iORM.MVVM.ViewModelBridge, iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, iORM, iORM.CommonTypes, iORM.MVVM.Interfaces;

type

  [diViewFor(TArticle, 'DatasetGrid')]
  TViewDatasetGrid = class(TFrame)
    ViewPanelTop: TPanel;
    LabelTitle: TLabel;
    VMBridge: TioViewModelBridge;
    MDSArticles: TioModelDataSet;
    DSArticles: TDataSource;
    MDSArticlesID: TIntegerField;
    MDSArticlesDescription: TStringField;
    MDSArticlesPrice: TCurrencyField;
    [ioBindAction('acPrevPage')]
    ButtonPreviousPage: TSpeedButton;
    [ioBindAction('acNextPage')]
    ButtonNextPage: TSpeedButton;
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TFrameDatasetBase }

end.
