unit View.BindSource.Grid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.Bind.Components, Data.Bind.ObjectScope, iORM.LiveBindings.ModelBindSource, Data.Bind.GenData, Vcl.Grids,
  iORM.Attributes, Model, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Grid, iORM.MVVM.ViewModelBridge, iORM.MVVM.ModelBindSource;

type

  [diViewFor(TArticle, 'BindSourceGrid')]
  TViewBindSourceGrid = class(TFrame)
    ViewPanelTop: TPanel;
    LabelTitle: TLabel;
    VMBridge: TioViewModelBridge;
    MBSArticles: TioModelBindSource;
    [ioBindAction('acPrevPage')]
    ButtonPreviousPage: TSpeedButton;
    [ioBindAction('acNextPage')]
    ButtonNextPage: TSpeedButton;
    StringGrid1: TStringGrid;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceMBSArticles: TLinkGridToDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
