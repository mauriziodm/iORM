unit MicroView.OrderRowPizza;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Objects, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces,
  FMX.Layouts, iORM.MVVM.ViewModelBridge, System.Actions, FMX.ActnList, iORM.StdActions.Fmx, FMX.Controls.Presentation, FMX.Edit, Data.Bind.Components,
  Data.Bind.ObjectScope, iORM.MVVM.ModelBindSource, Data.Bind.GenData, Fmx.Bind.GenData, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Model.OrderRow, iORM.Where.Interfaces, iORM.LiveBindings.PrototypeBindSource.Custom,
  iORM.LiveBindings.PrototypeBindSource.Detail;

type

  [diSimpleViewFor(TPizzaOrderRow)]
  TMicroViewOrderRowPizza = class(TFrame)
    RectanglebackgroundRowMView: TRectangle;
    ActionListRowMView: TActionList;
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
    BindingsListPizzaRowMView: TBindingsList;
    Rectangle2: TRectangle;
    BSRowPizza: TioPrototypeBindSourceDetail;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField1: TLinkControlToField;
    acDelete: TAction;
    BSPizza: TioPrototypeBindSourceDetail;
    acShow: TAction;
    procedure acDeleteExecute(Sender: TObject);
    procedure acShowExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TMicroViewOrderRowPizza.acDeleteExecute(Sender: TObject);
begin
  // Note: If you want to close the micro embeded view you have to call the
  //        CloseViews/Free command after the Delete and inside a finally part
  //        of a try-finally block because otherwise it would never be executed
  //        due to an "Abort" within the code that manages the Delete in the NaturalBindSource.
  try
    BSRowPizza.Delete;
  finally
    Free;
  end;
end;

procedure TMicroViewOrderRowPizza.acShowExecute(Sender: TObject);
begin
  BSPizza.ShowCurrent;
end;

end.
