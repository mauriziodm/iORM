unit View.BindSource.Grid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.BindSource.Base, Data.Bind.GenData, iORM.MVVM.Components.ViewModelBridge,
  Data.Bind.Components, Data.Bind.ObjectScope, iORM.LiveBindings.ModelBindSource, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Grid,
  iORM.Attributes, Model;

type

  [diViewFor(TArticle, 'BindSourceGrid')]
  TViewBindSourceGrid = class(TViewBindSourceBase)
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
