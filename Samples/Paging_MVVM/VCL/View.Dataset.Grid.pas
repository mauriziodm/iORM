unit View.Dataset.Grid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Dataset.Base, iORM.MVVM.Components.ViewModelBridge, Data.DB,
  iORM.DB.Components.DataSet.Base, iORM.DB.Components.DataSet.ModelDataSet, Vcl.Buttons, Vcl.ExtCtrls,
  iORM.Attributes, Model, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls;

type

  [diViewFor(TArticle, 'DatasetGrid')]
  TViewDatasetGrid = class(TViewDatasetBase)
    DBGrid1: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
