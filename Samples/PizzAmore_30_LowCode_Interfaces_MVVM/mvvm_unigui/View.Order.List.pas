unit View.Order.List;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.BaseForList, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.DB, iORM.MVVM.ViewModelBridge,
  iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl, uniLabel, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniGUIClasses, uniPanel, uniBasicGrid, uniDBGrid, Model.Interfaces, uniEdit, uniDBEdit, uniMultiItem, uniComboBox, uniDateTimePicker,
  uniDBComboBox, uniDBDateTimePicker;

type

  [diViewFor(IOrder)]
  TViewOrders = class(TViewBaseForList)
    acWhereShowHistory: TioViewAction;
    BSMasterID: TIntegerField;
    BSMasterOrderDate: TDateField;
    BSMasterCustomerName: TStringField;
    BSMasterGrandTotal: TCurrencyField;
    BSMasterOrderState: TStringField;
    BSWhereOrderID: TIntegerField;
    BSWhereOrderState: TStringField;
    BSWhereNote: TStringField;
    BSWhereFromDate: TDateField;
    BSWhereToDate: TDateField;
    procedure UniFrameCreate(Sender: TObject);
  private
  public
  end;

implementation

{$R *.dfm}

procedure TViewOrders.UniFrameCreate(Sender: TObject);
begin
  inherited;
//  io.Enums.FillStrings<TOrderState>(DBEditStatus.Items);
end;

end.
