unit MicroView.OrderRowPizza;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Objects, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces,
  FMX.Layouts, iORM.MVVM.ViewModelBridge, System.Actions, FMX.ActnList, iORM.StdActions.Fmx, FMX.Controls.Presentation, FMX.Edit, Data.Bind.Components,
  Data.Bind.ObjectScope, iORM.MVVM.ModelBindSource, Data.Bind.GenData, Fmx.Bind.GenData, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Model.OrderRow;

type

  [diViewFor(TPizzaOrderRow)]
  TMicroViewOrderRowPizza = class(TFrame)
    RectanglebackgroundRowMView: TRectangle;
    ActionListRowMView: TActionList;
    acDelete: TioViewAction;
    acShow: TioViewAction;
    VMBridgeRowMView: TioViewModelBridge;
    LayoutTopBlankRowMView: TLayout;
    ButtonShow: TSpeedButton;
    ButtonDelete: TSpeedButton;
    EditPizza: TEdit;
    Label3: TLabel;
    ImagePizza: TImage;
    EditPrice: TEdit;
    Label1: TLabel;
    EditQty: TEdit;
    Label2: TLabel;
    EditTotal: TEdit;
    Label4: TLabel;
    MBSRowPizza: TioModelBindSource;
    BindingsListPizzaRowMView: TBindingsList;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
