unit MicroView.OrderRowPizza;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Model.OrderRow, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.DB,
  iORM.MVVM.ViewModelBridge, iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Samples.Spin, System.Actions,
  Vcl.ActnList, iORM.StdActions.Vcl, Vcl.Buttons, iORM.Where.Interfaces, iORM.DB.DataSet.Custom, iORM.DB.DataSet.Detail;

type

  [diSimpleViewFor(TPizzaOrderRow)]
  TMicroViewOrderRowPizza = class(TFrame)
    SourceOrderRow: TDataSource;
    DBImage1: TDBImage;
    Label2: TLabel;
    DBEditPizza: TDBEdit;
    Label1: TLabel;
    DBEditPrice: TDBEdit;
    Label3: TLabel;
    DBEditQty: TDBEdit;
    Label4: TLabel;
    DBEditRowTotal: TDBEdit;
    Shape1: TShape;
    ActionList1: TActionList;
    ButtonShow: TSpeedButton;
    ButtonDelete: TSpeedButton;
    DSOrderRow: TioDataSetDetail;
    DSOrderRowPizzaName: TStringField;
    DSOrderRowPizzaPrice: TCurrencyField;
    DSOrderRowQty: TIntegerField;
    DSOrderRowGrandTotal: TCurrencyField;
    acDelete: TAction;
    acShow: TAction;
    DSPizza: TioDataSetDetail;
    DSOrderRowImage: TGraphicField;
    procedure acDeleteExecute(Sender: TObject);
    procedure acShowExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TMicroViewOrderRowPizza.acDeleteExecute(Sender: TObject);
begin
  // Note: If you want to close the micro embeded view you have to call the
  //        CloseViews/Free command after the Delete and inside a finally part
  //        of a try-finally block because otherwise it would never be executed
  //        due to an "Abort" within the code that manages the Delete in the NaturalBindSource.
  try
    DSOrderRow.Delete;
  finally
    Free;
  end;
end;

procedure TMicroViewOrderRowPizza.acShowExecute(Sender: TObject);
begin
  DSPizza.ShowCurrent(nil);
end;

end.
