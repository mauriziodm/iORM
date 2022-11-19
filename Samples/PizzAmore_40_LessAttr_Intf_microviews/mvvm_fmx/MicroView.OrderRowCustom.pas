unit MicroView.OrderRowCustom;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, FMX.Layouts, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.Bind.GenData, Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.MVVM.ModelBindSource, System.Actions, FMX.ActnList, iORM.StdActions.Fmx, iORM.MVVM.ViewModelBridge, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Model.OrderRow;

type

  [diViewFor(TCustomOrderRow)]
  TMicroViewOrderRowCustom = class(TFrame)
    RectanglebackgroundRowMView: TRectangle;
    ButtonDelete: TSpeedButton;
    EditPrice: TEdit;
    Label1: TLabel;
    EditQty: TEdit;
    Label2: TLabel;
    EditTotal: TEdit;
    Label4: TLabel;
    Memo1: TMemo;
    LayoutTopBlankRowMView: TLayout;
    Label3: TLabel;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    VMBridgeRowMView: TioViewModelBridge;
    ActionListRowMView: TActionList;
    acDelete: TioViewAction;
    BSOrderRow: TioModelBindSource;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
