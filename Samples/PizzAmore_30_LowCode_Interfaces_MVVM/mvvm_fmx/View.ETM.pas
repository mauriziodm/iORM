unit View.ETM;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects, System.Rtti, FMX.Grid.Style,
  FMX.Memo.Types, FMX.Memo, FMX.Layouts, FMX.ScrollBox, FMX.Grid, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, iORM.MVVM.ViewModelBridge,
  Data.DB, iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, Data.Bind.Components, Data.Bind.ObjectScope, iORM.MVVM.ModelBindSource, Data.Bind.GenData,
  System.Actions, FMX.ActnList, iORM.StdActions.Fmx, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Grid, ETM.Repository;

type

  [diViewFor(TEtmRepository)]
  TViewETM = class(TFrame)
    Rectangle1: TRectangle;
    Label1: TLabel;
    LabelTimeLineFor: TLabel;
    LabelID: TLabel;
    Label3: TLabel;
    RectangleTitle: TRectangle;
    LabelTitle: TLabel;
    ButtonRevert: TSpeedButton;
    ButtonBack: TSpeedButton;
    GridETM: TStringGrid;
    LayoutDiff: TLayout;
    Label2: TLabel;
    DiffMemo: TMemo;
    ioViewModelBridge1: TioViewModelBridge;
    BS_ETM: TioModelBindSource;
    ActionList1: TActionList;
    acBack: TioViewAction;
    acEtmRevertToVersion: TioViewAction;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBS_ETM: TLinkGridToDataSource;
    LinkControlToField1: TLinkControlToField;
  private
  public
  end;

implementation

{$R *.fmx}

end.
