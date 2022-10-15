unit MicroView.OrderRowCustom;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, FMX.Layouts, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.Bind.GenData, Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.MVVM.ModelBindSource, System.Actions, FMX.ActnList, iORM.StdActions.Fmx, iORM.MVVM.ViewModelBridge, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Model.OrderRow, iORM.Where.Interfaces, iORM.LiveBindings.PrototypeBindSource.Custom,
  iORM.LiveBindings.PrototypeBindSource.Detail;

type

  [diSimpleViewFor(TCustomOrderRow)]
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
    ActionListRowMView: TActionList;
    BindingsList1: TBindingsList;
    acDelete: TAction;
    BSRowCustom: TioPrototypeBindSourceDetail;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    procedure acDeleteExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TMicroViewOrderRowCustom.acDeleteExecute(Sender: TObject);
begin
  // Note: If you want to close the micro embeded view you have to call the
  //        CloseViews/Free command after the Delete and inside a finally part
  //        of a try-finally block because otherwise it would never be executed
  //        due to an "Abort" within the code that manages the Delete in the NaturalBindSource.
  try
    BSRowCustom.Delete;
  finally
    Free;
  end;
end;

end.
