unit MicroView.OrderRowCustom;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, System.Actions, Vcl.ActnList,
  iORM.StdActions.Vcl, Data.DB, iORM.MVVM.ViewModelBridge, iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls,
  Model.OrderRow, Vcl.Buttons;

type

  [diViewFor(TCustomOrderRow)]
  TMicroViewOrderRowCustom = class(TFrame)
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Shape1: TShape;
    DBEditPrice: TDBEdit;
    DBEditQty: TDBEdit;
    DBEditRowTotal: TDBEdit;
    MDSorderRow: TioModelDataSet;
    MDSorderRowQty: TIntegerField;
    MDSorderRowRowTotal: TCurrencyField;
    MDSorderRowPizzaImage: TGraphicField;
    OrderRowMicroVMBridge: TioViewModelBridge;
    SourceOrderRow: TDataSource;
    ActionList1: TActionList;
    acDelete: TioViewAction;
    DBMemoDescription: TDBMemo;
    MDSorderRowDescription: TStringField;
    MDSorderRowPrice: TCurrencyField;
    ButtonDelete: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
