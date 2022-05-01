unit View.BindSource.Grid.Fmx;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, System.Rtti,
  FMX.Grid.Style, FMX.Grid, FMX.ScrollBox, Data.Bind.Components, Data.Bind.ObjectScope,
  Data.Bind.GenData, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Grid, iORM.Attributes, Model, iORM, iORM.CommonTypes, iORM.MVVM.Interfaces, iORM.MVVM.ViewModelBridge, iORM.MVVM.ModelBindSource;

type

  [diViewFor(TArticle, 'BindSourceGrid')]
  TViewBindSourceGridFmx = class(TFrame)
    ToolBarTop: TToolBar;
    Grid1: TGrid;
    VMBridge: TioViewModelBridge;
    MBSArticles: TioModelBindSource;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceMBSArticles: TLinkGridToDataSource;
    LabelTitle: TLabel;
    [ioBindAction('acPrevPage')]
    SpeedButtonPrev: TSpeedButton;
    [ioBindAction('acNextPage')]
    SpeedButtonNext: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
