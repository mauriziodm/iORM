unit MicroView.OrderRowPizza;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Model.OrderRow, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.DB,
  iORM.MVVM.ViewModelBridge, iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Samples.Spin, System.Actions,
  Vcl.ActnList, iORM.StdActions.Vcl, Vcl.Buttons;

type

  [diViewFor(TPizzaOrderRow)]
  TMicroViewOrderRowPizza = class(TFrame)
    OrderRowMicroVMBridge: TioViewModelBridge;
    BSOrderRow: TioModelDataSet;
    SourceOrderRow: TDataSource;
    BSOrderRowDescription: TStringField;
    DBImage1: TDBImage;
    Label2: TLabel;
    DBEditNote: TDBEdit;
    Label1: TLabel;
    DBEditPrice: TDBEdit;
    Label3: TLabel;
    DBEditQty: TDBEdit;
    Label4: TLabel;
    DBEditRowTotal: TDBEdit;
    BSOrderRowPizzaPrice: TCurrencyField;
    BSOrderRowPizzaImage: TGraphicField;
    BSOrderRowQty: TIntegerField;
    BSOrderRowRowTotal: TCurrencyField;
    Shape1: TShape;
    ActionList1: TActionList;
    acDelete: TioViewAction;
    ButtonShow: TSpeedButton;
    ButtonDelete: TSpeedButton;
    acShow: TioViewAction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
