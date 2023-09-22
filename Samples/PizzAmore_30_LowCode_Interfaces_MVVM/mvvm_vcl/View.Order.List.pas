unit View.Order.List;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.BaseForList, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.DB, iORM.MVVM.ViewModelBridge,
  iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Model.Interfaces, Vcl.DBCtrls, Vcl.Mask, uniLabel, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses, uniPanel;

type

  [diViewFor(IOrder)]
  TViewOrderList = class(TViewBaseForList)
    GridOrders: TDBGrid;
    BSMasterID: TIntegerField;
    BSMasterOrderDate: TDateTimeField;
    BSMasterNote: TStringField;
    BSMasterCustomerName: TStringField;
    BSMasterGrandTotal: TCurrencyField;
    ButtonHistory: TSpeedButton;
    Label1: TLabel;
    DBEditWhereID: TDBEdit;
    Label3: TLabel;
    DBComboBoxWhereOrderState: TDBComboBox;
    Label5: TLabel;
    DBEditWhereNote: TDBEdit;
    Shape1: TShape;
    DBEditWhereFromDate: TDBEdit;
    Label4: TLabel;
    DBEditWhereToDate: TDBEdit;
    Label2: TLabel;
    BSWhereOrderID: TIntegerField;
    BSWhereOrderState: TStringField;
    BSWhereNote: TStringField;
    BSWhereFromDate: TDateField;
    acWhereShowHistory: TioViewAction;
    BSWhereToDate: TDateField;
    BSMasterOrderState: TStringField;
    Label6: TLabel;
    DBEditCustomerName: TDBEdit;
    Label7: TLabel;
    DBEditRowsDescription: TDBEdit;
    BSWhereCustomerName: TStringField;
    BSWhereRowsDescription: TStringField;
    procedure GridOrdersDblClick(Sender: TObject);
  private
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

{ TViewOrders }

constructor TViewOrderList.Create(AOwner: TComponent);
begin
  inherited;
  io.Enums.FillStrings<TOrderState>(DBComboBoxWhereOrderState.Items);
end;

procedure TViewOrderList.GridOrdersDblClick(Sender: TObject);
begin
  acShowOrSelect.Execute;
end;

end.
