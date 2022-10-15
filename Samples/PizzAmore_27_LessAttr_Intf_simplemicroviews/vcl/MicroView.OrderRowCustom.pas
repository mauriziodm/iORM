unit MicroView.OrderRowCustom;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, System.Actions, Vcl.ActnList,
  iORM.StdActions.Vcl, Data.DB, iORM.MVVM.ViewModelBridge, iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls,
  Model.OrderRow, Vcl.Buttons, iORM.Where.Interfaces, iORM.DB.DataSet.Custom, iORM.DB.DataSet.Detail;

type

  [diSimpleViewFor(TCustomOrderRow)]
  TMicroViewOrderRowCustom = class(TFrame)
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Shape1: TShape;
    DBEditPrice: TDBEdit;
    DBEditQty: TDBEdit;
    DBEditRowTotal: TDBEdit;
    SourceOrderRow: TDataSource;
    ActionList1: TActionList;
    DBMemoDescription: TDBMemo;
    ButtonDelete: TSpeedButton;
    DSOrderRow: TioDataSetDetail;
    DSOrderRowQty: TIntegerField;
    DSOrderRowGrandTotal: TCurrencyField;
    DSOrderRowDescription: TStringField;
    DSOrderRowPrice: TCurrencyField;
    acDelete: TAction;
    procedure acDeleteExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TMicroViewOrderRowCustom.acDeleteExecute(Sender: TObject);
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

end.
