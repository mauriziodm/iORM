unit MicroView.OrderRow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Model.OrderRow, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.DB,
  iORM.MVVM.ViewModelBridge, iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Samples.Spin;

type

  [diViewFor(TPizzaOrderRow)]
  TMicroViewOrderRow = class(TFrame)
    OrderRowMicroVMBridge: TioViewModelBridge;
    MDSorderRow: TioModelDataSet;
    SourceOrderRow: TDataSource;
    MDSorderRowDescription: TStringField;
    DBImage1: TDBImage;
    Label2: TLabel;
    DBEditNote: TDBEdit;
    Label1: TLabel;
    DBEditPrice: TDBEdit;
    Label3: TLabel;
    DBEditQty: TDBEdit;
    Label4: TLabel;
    DBEditRowTotal: TDBEdit;
    MDSorderRowPizzaPrice: TCurrencyField;
    MDSorderRowPizzaImage: TGraphicField;
    MDSorderRowQty: TIntegerField;
    MDSorderRowRowTotal: TCurrencyField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
