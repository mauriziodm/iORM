unit View.BindSource.ListView.Fmx;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, Data.Bind.GenData,
  Data.Bind.Components, Data.Bind.ObjectScope,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Model, iORM.Attributes, iORM, iORM.CommonTypes, iORM.MVVM.Interfaces, iORM.MVVM.ModelBindSource,
  iORM.MVVM.ViewModelBridge;

type

  [diViewFor(TArticle, 'BindSourceListView')]
  TViewBindSourceListViewFmx = class(TFrame)
    ToolBarTop: TToolBar;
    LabelTitle: TLabel;
    VMBridge: TioViewModelBridge;
    MBSArticles: TioModelBindSource;
    ListView1: TListView;
    BindingsList1: TBindingsList;
    [ioBindAction('acPrevPage')]
    SpeedButtonPrev: TSpeedButton;
    [ioBindAction('acNextPage')]
    SpeedButtonNext: TSpeedButton;
    LinkListControlToField1: TLinkListControlToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
